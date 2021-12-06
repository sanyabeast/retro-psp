-- created by @sanyabeast 6 DEC 2021
local GameObject = class("GameObject", Object)
GameObject.dont_apply = {children = true, components = true}
GameObject.is_game_object = true
function GameObject:on_create(params)
    self:super("on_create", params)
    self.components = List()
    self.children = List()
    if (params.children ~= nil) then
        each(params.children, function(data, id)
            local child = GameObject(data)
            self:add(child)
        end)
    end
    if (params.components ~= nil) then
        each(params.components,
             function(data, id) self:add_component(data, id) end)
    end
    
end
function GameObject:add(child) self.children:add(child) end
function GameObject:on_tick(delta)
    self:super("on_tick", delta)
    self.children:each(function(child, v) child:tick() end);
    self.components:each(function(component) component:on_tick() end);
end
function GameObject:add_component(comp_data)
    local new_comp = Assets:create_component(comp_data.name, comp_data.params)
    self.components:add(new_comp)
end
return GameObject
