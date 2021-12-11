local data = {
    ["components"] = {
        ["background"] = {
            ["name"] = "Background",
            ["params"] = {
                ["src"] = "apps/walkingdead/res/background/pixel_art_topdown_a1.png"
            }
        },
        ["camera"] = {
            ["name"] = "CameraController"
        }
    },
    ["children"] = {
        ["stage"] = {
            ["children"] = {
                ["character"] = {
                    ["position"] = {
                        [0] = 100,
                        [1] = 100
                    },
                    ["components"] = {
                        ["body"] = {
                            ["name"] = "SpriteRenderer",
                            ["params"] = {
                                ["src"] = "apps/walkingdead/res/pixel_art_creatures_pack/tile022.png"
                            }
                        },
                        ["character"] = {
                            ["name"] = "Character",
                            ["params"] = {
                                ["walking_speed"] = 2
                            }
                        },
                        ["controller"] = {
                            ["name"] = "UserCharacterController"
                        },
                        ["title"] = {
                            ["name"] = "TextRenderer",
                            ["params"] = {
                                ["text"] = "Hello, Kitty",
                                ["font_size"] = 0.3
                            }
                        }
                    }
                },
                ["npc0"] = {
                    ["position"] = {
                        [0] = 150,
                        [1] = 50
                    },
                    ["components"] = {
                        ["body"] = {
                            ["name"] = "SpriteRenderer",
                            ["params"] = {
                                ["src"] = "apps/walkingdead/res/pixel_art_creatures_pack/tile021.png"
                            }
                        },
                        ["character"] = {
                            ["name"] = "Character",
                            ["params"] = {
                                ["walking_speed"] = 2
                            }
                        },
                        ["controller"] = {
                            ["name"] = "NpcController"
                        },
                        ["title"] = {
                            ["name"] = "TextRenderer",
                            ["params"] = {
                                ["text"] = "Arghhhh!",
                                ["font_size"] = 0.3
                            }
                        }
                    }
                }
            }
        }
    }
}

return data