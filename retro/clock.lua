-- created by @sanyabeast 6 DEC 2021
local Object = require("retro.object")
local Clock = class("Clock", Object)
Clock.prev_tick = now()
Clock.delta = 1
Clock.rate = 30
Clock.cpu = 333
function Clock:init(params)
    Object.init(self, params)
    self.on_start = params.on_start or function() return end
    self.on_tick = params.on_tick or function() return end
    self.on_loop = params.on_loop or function() return end
    self.on_destroy = params.on_destroy or function() return end
end
function Clock:start(params)
    os.cpu(self.cpu)
    self.on_start = params.on_start or function() return end
    self.on_tick = params.on_tick or function() return end
    self.on_loop = params.on_loop or function() return end
    self.on_destroy = params.on_destroy or function() return end

    self.on_start()
    while true do
        current_time = now()
        min_delta = 1000 / self.rate;
        self.delta = current_time - self.prev_tick
        if (self.delta >= min_delta) then
            self.prev_tick = current_time
            self.on_tick(self.delta / min_delta)
        end
        self.on_loop()
    end

    self.on_destroy()
end
return Clock
