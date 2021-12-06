-- created by @sanyabeast 6 DEC 2021
local Object = require("retro.object")
local GameObject = class("GameObject", Object)
GameObject.dont_apply = {children = true, components = true}
GameObject.is_game_object = true
function GameObject:on_create(params)
    self.components = List()
    self.children = List()
    if (params.children ~= nil) then
        each(params.children, function(data, id)
            child = GameObject(data)
            self:add(child)
        end)
    end
    if (params.components ~= nil) then
        each(params.components,
             function(data, id) self:add_component(data, id) end)
    end
    self.super.on_create(self, params);
end
function GameObject:add(child) self.children:add(child) end
function GameObject:on_tick()
    self.super.on_tick(self)
    self.children:each(function(child, v) child:tick() end);
    self.components:each(function(component) component:tick() end);
end
function GameObject:add_component(params)
    new_comp = Component(params)
    self.components:add(new_comp)
end
return GameObject
