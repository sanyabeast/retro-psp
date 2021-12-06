local SpriteRenderer = class("SpriteRenderer", Component)
SpriteRenderer.is_renderable = true
function SpriteRenderer:on_create(params)
    Component.on_create(self, params)
    -- error("retro/res/char_02.png")
    self.img = Image.load(self.src)
    -- error(tostring(self.img))
    self:log(self.src)
end
function SpriteRenderer:on_render()
    local t = self.transform
    -- while image loading it is actualy the nil value
    if (self.img ~= nil) then self.img:blit(t.g_position[1], t.g_position[2]) end
end
function SpriteRenderer:on_tick(delta)
    Component.on_tick(self, delta)
    -- self.transform.position[1] +=1 * delta
end

return SpriteRenderer
