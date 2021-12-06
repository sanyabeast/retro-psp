-- created by @sanyabeast 6 DEC 2021
local Object = require("retro.object")
local Clock = class("Clock", Object)
Clock.prev_tick = os.clock()
Clock.delta = 1
Clock.rate = 30
function Clock:init(params)
    self.super.init(self, params)
    self.on_start = params.on_start or function() return end
    self.on_tick = params.on_tick or function() return end
    self.on_destroy = params.on_destroy or function() return end

end
function Clock:start(params)
    self.on_start = params.on_start or function() return end
    self.on_tick = params.on_tick or function() return end
    while true do
        current_time = now()
        min_delta = 1000 / self.rate;
        self.delta = current_time - self.prev_tick
        if (self.delta >= min_delta) then
            params.on_tick()
            self.prev_tick = current_time
        end
    end
end
return Clock
