local SpriteRenderer = class("SpriteRenderer", Component)
SpriteRenderer.is_renderable = true
SpriteRenderer.opacity = 1
-- 0 - normal, 1 - additive, 2 - subtractive, 3 - tint
SpriteRenderer.blending = 0
SpriteRenderer.blend_power = 0.5
SpriteRenderer.render_order = 0
function SpriteRenderer:init(params)
    self.tint = Color.new(255, 0, 255)
    self.size = {32, 32}
    Component.init(self, params)
end
function SpriteRenderer:on_create(params)
    Component.on_create(self, params)
    self:update_render_data()
end
function SpriteRenderer:on_update()
    self:update_render_data()
end
function SpriteRenderer:update_render_data()
    self.render_data = {
        sprite = {
            type = "image",
            src = self.src,
            opacity = self.opacity,
            blending = self.blending,
            blend_power = 1,
            tint = self.tint,
            size = self.size,
            render_order = self.render_order
        }
    }
end
return SpriteRenderer
