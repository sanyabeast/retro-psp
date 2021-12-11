-- created by @sanyabeast 6 DEC 2021
local Object = require("retro.object")
local Assets = class("Assets", Object)
Assets.loaded_images = {}
Assets.loaded_models = {}
function Assets:init(params)
    self.component_classes = {}
    Object.init(self, params)
    self:preload_components("retro")
    self:preload_components("apps/" .. "walkingdead")
end
function Assets:preload_components(module)
    local ls = files.list(module .. "/components/")
    if (ls ~= nil) then
        for i, file_data in ipairs(ls) do
            local component_path = relative_path(file_data.path)
            if (type(component_path) == "string") then
                component_path = rstringreplace(rstringreplace(component_path, "/", "."), ".lua", "")
                local CompClass = require(component_path)
                -- log("Assets",  "registering component `" .. CompClass.__name .. "`...")
                self.component_classes[CompClass.__name] = CompClass
            end
        end
    end
end
function Assets:create_component(name, params)
    local CompCreator = self.component_classes[name]
    -- log("Assets", "creating new component of type`" .. name .. "`")
    if (CompCreator == nil) then
        err(self.__name, "Component `" .. name .. "` not registered")
    end
    return CompCreator(params)
end
local assets = Assets()
return assets
