-- created by @sanyabeast 6 DEC 2021
local GameObject = class("GameObject", Object)
local TRANSFORM_COMPONENT_TEMPLATE = {name = "Transform"}
GameObject.dont_apply = {
    children = true,
    components = true,
    position = true,
    rotation = true,
    scale = true
}
GameObject.is_game_object = true
GameObject.visible = true
function GameObject:on_create(params)
    Object.on_create(self, params)
    self.components = List()
    self.children = List()
    if (params.children ~= nil) then
        each(params.children, function(data, id)
            local child = GameObject(data)
            self:add(child)
        end)
    end
    self.transform = self:add_component(TRANSFORM_COMPONENT_TEMPLATE)
    if (params.components ~= nil) then
        each(params.components,
             function(data, id) self:add_component(data, id) end)

    end
    if (params.position ~= nil) then
        self.transform.position.set(params.position)
    end

end
function GameObject:add(child)
    self.children:add(child)
    child.parent = self
end
function GameObject:tick(delta)
    Object.tick(self, delta)
    self:on_tick(delta)
    self.children:each(function(child, v) child:tick() end);
    self.components:each(function(component)
        if (component.enabled) then component:tick() end
    end);
end
function GameObject:add_component(comp_data)
    local new_comp = Assets:create_component(comp_data.name, comp_data.params)
    new_comp.game_object = self
    new_comp.children = self.children
    new_comp.components = self.components
    new_comp.transform = self.transform
    self.components:add(new_comp)
    return new_comp
end
return GameObject
