-- created by @sanyabeast 6 DEC 2021
local Object = require("retro.object")
local Assets = class("Assets", Object)
function Assets:init(params)
    self.component_classes = {}
    self.super("init", params)
    self:preload_components("retro")
end
function Assets:preload_components(module)
    local ls = files.list(module .. "/components/")
    for i, file_data in ipairs(ls) do
        local component_path = relative_path(file_data.path)
        if (type(component_path) == "string") then
            component_path = rstringreplace(
                                 rstringreplace(component_path, "/", "."),
                                 ".lua", "")
            local CompClass = require(component_path)
            self.component_classes[CompClass.__name] = CompClass
        end
    end
end
function Assets:create_component(name, params)
    local CompCreator = self.component_classes[name]
    if (CompCreator == nil) then
        err("Component `" .. name .. "` not registered")
    end
    return CompCreator(params)
end
local assets = Assets()
return assets
