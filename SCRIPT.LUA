-- created by @sanyabeast 6 DEC 2021
collectgarbage()

-- 
APP_NAME = "walkingdead"

-- PRELOADING ENGINE`S CORE
dofile("retro/environment.lua")
dofile("retro/core.lua")

-- INVOKING APPLICATION SPECIFIC SRIPTS
dofile("apps/"..APP_NAME.."/index.lua")

local instance1 = GameObject()
local instance2 = GameObject()
local instance3 = GameObject()

img = image.load("retro/res/char_02.png")
f = files.list("retro/components/")

-- CREATING APPLICATION INSTANCE
app = GameObject(APP_PREFAB)
x = 0
-- CREATING TICKER AND RUNNING IT
clock = Clock({rate = 30})
clock:start({
    on_start = function() end,
    on_tick = function()
        app:tick()

        img:rotate(0)
        img:resize(32, 32)            
        img:blit(50, 50)

        img:resize(64, 64) 
        img:rotate(x)           
        img:blit(x, 150, x)
        x += 1
        x = math.fmod(x, 255)

        print_basic_debug(app, clock)
        screen.flip()
    end,
    on_destroy = function() end
})
