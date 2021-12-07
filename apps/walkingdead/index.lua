log("retro/res/pixel_art_creatures_pack/tile0" ..
        math.floor(math.random(20, 30)) .. ".png")
APP_PREFAB = {
    components = {
        background = {
            name = "Background",
            params = {src = "retro/res/background/pixel_art_topdown_a1.png"}
        },

        camera = {name = "CameraController"}
    },
    children = {
        stage = {
            children = {
                mesh1 = {
                    position = {-1, -1, 0},
                    components = {
                        some_mesh = {
                            name = "MeshRenderer",
                            params = {src = "retro/res/models/barrel/barrel_a1.obj"}
                        }
                    }
                },
                mesh2 = {
                    position = {1, 1, 0},
                    components = {
                        some_mesh = {
                            name = "MeshRenderer",
                            params = {src = "retro/res/models/ball.obj"}
                        }
                    }
                },
                mesh3 = {
                    position = {-1, 1, -1},
                    components = {
                        some_mesh = {
                            name = "MeshRenderer",
                            params = {src = "retro/res/models/ball.obj"}
                        }
                    }
                },
                mesh4 = {
                    position = {1, -1, 1},
                    components = {
                        some_mesh = {
                            name = "MeshRenderer",
                            params = {src = "retro/res/models/ball.obj"}
                        }
                    }
                },
                character = {
                    position = {
                        math.random(0, SCREEN_WIDTH),
                        math.random(0, SCREEN_HEIGHT)
                    },
                    components = {
                        body = {
                            name = "SpriteRenderer",
                            params = {
                                src = "retro/res/pixel_art_creatures_pack/tile0" ..
                                    math.floor(math.random(20, 30)) .. ".png"
                            }
                        },
                        character = {
                            name = "Character",
                            params = {walking_speed = math.random() + 0.5}
                        },
                        controller = {name = "UserCharacterController"},
                        title = {
                            name = "TextRenderer",
                            params = {text = "Hello, Kitty", font_size = 0.2}
                        }
                    }
                },
                npc0 = {
                    position = {
                        math.random(0, SCREEN_WIDTH),
                        math.random(0, SCREEN_HEIGHT)
                    },
                    components = {
                        body = {
                            name = "SpriteRenderer",
                            params = {
                                src = "retro/res/pixel_art_creatures_pack/tile0" ..
                                    math.floor(math.random(20, 30)) .. ".png"
                            }
                        },
                        character = {
                            name = "Character",
                            params = {walking_speed = math.random() + 0.5}
                        },
                        controller = {name = "NpcController"},
                        title = {
                            name = "TextRenderer",
                            params = {text = "Hello, Kitty", font_size = 0.2}
                        }
                    }
                }
            }
        }
    }
}

for i = 1, 30, 1 do
    APP_PREFAB.children.stage.children["npc_" .. i] = {
        position = {math.random(0, SCREEN_WIDTH), math.random(0, SCREEN_HEIGHT)},
        components = {
            body = {
                name = "SpriteRenderer",
                params = {
                    src = "retro/res/pixel_art_creatures_pack/tile0" ..
                        math.floor(math.random(20, 30)) .. ".png"
                }
            },
            character = {
                name = "Character",
                params = {walking_speed = math.random() + 0.5}
            },
            controller = {name = "NpcController"},
            title = {
                name = "TextRenderer",
                params = {text = "Hello, Kitty", font_size = 0.2}
            }
        }
    }

end
