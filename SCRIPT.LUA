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
    on_start = function() end,
    on_tick = (function(delta)
        print_basic_debug(app, clock, delta)
        app:tick()
        Renderer.render(delta)
    end),
    on_loop = function() return end,
    on_destroy = function() end
})

clock:start()
log("main", "application running...")
