-- created by @sanyabeast 6 DEC 2021
REF_FRAMETIME = 1000 / 30
SESSION_ID = APP_NAME .. "_" .. tostring(os.date("%I:%M %p"))

-- CLASS
local __OBJECT_ID = 0
function __CLASS_NEW(Class, params, ParentClass)
    local self = setmetatable({}, Class)
    self.id = __OBJECT_ID
    __OBJECT_ID = __OBJECT_ID + 1
    if (ParentClass ~= nil) then
        self.__super = ParentClass
        ParentClass.new(self, params);
    end
    self:init(params)
    return self
end
function class(name, ParentClass)
    local Class = {}
    Class.__index = Class
    Class.__name = name
    local meta = {__call = function(cls, ...) return cls.new(...) end}
    if (ParentClass ~= nil) then meta.__index = ParentClass end
    setmetatable(Class, meta)
    function Class.new(params) return __CLASS_NEW(Class, params, ParentClass) end
    return Class
end

-- LIST
List = class("List")
function List:init(params) self.length = 0 end
function List:add(item)
    self[self.length + 1] = item
    self.length = self.length + 1
end
function List:get(index) return self[index + 1] end
function List:each(callback)
    for i = 1, self.length, 1 do callback(self[i], i, self) end
end

-- HELPERS
function now() return os.clock() * 1000 end
function each(table, callback)
    for key, value in pairs(table) do callback(value, key, table) end
end

function splitstring(inputstr, sep)
    if sep == nil then sep = "%s" end
    local t = {}
    for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
        table.insert(t, str)
    end
    return t
end
function rstringreplace(input, a, b) return input:gsub("%" .. a, b) end
function stringreplace(input, a, b) return input:gsub(a:gsub("%-", "%%-"), b) end

-- MATH
Vec3 = class("Vec3", List)
function Vec3:init(params)
    List.init(self, params)
    self:add(params[1] or 0)
    self:add(params[2] or 0)
    self:add(params[3] or 0)
end
function Vec3:set(new_val, y, z)
    if (type(new_val) == "table") then
        self[1] = new_val[1] or self[1]
        self[2] = new_val[2] or self[2]
        self[3] = new_val[3] or self[1]
    end
end

math.vector = {
    add = function(a, b) return Vec3({a[1] + b[1], a[2] + b[2], a[3] + b[3]}) end
}

-- PATHS

ROOT_PATH = files.cdir() .. "/"
function relative_path(inp) return stringreplace(inp, ROOT_PATH, "") end

-- DEBUG
function print_basic_debug(app, clock, delta)
    screen.print(0, 12, "ROOT: " .. ROOT_PATH, 0.45)
    screen.print(0, 24, "CPU/BUS: " .. os.cpu() .. "/" .. os.bus(), 0.45)
    screen.print(0, 36,
                 "FREE RAM (KB): " .. math.floor((os.ram() / 1024)) .. "/" ..
                     (math.floor(os.totalram() / 1024)), 0.45)
    screen.print(0, 48, "RAND FLOAT: " .. tostring(math.random()), 0.45)
    screen.print(0, 60, "DATE: " .. tostring(now()), 0.45)
    screen.print(0, 72, "STAGE CHILDREN: " ..
                     tostring(app.children:get(0).children.length), 0.45)
    screen.print(0, 84, "ROOT COMPONENTS: " .. tostring(app.components.length),
                 0.45)

    screen.print(0, 96, "APP TICKS: " .. tostring(app.meta.ticking.id), 0.45)
    screen.print(0, 108, "CLOCK RATE: " .. tostring(clock.rate), 0.45)
    screen.print(0, 120, "CLOCK DELTA: " .. tostring(delta), 0.45)
end

--  LOGGING 
function err(tag, msg) error(tostring(tag) .. ": " .. tostring(msg)) end
function warn(tag, msg)
    ini.write("debug.log", "SESSION_" .. SESSION_ID,
              "[" .. os.date("%I:%M %p") .. "] [" .. tag .. "] [!] ", msg)
end
function log(tag, msg)
    ini.write("debug.log", "SESSION_" .. SESSION_ID,
              "[" .. os.date("%I:%M %p") .. "] [" .. tostring(tag) .. "] [i] ",
              tostring(msg))
end

local _on_debug = onDebug
onDebug = function(msg)
    log("error", msg);
    _on_debug()
end

Image = image
