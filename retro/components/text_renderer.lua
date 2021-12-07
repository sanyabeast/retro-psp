local TextRenderer = class("TextRenderer", Component)
TextRenderer.opacity = 1
TextRenderer.font = nil
TextRenderer.font_size = 0.6
TextRenderer.text = ""
TextRenderer.color = nil
TextRenderer.shadow_color = nil
TextRenderer.render_order = 0
function TextRenderer:on_create(params)
    Component.on_create(self, params)
    self:update_render_data()
end
function TextRenderer:on_update(params) self:update_render_data() end
function TextRenderer:update_render_data()
    self.render_data = {
        text = {
            type = "text",
            text = self.text,
            opacity = self.opacity,
            font_size = self.font_size,
            font = self.font,
            color = self.color,
            shadow_color = self.shadow_color,
            render_order = self.render_order
        }
    }
end
return TextRenderer
