collectgarbage()

-- PRELOADING ENGINE`S CORE
dofile("retro/environment.lua")
dofile("retro/core.lua")

-- INVOKING APPLICATION SPECIFIC SRIPTS
dofile("apps/walkingdead/index.lua")

local instance1 = GameObject()
local instance2 = GameObject()
local instance3 = GameObject()

-- CREATING APPLICATION INSTANCE
app = GameObject(APPLICATION_PREFAB)

-- CREATING TICKER AND RUNNING IT
clock = Clock({rate = 15})
clock:start({
    on_start = function() end,
    on_tick = function()
        app:tick()
        screen.print(0, 10, tostring(Component.created_total), 0.4)
        screen.print(0, 20, tostring(math.random()), 0.4)
        screen.print(0, 30, tostring(os.time()), 0.4)
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
