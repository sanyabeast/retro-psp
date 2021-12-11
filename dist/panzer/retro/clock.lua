-- created by @sanyabeast 6 DEC 2021
local Object = require("retro.object")
local Clock = class("Clock", Object)
NOW = now()
Clock.prev_tick = NOW
Clock.delta = 1
Clock.abs_delta = 1
Clock.rate = 60
Clock.cpu = 333

CLOCK_TICK_ID = 0
CLOCK_LOOP_ID = 0
CLOCK_TIME_SINCE_START = 0

function Clock:init(params)
    Object.init(self, params)
    os.cpu(self.cpu)
    self.callbacks = {
        on_start = params.on_start or function()
                return
            end,
        on_tick = params.on_tick or function()
                return
            end,
        on_loop = params.on_loop or function()
                return
            end,
        on_destroy = params.on_destroy or function()
                return
            end
    }
    self.loop_cr =
        coroutine.create(
        function()
            while true do
                self.callbacks.on_loop(self.delta)

                NOW = now()
                min_delta = 1000 / self.rate
                self.min_delta = min_delta
                self.abs_delta = NOW - self.prev_tick
                self.delta = math.round_to(self.abs_delta / min_delta, TIME_DELTA_APPROX)
                if (self.abs_delta >= min_delta) then
                    self.prev_tick = NOW
                    self.callbacks.on_tick(self.delta)
                    CLOCK_TICK_ID = CLOCK_TICK_ID + 1
                end

                CLOCK_LOOP_ID = CLOCK_LOOP_ID + 1
                CLOCK_TIME_SINCE_START = CLOCK_TIME_SINCE_START + self.abs_delta
            end
        end
    )
end
function Clock:start(params)
    self:log("starting...")
    self.callbacks.on_start()
    coroutine.resume(self.loop_cr)
end
function Clock:stop()
    self.loop_cr.yield()
    self.callbacks.on_destroy()
end
return Clock
