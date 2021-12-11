-- created by @sanyabeast 6 DEC 2021
local Component = class("Component", Object)

Component.is_component = true
Component.render_data = nil
Component.created_total = 0
Component.enabled = true
Component.tick_rate = 60
function Component:init(params)
    Object.init(self, params)
    self.component_name = self.__name
end
function Component:on_create(params)
    Object.on_create(self, params)
    self.meta.ticking.prev_date = NOW
    Component.created_total = Component.created_total + 1
end
function Component:tick(delta)
    Object.tick(self, delta)
    local current_date = NOW
    local abs_delta = current_date - self.meta.ticking.prev_date
    local min_delta = 1000 / self.meta.ticking.rate
    local delta = math.round_to(abs_delta / min_delta, TIME_DELTA_APPROX)
    if (abs_delta >= min_delta) then
        self:on_tick(delta)
        self.meta.ticking.prev_date = current_date
    end
    if (self.render_data ~= nil) then
        for k, v in pairs(self.render_data) do
            Renderer.add({transform = v.transform or self.transform, params = v})
        end
    end
end
function Component:update_render_data() return end
-- COMPONENTS SELCTIVE
function Component:get_component(...) return self.game_object:get_component(...) end
return Component
