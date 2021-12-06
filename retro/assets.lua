-- created by @sanyabeast 6 DEC 2021
local Object = require("retro.object")
local Assets = class("Assets", Object)
function Assets:init(params)
    self.super.init(self, params)
    self:preload_components("retro")
end
function Assets:preload_components(module)
    local ls = files.list(module .. "/components/")
    for i, file_data in ipairs(ls) do
        local path = stringreplace(stringreplace(file_data.path, "/", "."), ".lua", "")
        test = path
        if (type(path) == "string") then
            path = splitstring(path, ":")[2]:sub(2)
            local CompClass = require(path)
            _G[CompClass.__name] = CompClass
        end
    end

end
local assets = Assets()
return assets
