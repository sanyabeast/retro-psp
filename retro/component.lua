-- created by @sanyabeast 6 DEC 2021
local Object = require("retro.object")
local Component = class("Component", Object)
Component.is_component = true
Component.created_total = 0
function Component:on_create(params)
    Object.on_create(self, params)
    Component.created_total = Component.created_total + 1
end
return Component
