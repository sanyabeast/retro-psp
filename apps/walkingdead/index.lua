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
                    position = {10, 10},
                    components = {
                        body = {
                            name = "SpriteRenderer",
                            params = {src = "image.png"}
                        },
                        character = {name = "Character", params = {walking_speed = math.random() + 0.5}},
                        controller = {name = "UserCharacterController"}
                    }
                },
                npc1 = {
                    position = {100, 30},
                    components = {
                        body = {
                            name = "SpriteRenderer",
                            params = {src = "retro/res/char_02.png"}
                        },
                        character = {name = "Character", params = {walking_speed = math.random() + 0.5}},
                        controller = {name = "NpcController"}
                    }
                },
                npc2 = {
                    position = {40, 10},
                    components = {
                        body = {
                            name = "SpriteRenderer",
                            params = {src = "retro/res/char_02.png"}
                        },
                        character = {name = "Character", params = {walking_speed = math.random() + 0.5}},
                        controller = {name = "NpcController"}
                    }
                },
                npc3 = {
                    position = {100, 30},
                    components = {
                        body = {
                            name = "SpriteRenderer",
                            params = {src = "retro/res/char_02.png"}
                        },
                        character = {name = "Character", params = {walking_speed = math.random() + 0.5}},
                        controller = {name = "NpcController"}
                    }
                },
                npc4 = {
                    position = {40, 10},
                    components = {
                        body = {
                            name = "SpriteRenderer",
                            params = {src = "retro/res/char_02.png"}
                        },
                        character = {name = "Character", params = {walking_speed = math.random() + 0.5}},
                        controller = {name = "NpcController"}
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
                            position = {100, 30},
                            components = {
                                body = {
                                    name = "SpriteRenderer",
                                    params = {src = "retro/res/char_02.png"}
                                },
                                character = {name = "Character", params = {walking_speed = math.random() + 0.5}},
                                controller = {name = "NpcController"}
                            }
                        },
                        npc2 = {
                            position = {40, 10},
                            components = {
                                body = {
                                    name = "SpriteRenderer",
                                    params = {src = "retro/res/char_02.png"}
                                },
                                character = {name = "Character", params = {walking_speed = math.random() + 0.5}},
                                controller = {name = "NpcController"}
                            }
                        },
                        npc3 = {
                            position = {100, 30},
                            components = {
                                body = {
                                    name = "SpriteRenderer",
                                    params = {src = "retro/res/char_02.png"}
                                },
                                character = {name = "Character", params = {walking_speed = math.random() + 0.5}},
                                controller = {name = "NpcController"}
                            }
                        },
                        npc4 = {
                            position = {40, 10},
                            components = {
                                body = {
                                    name = "SpriteRenderer",
                                    params = {src = "retro/res/char_02.png"}
                                },
                                character = {name = "Character", params = {walking_speed = math.random() + 0.5}},
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
                            position = {100, 30},
                            components = {
                                body = {
                                    name = "SpriteRenderer",
                                    params = {src = "retro/res/char_02.png"}
                                },
                                character = {name = "Character", params = {walking_speed = math.random() + 0.5}},
                                controller = {name = "NpcController"}
                            }
                        },
                        npc2 = {
                            position = {40, 10},
                            components = {
                                body = {
                                    name = "SpriteRenderer",
                                    params = {src = "retro/res/char_02.png"}
                                },
                                character = {name = "Character", params = {walking_speed = math.random() + 0.5}},
                                controller = {name = "NpcController"}
                            }
                        },
                        npc3 = {
                            position = {100, 30},
                            components = {
                                body = {
                                    name = "SpriteRenderer",
                                    params = {src = "retro/res/char_02.png"}
                                },
                                character = {name = "Character", params = {walking_speed = math.random() + 0.5}},
                                controller = {name = "NpcController"}
                            }
                        },
                        npc4 = {
                            position = {40, 10},
                            components = {
                                body = {
                                    name = "SpriteRenderer",
                                    params = {src = "retro/res/char_02.png"}
                                },
                                character = {name = "Character", params = {walking_speed = math.random() + 0.5}},
                                controller = {name = "NpcController"}
                            }
                        }
                    }
                }
            }
        }
    }
}
