-- created by @sanyabeast 6 DEC 2021
collectgarbage()

-- comments of type "-- [SOMETHING_WRITTEN_HERE]" are placeholders that are replaced by retro-psp/dev.js script during work with nececcesy injections
-- dont remove them untill you dont know what you are doing.
-- [BEGIN]
-- [ENVIRONMENT_PREPARE]
dofile("retro/environment.lua")
-- [ENGINE_PREPARE]
dofile("retro/core.lua")
-- [APP_PREPARE]
-- [APP_CREATE]
app = App(APP_PREFAB)
-- [CLOCK_INIT]
clock = Clock({
    rate = 60,
    on_start = function()
        -- [ON_CLOCK_START]
        Renderer.on_render = function(mode2d)
            if (not mode2d) then amg.mode2d(1) end
            print_basic_debug(app, clock, clock.delta)
            amg.mode2d(0)
        end
    end,
    on_tick = (function(delta)
        -- [ON_CLOCK_TICK]
        app:tick(delta)
        Renderer.render(delta)
    end),
    on_loop = function()
        -- [ON_CLOCK_LOOP]
        return
    end,
    on_destroy = function() end
})

-- [CLOCK_START]
clock:start()
log("main", "application running...")

