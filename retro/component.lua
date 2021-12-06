-- created by @sanyabeast 6 DEC 2021
local Component = class("Component", Object)

Component.is_component = true
Component.is_renderable = false
Component.created_total = 0
Component.enabled = true
Component.tick_rate = 15
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
    if (self.is_renderable) then self:on_render() end
end
function Component:on_render() return end
return Component
