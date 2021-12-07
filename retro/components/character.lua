
local Character = class("Character", Component)
Character.walking_speed = 1
Character.direction = nil
Character.cycle = 0
function Character:init(params)
     self.direction = {math.random() - 0.5, math.random() - 0.5}
     Component.init(self, params) end
function Character:on_tick(delta)
    Component.on_tick(self, delta)
    self.transform.position[1] += self.direction[1] * (delta * self.walking_speed)
    self.transform.position[2] += self.direction[2] * (delta * self.walking_speed)
    if (math.random() > 0.97) then
        self.direction = {math.random() - 0.5, math.random() - 0.5}
    end
    local title_comp = self:get_component("TextRenderer")
    local sprite_comp = self:get_component("SpriteRenderer")
    sprite_comp:update({ opacity = math.abs(math.sin(self.cycle)) })
    self.cycle += 0.1 * delta * self.walking_speed
    if (title_comp ~= nil) then
        title_comp:update({
            text = self.uuid
        })
    end
end
return Character
