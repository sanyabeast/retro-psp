local SpriteRenderer = class("SpriteRenderer", Component)
SpriteRenderer.is_renderable = true
SpriteRenderer.opacity = 1
-- 0 - normal, 1 - additive, 2 - subtractive, 3 - tint
SpriteRenderer.blending = 0
SpriteRenderer.blend_power = 0.5
function SpriteRenderer:init(params)
    self.tint = Color.new(255, 0, 255)
    self.size = {32, 32}
    Component.init(self, params)
end
function SpriteRenderer:on_create(params)
    Component.on_create(self, params)
    self.render_data = {
        sprite = {
            type = "image",
            src = self.src,
            opacity = self.opacity,
            blending = self.blending,
            blend_power = 1,
            tint = self.tint,
            size = self.size
        }
    }
end
return SpriteRenderer
