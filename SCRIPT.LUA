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
clock = Clock({rate = 15})
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

        screen.print(0, 10, tostring(splitstring(f[1].path, ":")[2]:sub(2)), 0.4)
        screen.print(0, 20, tostring(math.random()), 0.4)
        screen.print(0, 30, tostring(_G["test"]), 0.4)
        screen.print(0, 40, tostring(instance1.__name), 0.4)
        screen.print(0, 50, tostring(clock.rate), 0.4)
        screen.print(0, 60, "stage children: " ..
                         tostring(app.children:get(0).children.length), 0.4)
        screen.print(0, 70,
                     "root components: " .. tostring(app.components.length), 0.4)

        screen.print(0, 80, "app tick id: " .. tostring(app.meta.ticking.id),
                     0.4)
        
        
        screen.flip()
    end,
    on_destroy = function() end
})
