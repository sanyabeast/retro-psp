
local Character = class("Character", Component)
Character.walking_speed = 1
function Character:init(params) Component.init(self, params) end
function Character:on_tick(delta)
    Component.on_tick(self, delta)
    self.transform.position[1] += 1 * (delta * self.walking_speed)
end
return Character
