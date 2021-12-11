APP_PREFAB = require("apps.walkingdead.prefabs.main")

for i = 1, 30, 1 do
    APP_PREFAB.children.stage.children["npc_" .. i] = {
        position = {math.random(0, SCREEN_WIDTH), math.random(0, SCREEN_HEIGHT)},
        components = {
            body = {
                name = "SpriteRenderer",
                params = {
                    src = "apps/walkingdead/res/pixel_art_creatures_pack/tile0" ..
                        math.floor(math.random(20, 30)) .. ".png"
                }
            },
            character = {
                name = "Character",
                params = {walking_speed = math.random() + 0.5}
            },
            controller = {name = "NpcController"}
        }
    }
end
