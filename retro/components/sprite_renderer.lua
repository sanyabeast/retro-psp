local SpriteRenderer = class("SpriteRenderer", Component)
SpriteRenderer.is_renderable = true
function SpriteRenderer:init(params)
    self:super("init", params)
    self.image = Image.load(self.src)
end

return SpriteRenderer
