local BasicBot = class("BasicBot", Component)
BasicBot.move_velocity = 1
BasicBot.is_renderable = true
BasicBot.tick_rate = 60
BasicBot.bubble_text = nil
BasicBot.move_inertia = 40
BasicBot.drag = 0
BasicBot.phrases = {}
BasicBot.cycle = 0
function BasicBot:init(params)
    Component.init(self, params)
    self.bubble_text_color = Color.new(255, 255, 255)
    self.current_direction = {0, 0, 0}
    self.target_direction = {0, 0, 0}
    self:update_render_data()

end
function BasicBot:on_start()
    self:get_component_with_class("body"):update({
        color = Color.new(0, 188, 212)
    })
    self.target_direction[1] = Math.random(-1, 1)
    self.target_direction[2] = Math.random(-1, 1)
end
function BasicBot:apply_params(params)
    Component.apply_params(self, params)
    self.drag = 1 / self.move_inertia
end
function BasicBot:on_tick(delta)
    self.cycle = self.cycle + delta
    self.current_direction[1] = Math.lerpf(self.current_direction[1],
                                           self.target_direction[1],
                                           self.drag * delta);
    self.current_direction[2] = Math.lerpf(self.current_direction[2],
                                           self.target_direction[2],
                                           self.drag * delta);

    self.game_object:translate(self.current_direction[1] * delta *
                                   self.move_velocity,
                               self.current_direction[2] * delta *
                                   self.move_velocity, 0)

    if (Math.random() > 0.95) then
        self.target_direction[1] = Math.random() - 0.5
        self.target_direction[2] = Math.random() - 0.5
    end

end
function BasicBot:update_render_data()
    self.render_data = {
        text = {
            type = "text",
            text = "Sup, dude!",
            opacity = 1,
            font_size = 0.5,
            color = bubble_text_color,
            render_order = 0
        }
    }
end
return BasicBot
