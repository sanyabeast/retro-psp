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
                barrel_a = {
                    position = {-1, 0, 0},
                    components = {
                        some_mesh = {
                            name = "MeshRenderer",
                            params = {
                                src = "retro/res/models/barrel/barrel_a1.obj"
                            }
                        }
                    }
                },
                crate_a = {
                    position = {-2, 0, 0},
                    components = {
                        some_mesh = {
                            name = "MeshRenderer",
                            params = {
                                src = "retro/res/models/lowpoly_crates/crate_1.obj"
                            }
                        }
                    }
                },
                crate_n = {
                    position = {-3, 0, 0},
                    components = {
                        some_mesh = {
                            name = "MeshRenderer",
                            params = {
                                src = "retro/res/models/lowpoly_crates/crate_3.obj"
                            }
                        }
                    }
                },
                cube_1m = {
                    position = {-4, 0, 0},
                    components = {
                        some_mesh = {
                            name = "MeshRenderer",
                            params = {
                                src = "retro/res/models/basic/1m_cube.obj"
                            }
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
