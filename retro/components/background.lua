local Transform = require("retro.components.Transform")
local Background = class("Background", Component)
Background.is_renderable = true
Background.opacity = 1
-- 0 - normal, 1 - additive, 2 - subtractive, 3 - tint
Background.blending = 0
Background.blend_power = 0.5
Background.render_order = -1
function Background:init(params)
    self.tint = Color.new(255, 0, 255)
    self.background_transform = Transform()
    Component.init(self, params)
end
function Background:on_create(params)
    log("Background", "created " .. self.src)
    Component.on_create(self, params)
    self:update_render_data()
end
function Background:update_render_data()
    self.render_data = {
        sprite = {
            type = "image",
            src = self.src,
            opacity = 1,
            blending = 0,
            blend_power = 1,
            size = {SCREEN_WIDTH, SCREEN_HEIGHT},
            render_order = self.render_order,
            transform = self.background_transform
        }
    }
end
return Background
