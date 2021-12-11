local data = {
    ["components"] = nil,
    ["children"] = {
        ["player"] = {
            ["position"] = {
                [1] = 230,
                [2] = 125
            },
            ["components"] = {
                ["body"] = {
                    ["name"] = "PrimitiveRenderer",
                    ["params"] = {
                        ["shape"] = "circle",
                        ["circle_radius"] = 20,
                        ["outline"] = true
                    }
                },
                ["controller"] = {
                    ["name"] = "BasicCharacter",
                    ["order"] = 1,
                    ["params"] = {
                        ["move_velocity"] = 3
                    }
                }
            }
        },
        ["bot"] = {
            ["position"] = {
                [1] = 180,
                [2] = 80
            },
            ["components"] = {
                ["body"] = {
                    ["name"] = "PrimitiveRenderer",
                    ["params"] = {
                        ["shape"] = "circle",
                        ["circle_radius"] = 22,
                        ["circle_segments"] = 3,
                        ["outline"] = true
                    }
                },
                ["controller"] = {
                    ["name"] = "BasicBot",
                    ["order"] = 1,
                    ["params"] = {
                        ["move_velocity"] = 0.55
                    }
                }
            }
        }
    }
}

return data