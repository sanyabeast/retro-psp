-- created by @sanyabeast 6 DEC 2021
Clock = require("retro.clock")
Object = require("retro.object")
GameObject = require("retro.game_object")
Component = require("retro.component")
Assets = require("retro.assets")

App = class("App", GameObject)
function App:on_tick(delta)
    GameObject.on_tick(self, delta)
    self.transform:update_global_transform()
end
