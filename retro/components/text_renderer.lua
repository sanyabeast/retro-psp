local TextRenderer = class("TextRenderer", Component)
TextRenderer.opacity = 1
TextRenderer.font = nil
TextRenderer.font_size = 0.6
TextRenderer.text = ""
TextRenderer.color = nil
TextRenderer.shadow_color = nil
function TextRenderer:on_create(params)
    Component.on_create(self, params)
    self.render_data = {
        text = {
            type = "text",
            text = self.text,
            opacity = self.opacity,
            font_size = self.font_size,
            font = self.font,
            color = self.color,
            shadow_color = self.shadow_color
        }
    }
end
function TextRenderer:on_update(params)
    for k, v in pairs(params) do self.render_data.text[k] = v end
end
return TextRenderer
