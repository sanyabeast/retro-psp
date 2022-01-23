-- created by @sanyabeast 6 DEC 2021
SESSION_ID = APP_NAME .. "_" .. tostring(os.date("%I:%M %p"))
SCREEN_WIDTH = 480
SCREEN_HEIGHT = 272
TIME_DELTA_APPROX = 3
NOW = 0

math.randomseed(os.time())

function __DUMMY_FUNC()
    return
end

-- CLASS
local __OBJECT_ID = 0
function __CLASS_NEW(Class, params, ParentClass)
    local self = setmetatable({}, Class)
    self.id = __OBJECT_ID
    __OBJECT_ID = __OBJECT_ID + 1
    if (ParentClass ~= nil) then
        self.__super = ParentClass
        ParentClass.new(self, params)
    end
    self:init(params)
    return self
end
function class(name, ParentClass)
    local Class = {}
    Class.__index = Class
    Class.__name = name
    local meta = {__call = function(cls, ...)
            return cls.new(...)
        end}
    if (ParentClass ~= nil) then
        meta.__index = ParentClass
    end
    setmetatable(Class, meta)
    function Class.new(params)
        return __CLASS_NEW(Class, params, ParentClass)
    end
    return Class
end

-- DOING MATH PATCH
dofile("retro/math.lua")

-- HELPERS
function now()
    return os.clock() * 1000
end
function each(table, callback)
    for key, value in pairs(table) do
        callback(value, key, table)
    end
end

function splitstring(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t = {}
    for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
        table.insert(t, str)
    end
    return t
end
function rstringreplace(input, a, b)
    return input:gsub("%" .. a, b)
end
function stringreplace(input, a, b)
    return input:gsub(a:gsub("%-", "%%-"), b)
end
function rpairs(t)
    return function(t, i)
        i = i - 1
        if i ~= 0 then
            return i, t[i]
        end
    end, t, #t + 1
end

function merge(t1, t2)
    if (type(t1) ~= "table") then
        return t2
    end
    if (type(t2) ~= "table") then
        return {}
    end
    for k, v in pairs(t2) do
        t1[k] = v
    end
    return t1
end

function deep_merge(t1, t2)
    for k, v in pairs(t2) do
        if type(v) == "table" then
            if type(t1[k] or false) == "table" then
                deep_merge(t1[k] or {}, t2[k] or {})
            else
                t1[k] = v
            end
        else
            t1[k] = v
        end
    end
    return t1
end

-- PATHS
ROOT_PATH = files.cdir() .. "/"
function relative_path(inp)
    return stringreplace(inp, ROOT_PATH, "")
end

--  EXTRA
function dump(o)
    if type(o) == "table" then
        local s = "{ "
        for k, v in pairs(o) do
            if type(k) ~= "number" then
                k = '"' .. k .. '"'
            end
            s = s .. "[" .. k .. "] = " .. dump(v) .. ","
        end
        return s .. "} "
    else
        return tostring(o)
    end
end

-- DEBUG
function print_basic_debug(app, clock, delta)
    screen.print(0, 0, "APP_NAME: " .. "walkingdead", 0.35)
    screen.print(0, 12, "ROOT: " .. ROOT_PATH, 0.35)
    screen.print(0, 24, "CPU/BUS: " .. os.cpu() .. "/" .. os.bus(), 0.35)
    screen.print(
        0,
        36,
        "FREE RAM (KB): " .. math.floor((os.ram() / 1024)) .. "/" .. (math.floor(os.totalram() / 1024)),
        0.35
    )
    screen.print(0, 48, tostring(delta), 0.35)
    screen.print(0, 60, "DATE: " .. tostring(NOW), 0.35)

    screen.print(0, 72, "APP TICKS: " .. tostring(app.meta.ticking.id), 0.35)
    screen.print(0, 84, "CLOCK RATE: " .. tostring(clock.rate), 0.35)
end

--  LOGGING
function err(tag, msg)
    error(tostring(tag) .. ": " .. tostring(msg))
end
function warn(tag, msg)
    ini.write("debug.log", "SESSION_" .. SESSION_ID, "[" .. os.date("%I:%M %p") .. "] [" .. tag .. "] [!] ", msg)
end
function log(tag, msg)
    ini.write(
        "debug.log",
        "SESSION_" .. SESSION_ID,
        "[" .. os.date("%I:%M %p") .. "] [" .. tostring(tag) .. "] [i] ",
        tostring(msg)
    )
end
function logdump(tag, data)
    if (type(data) == "table") then
        ini.write(
            "debug.log",
            "SESSION_" .. SESSION_ID,
            "[" .. os.date("%I:%M %p") .. "] [" .. tostring(tag) .. "] [i] ",
            dump(data)
        )
    else
        return log(tag, data)
    end
end

local _on_debug = onDebug
onDebug = function(msg)
    log("error", msg)
    _on_debug()
end

Image = image
Color = color
Model3D = model3d
Cam3D = cam3d
Math = math
Draw = draw
Buttons = buttons
