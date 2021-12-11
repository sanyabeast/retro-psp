local TrailRenderer = class("TrailRenderer", Component)
TrailRenderer.is_renderable = true
TrailRenderer.render_order = 0
TrailRenderer.intertia = 20000
TrailRenderer.segments = 3
function TrailRenderer:init(params)
    Component.init(self, params)
    self.color = Color.new(233, 255, 99)
    self.points = {}
    for i = 1, self.segments, 1 do
        table.insert(self.points, {i * 20, i * 20})
    end
    self:update_render_data()
end
function TrailRenderer:on_tick(delta)
    return
end
function TrailRenderer:update_render_data()
    self.render_data = {
        drawing = {
            type = "primitive",
            shape = "line",
            color = self.color,
            render_order = self.render_order,
            points = self.points
        }
    }
end
return TrailRenderer
