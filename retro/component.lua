-- created by @sanyabeast 6 DEC 2021
local Component = class("Component", Object)

Component.is_component = true
Component.render_data = nil
Component.created_total = 0
Component.enabled = true
Component.tick_rate = 15
function Component:init(params)
    Object.init(self, params)
    self.component_name = self.__name
end
function Component:on_create(params)
    Object.on_create(self, params)
    self.meta.ticking.prev_date = now()
    Component.created_total = Component.created_total + 1
end
function Component:tick(delta)
    Object.tick(self, delta)
    local current_date = now()
    local delta = current_date - self.meta.ticking.prev_date
    local min_delta = 1000 / self.meta.ticking.rate
    if (delta >= min_delta) then
        self:on_tick(delta / min_delta)
        self.meta.ticking.prev_date = current_date
    end
    if (self.render_data ~= nil) then
        for k, v in pairs(self.render_data) do
            Renderer.add({transform = self.transform, params = v})
        end
    end
end
-- COMPONENTS SELCTIVE
function Component:get_component(...) return self.game_object:get_component(...) end
return Component
