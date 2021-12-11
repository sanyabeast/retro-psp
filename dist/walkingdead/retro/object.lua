-- created by @sanyabeast 6 DEC 2021
local Object = class("Object")
Object.dont_apply = {}
function Object:init(params)
    if (type(params) ~= "table") then
        params = {}
    end
    self.meta = {params = params, ticking = {rate = 15, id = 0}}
    self.uuid = self.__name .. self.id
    self:apply_params(params)
    self:on_create(params)
end
function Object:start()
    self:on_start()
end
function Object:apply_params(params)
    local o = self
    local need_update = false
    each(
        params,
        function(value, key)
            if self.dont_apply[key] ~= true then
                need_update = (o[key] ~= value) or need_update
                o[key] = value
            end
        end
    )
    return need_update
end
function Object:tick()
    self.meta.ticking.rate = self.tick_rate
    self.meta.ticking.id = self.meta.ticking.id + 1
end
function Object:update(params)
    local need_update = self:apply_params(params)
    if (need_update) then
        self:on_update(params)
    end
end
function Object:log(...)
    return log(self.__name, ...)
end
function Object:on_create(params)
    return
end
function Object:on_enable()
    return
end
function Object:on_disable()
    return
end
function Object:on_destroy()
    return
end
function Object:on_update()
    return
end
function Object:on_tick(delta)
    return
end
function Object:on_start()
    return
end

return Object
