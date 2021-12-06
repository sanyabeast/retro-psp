local Transform = class("Transform", Component)
function Transform:init(params)
    Component.init(self, params)
    -- local transforms (defined)
    self.position = Vec3({0, 0, 0})
    self.rotation = Vec3({0, 0, 0})
    self.scale = Vec3({1, 1, 1})

    -- global transform (computed)
    self.g_position = Vec3({0, 0, 0})
    self.g_rotation = Vec3({0, 0, 0})
    self.g_scale = Vec3({1, 1, 1})

end
function Transform:update_global_transform()
    local parent = self.game_object.parent
    local g_position = self.g_position
    local g_rotation = self.g_rotation
    local g_scale = self.g_position
    if parent ~= nil then
        local parent_transform = parent.transform
        g_position = math.vector.add(parent_transform.g_position, self.position)
    else
        g_position = Vec3(self.position)
    end

    self.children:each(function(child, index)
        child.transform:update_global_transform()
    end)

    self.g_position = g_position
    self.g_scale = g_scale
    self.g_rotation = g_rotation
end
return Transform
