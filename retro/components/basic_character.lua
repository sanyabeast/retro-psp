local BasicCharacter = class("BasicCharacter", Component)
BasicCharacter.move_velocity = 1
BasicCharacter.is_renderable = true
BasicCharacter.tick_rate = 60
BasicCharacter.bubble_text = nil
BasicCharacter.move_inertia = 20
BasicCharacter.drag = 0
BasicCharacter.phrases = {}
function BasicCharacter:init(params)
    Component.init(self, params)
    self.bubble_text_color = Color.new(255, 255, 255)
    self.current_direction = {0, 0, 0}
    self.target_direction = {0, 0, 0}
    self:update_render_data()
end

function BasicCharacter:apply_params(params)
    Component.apply_params(self, params)
    self.drag = 1 / self.move_inertia
end

function BasicCharacter:on_tick(delta)
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

    self.target_direction[1] = Buttons.analogx / 255
    self.target_direction[2] = Buttons.analogy / 255

end
function BasicCharacter:update_render_data()
    self.render_data = {
        text = {
            type = "text",
            text = "Hi there!",
            opacity = 1,
            font_size = 0.45,
            color = bubble_text_color,
            render_order = 0
        }
    }
end
return BasicCharacter
