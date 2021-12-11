local SomeComp = class("SomeComp", Component)
function SomeComp:init(params)
    Component.init(self, params)
end
return SomeComp
