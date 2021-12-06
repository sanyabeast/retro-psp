-- created by @sanyabeast 6 DEC 2021
local Component = class("Component", Object)

Component.is_component = true
Component.is_renderable = false
Component.created_total = 0
function Component:on_create(params)
    Object.on_create(self, params)
    Component.created_total = Component.created_total + 1
end
function Component:on_tick(delta)
    self:super("on_tick", delta)
    if (self.is_renderable) then self:on_render() end
end
function Component:on_render() return end
return Component
