local PrimitiveRenderer = class("PrimitiveRenderer", Component)
PrimitiveRenderer.is_renderable = true
PrimitiveRenderer.opacity = 1
-- 0 - normal, 1 - additive, 2 - subtractive, 3 - color
PrimitiveRenderer.blending = 0
PrimitiveRenderer.blend_power = 0.5
PrimitiveRenderer.render_order = 0
PrimitiveRenderer.shape = "circle"
PrimitiveRenderer.circle_segments = 4
PrimitiveRenderer.circle_radius = 10
PrimitiveRenderer.gradient = false
PrimitiveRenderer.outline = false
function PrimitiveRenderer:init(params)
    self.color = Color.new(233, 30, 99)
    -- color2 used when gradient flag set to true
    self.color2 = Color.new(0, 0, 255)
    self.outline_color = Color.new(255, 255, 255, 255)
    Component.init(self, params)
end
function PrimitiveRenderer:on_create(params)
    Component.on_create(self, params)
    self:update_render_data()
end
function PrimitiveRenderer:on_update() self:update_render_data() end
function PrimitiveRenderer:update_render_data()
    self.render_data = {
        drawing = {
            type = "primitive",
            shape = self.shape,
            circle_segments = self.circle_segments,
            circle_radius = self.circle_radius,
            opacity = self.opacity,
            blending = self.blending,
            blend_power = 1,
            color = self.color,
            outline_color = self.outline_color,
            outline = self.outline,
            render_order = self.render_order
        }
    }
end
return PrimitiveRenderer
