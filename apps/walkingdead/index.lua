log("retro/res/pixel_art_creatures_pack/tile0" .. math.random(10, 70) .. ".png")
APP_PREFAB = {
    components = {
        ome_comp1 = {name = "SomeComp", params = {test = 1}},
        ome_comp2 = {name = "SomeComp", params = {test = 1}},
        ome_comp3 = {name = "SomeComp", params = {test = 1}},
        ome_comp4 = {name = "SomeComp", params = {test = 1}},
        ome_comp5 = {name = "SomeComp", params = {test = 1}},
        ome_comp6 = {name = "SomeComp", params = {test = 1}},
        ome_comp7 = {name = "SomeComp", params = {test = 1}},
        ome_comp8 = {name = "SomeComp", params = {test = 1}},
        camera = {name = "CameraController"}
    },
    children = {
        stage = {
            children = {
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
                                    math.random(10, 70) .. ".png"
                            }
                        },
                        character = {
                            name = "Character",
                            params = {walking_speed = math.random() + 0.5}
                        },
                        controller = {name = "UserCharacterController"}
                    }
                },
                npc1 = {
                    position = {
                        math.random(0, SCREEN_WIDTH),
                        math.random(0, SCREEN_HEIGHT)
                    },
                    components = {
                        body = {
                            name = "SpriteRenderer",
                            params = {
                                src = "retro/res/pixel_art_creatures_pack/tile0" ..
                                    math.random(10, 70) .. ".png",
                                blending = 0
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
                },
                npc2 = {
                    position = {
                        math.random(0, SCREEN_WIDTH),
                        math.random(0, SCREEN_HEIGHT)
                    },
                    components = {
                        body = {
                            name = "SpriteRenderer",
                            params = {
                                src = "retro/res/pixel_art_creatures_pack/tile0" ..
                                    math.random(10, 70) .. ".png",
                                blending = 1
                            }
                        },
                        character = {
                            name = "Character",
                            params = {walking_speed = math.random() + 0.5}
                        },
                        controller = {name = "NpcController"},
                        title = {
                            name = "TextRenderer",
                            params = {
                                text = "Hello, Kitty",
                                font_size = 0.2,
                                color = Color.new(255, 0, 128)
                            }
                        }
                    }
                },
                npc3 = {
                    position = {
                        math.random(0, SCREEN_WIDTH),
                        math.random(0, SCREEN_HEIGHT)
                    },
                    components = {
                        body = {
                            name = "SpriteRenderer",
                            params = {
                                src = "retro/res/pixel_art_creatures_pack/tile0" ..
                                    math.random(10, 70) .. ".png",
                                blending = 2
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
                },
                npc4 = {
                    position = {
                        math.random(0, SCREEN_WIDTH),
                        math.random(0, SCREEN_HEIGHT)
                    },
                    components = {
                        body = {
                            name = "SpriteRenderer",
                            params = {
                                src = "retro/res/pixel_art_creatures_pack/tile0" ..
                                    math.random(10, 70) .. ".png",
                                blending = 0
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
                },
                something = {
                    components = {
                        ome_comp1 = {name = "SomeComp", params = {test = 1}},
                        ome_comp2 = {name = "SomeComp", params = {test = 1}},
                        ome_comp3 = {name = "SomeComp", params = {test = 1}},
                        ome_comp4 = {name = "SomeComp", params = {test = 1}},
                        ome_comp5 = {name = "SomeComp", params = {test = 1}},
                        ome_comp6 = {name = "SomeComp", params = {test = 1}},
                        ome_comp7 = {name = "SomeComp", params = {test = 1}},
                        ome_comp8 = {name = "SomeComp", params = {test = 1}},
                        camera = {name = "CameraController"}
                    }
                },
                something_else = {
                    components = {
                        ome_comp1 = {name = "SomeComp", params = {test = 1}},
                        ome_comp2 = {name = "SomeComp", params = {test = 1}},
                        ome_comp3 = {name = "SomeComp", params = {test = 1}},
                        ome_comp4 = {name = "SomeComp", params = {test = 1}},
                        ome_comp5 = {name = "SomeComp", params = {test = 1}},
                        ome_comp6 = {name = "SomeComp", params = {test = 1}},
                        ome_comp7 = {name = "SomeComp", params = {test = 1}},
                        ome_comp8 = {name = "SomeComp", params = {test = 1}},
                        camera = {name = "CameraController"}
                    },
                    children = {
                        npc1 = {
                            position = {
                                math.random(0, SCREEN_WIDTH),
                                math.random(0, SCREEN_HEIGHT)
                            },
                            components = {
                                body = {
                                    name = "SpriteRenderer",
                                    params = {
                                        src = "retro/res/pixel_art_creatures_pack/tile0" ..
                                            math.random(10, 70) .. ".png",
                                        blending = 0
                                    }
                                },
                                character = {
                                    name = "Character",
                                    params = {
                                        walking_speed = math.random() + 0.5
                                    }
                                },
                                controller = {name = "NpcController"}
                            }
                        },
                        npc2 = {
                            position = {
                                math.random(0, SCREEN_WIDTH),
                                math.random(0, SCREEN_HEIGHT)
                            },
                            components = {
                                body = {
                                    name = "SpriteRenderer",
                                    params = {
                                        src = "retro/res/pixel_art_creatures_pack/tile0" ..
                                            math.random(10, 70) .. ".png",
                                        blending = 2
                                    }
                                },
                                character = {
                                    name = "Character",
                                    params = {
                                        walking_speed = math.random() + 0.5
                                    }
                                },
                                controller = {name = "NpcController"}
                            }
                        },
                        npc3 = {
                            position = {
                                math.random(0, SCREEN_WIDTH),
                                math.random(0, SCREEN_HEIGHT)
                            },
                            components = {
                                body = {
                                    name = "SpriteRenderer",
                                    params = {
                                        src = "retro/res/pixel_art_creatures_pack/tile0" ..
                                            math.random(10, 70) .. ".png",
                                        blending = 0
                                    }
                                },
                                character = {
                                    name = "Character",
                                    params = {
                                        walking_speed = math.random() + 0.5
                                    }
                                },
                                controller = {name = "NpcController"}
                            }
                        },
                        npc4 = {
                            position = {
                                math.random(0, SCREEN_WIDTH),
                                math.random(0, SCREEN_HEIGHT)
                            },
                            components = {
                                body = {
                                    name = "SpriteRenderer",
                                    params = {
                                        src = "retro/res/pixel_art_creatures_pack/tile0" ..
                                            math.random(10, 70) .. ".png",
                                        blending = 0
                                    }
                                },
                                character = {
                                    name = "Character",
                                    params = {
                                        walking_speed = math.random() + 0.5
                                    }
                                },
                                controller = {name = "NpcController"}
                            }
                        }
                    }
                },
                something_else2 = {
                    components = {
                        ome_comp1 = {name = "SomeComp", params = {test = 1}},
                        ome_comp2 = {name = "SomeComp", params = {test = 1}},
                        ome_comp3 = {name = "SomeComp", params = {test = 1}},
                        ome_comp4 = {name = "SomeComp", params = {test = 1}},
                        ome_comp5 = {name = "SomeComp", params = {test = 1}},
                        ome_comp6 = {name = "SomeComp", params = {test = 1}},
                        ome_comp7 = {name = "SomeComp", params = {test = 1}},
                        ome_comp8 = {name = "SomeComp", params = {test = 1}},
                        camera = {name = "CameraController"}
                    },
                    children = {
                        npc1 = {
                            position = {
                                math.random(0, SCREEN_WIDTH),
                                math.random(0, SCREEN_HEIGHT)
                            },
                            components = {
                                body = {
                                    name = "SpriteRenderer",
                                    params = {
                                        src = "retro/res/pixel_art_creatures_pack/tile0" ..
                                            math.random(10, 70) .. ".png",
                                        blending = 0
                                    }
                                },
                                character = {
                                    name = "Character",
                                    params = {
                                        walking_speed = math.random() + 0.5
                                    }
                                },
                                controller = {name = "NpcController"}
                            }
                        },
                        npc2 = {
                            position = {
                                math.random(0, SCREEN_WIDTH),
                                math.random(0, SCREEN_HEIGHT)
                            },
                            components = {
                                body = {
                                    name = "SpriteRenderer",
                                    params = {
                                        src = "retro/res/pixel_art_creatures_pack/tile0" ..
                                            math.random(10, 70) .. ".png",
                                        blending = 0
                                    }
                                },
                                character = {
                                    name = "Character",
                                    params = {
                                        walking_speed = math.random() + 0.5
                                    }
                                },
                                controller = {name = "NpcController"}
                            }
                        },
                        npc3 = {
                            position = {
                                math.random(0, SCREEN_WIDTH),
                                math.random(0, SCREEN_HEIGHT)
                            },
                            components = {
                                body = {
                                    name = "SpriteRenderer",
                                    params = {
                                        src = "retro/res/pixel_art_creatures_pack/tile0" ..
                                            math.random(10, 70) .. ".png",
                                        blending = 0
                                    }
                                },
                                character = {
                                    name = "Character",
                                    params = {
                                        walking_speed = math.random() + 0.5
                                    }
                                },
                                controller = {name = "NpcController"}
                            }
                        },
                        npc4 = {
                            position = {
                                math.random(0, SCREEN_WIDTH),
                                math.random(0, SCREEN_HEIGHT)
                            },
                            components = {
                                body = {
                                    name = "SpriteRenderer",
                                    params = {
                                        src = "retro/res/pixel_art_creatures_pack/tile0" ..
                                            math.random(10, 70) .. ".png",
                                        blending = 0
                                    }
                                },
                                character = {
                                    name = "Character",
                                    params = {
                                        walking_speed = math.random() + 0.5
                                    }
                                },
                                controller = {name = "NpcController"}
                            }
                        }
                    }
                }
            }
        }
    }
}
