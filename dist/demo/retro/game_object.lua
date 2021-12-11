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
    self.components = {}
    self.children = {}
    if (params.children ~= nil) then
        each(
            params.children,
            function(data, id)
                local child = GameObject(data)
                self:add(child)
            end
        )
    end
    self.transform = self:add_component(TRANSFORM_COMPONENT_TEMPLATE)
    if (params.components ~= nil) then
        each(
            params.components,
            function(data, id)
                self:add_component(data, id)
            end
        )
    end
    if (params.position ~= nil) then
        math.vector.set(self.transform.position, params.position)
    end
end
function GameObject:add(child)
    table.insert(self.children, child)
    child.parent = self
end
function GameObject:tick(delta)
    Object.tick(self, delta)
    self:on_tick(delta)
    for i, child in pairs(self.children) do
        child:tick()
    end
    for i, component in pairs(self.components) do
        if (component.enabled) then
            component:tick()
        end
    end
end
function GameObject:start(delta)
    Object.start(self, delta)
    for i, child in pairs(self.children) do
        child:start()
    end
    for i, component in pairs(self.components) do
        if (component.enabled) then
            component:start()
        end
    end
end
function GameObject:add_component(comp_data)
    -- log("GameObject", "adding comp " .. comp_data.name)
    local new_comp =
        Assets:create_component(
        comp_data.name,
        merge(
            comp_data.params,
            {
                game_object = self,
                children = self.children,
                components = self.components,
                transform = self.transform
            }
        )
    )

    table.insert(self.components, new_comp)
    return new_comp
end
-- COMPONENTS SELECTING
function GameObject:get_component(name)
    local r
    for i, component in pairs(self.components) do
        if (component.component_name == name) then
            r = component
            break
        end
    end
    return r
end
-- TRANSFORMATIONS
function GameObject:translate(x, y, z)
    self.transform:translate(x, y, z)
end
return GameObject
