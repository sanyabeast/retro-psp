local Transform = require("retro.components.transform")
local MeshRenderer = class("MeshRenderer", Component)
MeshRenderer.is_renderable = true
MeshRenderer.src = nil
-- 0 - normal, 1 - additive, 2 - subtractive, 3 - tint
MeshRenderer.render_order = 0
function MeshRenderer:init(params) Component.init(self, params) end
function MeshRenderer:on_create(params)
    Component.on_create(self, params)
    self:log("creating" .. dump(self.meta.position))
    self:update_render_data()
end
function MeshRenderer:on_update() self:update_render_data() end
function MeshRenderer:update_render_data()
    self.render_data = {
        mesh = {type = "mesh", src = self.src, render_order = self.render_order}
    }
end
return MeshRenderer
