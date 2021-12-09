-- created by @sanyabeast 6 DEC 2021
collectgarbage()
-- 
APP_NAME = "walkingdead"
-- PRELOADING ENGINE`S CORE
dofile("retro/environment.lua")
dofile("retro/core.lua")
-- INVOKING APPLICATION SPECIFIC SRIPTS
dofile("apps/" .. APP_NAME .. "/index.lua")
-- CREATING APPLICATION INSTANCE
app = App(APP_PREFAB)
-- CREATING TICKER AND RUNNING IT

clock = Clock({
    rate = 30,
    on_start = function()
        Renderer.on_render = function(mode2d)
            if (not mode2d) then amg.mode2d(1) end
            print_basic_debug(app, clock, clock.delta)
            amg.mode2d(0)
        end
    end,
    on_tick = (function(delta)
        app:tick(delta)
        Renderer.render(1)
    end),
    on_loop = function() return end,
    on_destroy = function() end
})

clock:start()
log("main", "application running...")
