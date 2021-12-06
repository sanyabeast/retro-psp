-- created by @sanyabeast 6 DEC 2021
-- CLASS
local __OBJECT_ID = 0
function class(name, ParentClass)
    local Class = {}
    Class.__index = Class
    Class.__name = name
    local meta = {__call = function(cls, ...) return cls.new(...) end}
    if (ParentClass ~= nil) then meta.__index = ParentClass end
    setmetatable(Class, meta)
    function Class.new(params)
        local self = setmetatable({}, Class)
        self.id = __OBJECT_ID
        __OBJECT_ID = __OBJECT_ID + 1
        if (ParentClass ~= nil) then
            self.super = ParentClass
            ParentClass.new(self, params);
        end
        self:init(params)
        return self
    end
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
function stringreplace(input, a, b) return input:gsub("%" .. a, b) end
-- 
Image = image
