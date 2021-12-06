-- created by @sanyabeast 6 DEC 2021
-- CLASS
local __OBJECT_ID = 0
function _CLASS_SUPER(self, name, ...)
    if (self.__super ~= nil) then
        if (self.__super[name] ~= self[name]) then
            self.__super[name](self, ...)
        end
    end
end
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
    function Class:super(...) return _CLASS_SUPER(self, ...) end
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
function now() return (os.time() + os.clock()) * 1000 end
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

-- PATHS

ROOT_PATH = files.cdir() .. "/"
function relative_path(inp) return stringreplace(inp, ROOT_PATH, "") end

-- DEBUG
function print_basic_debug(app, clock)
    screen.print(0, 12, "ROOT: " .. ROOT_PATH, 0.45)
    screen.print(0, 24, "CPU/BUS: " .. os.cpu() .. "/" .. os.bus(), 0.45)
    screen.print(0, 36, "FREE RAM (KB): " .. math.floor((os.ram() / 1024)) .. "/" ..
                     (math.floor(os.totalram() / 1024)), 0.45)
    screen.print(0, 48, "RAND FLOAT: " .. tostring(math.random()), 0.45)
    screen.print(0, 60, "DATE: " .. tostring(now()), 0.45)
    screen.print(0, 72, "STAGE CHILDREN: " ..
                     tostring(app.children:get(0).children.length), 0.45)
    screen.print(0, 84, "ROOT COMPONENTS: " .. tostring(app.components.length),
                 0.45)

    screen.print(0, 96, "APP TICKS: " .. tostring(app.meta.ticking.id), 0.45)
    screen.print(0, 108, "CLOCK RATE: " .. tostring(clock.rate), 0.45)
end

function err(msg) return error("[RETRO] [!] " .. tostring(msg)) end

Image = image
