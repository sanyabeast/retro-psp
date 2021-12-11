local Transform = class("Transform", Component)
function Transform:init(params)
    Component.init(self, params)
    -- local transforms (defined)
    self.position = {0, 0, 0}
    self.rotation = {0, 0, 0}
    self.scale = {1, 1, 1}

    -- global transform (computed)
    self.g_position = {0, 0, 0}
    self.g_rotation = {0, 0, 0}
    self.g_scale = {1, 1, 1}
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
        g_position = math.vector.clone(self.position)
    end

    for i, child in pairs(self.children) do
        child.transform:update_global_transform()
    end

    self.g_position = g_position
    self.g_scale = g_scale
    self.g_rotation = g_rotation
end
--  TRANSFORMATIONS
function Transform:translate(x, y, z)
    self.position[1] = self.position[1] + x
    self.position[2] = self.position[2] + y
    self.position[3] = self.position[3] + z
end
return Transform
