-- created by @sanyabeast 6 DEC 2021
local Object = require("retro.object")
local Renderer = class("Renderer", Object)
Renderer.on_render = nil
local render_list = {}
local renderables_config = {
    image = {render_order = 0, mode2d = true},
    text = {render_order = 1, mode2d = true},
    mesh = {render_order = -1, mode2d = false}
}

local camera = Cam3D.new()
Cam3D.position(camera, {0, 5, 2})
Cam3D.eye(camera, {0, 0, 0})

local drawing_methods = {
    image = function(render_data)
        local sprite_id = render_data.params.src
        local sprite_data = Assets.loaded_images[sprite_id]
        -- log("Renderer", "prepare to render image `"..sprite_id.."`")
        if (sprite_data ~= nil) then
            if (sprite_data.sprite ~= nil) then
                sprite_data.loaded = true
                -- sprite_data.sprite:reset()
                sprite_data.sprite:resize(render_data.params.size[1],
                                          render_data.params.size[2])
                local blending = render_data.params.blending or 0

                -- log("Renderer", "rendering image `"..sprite_id.."`")
                if (blending == 0) then
                    -- log("renderin sprite" .. render_data.transform.id ..
                    --         dump(render_data.transform.g_position))
                    sprite_data.sprite:blit(render_data.transform.g_position[1],
                                            render_data.transform.g_position[2],
                                            render_data.params.opacity * 255)
                elseif (blending == 1) then
                    sprite_data.sprite:blitadd(
                        render_data.transform.g_position[1],
                        render_data.transform.g_position[2],
                        render_data.params.blend_power)
                elseif (blending == 2) then
                    sprite_data.sprite:blitsub(
                        render_data.transform.g_position[1],
                        render_data.transform.g_position[2],
                        render_data.params.blend_power)
                else
                    sprite_data.sprite:blittint(
                        render_data.transform.g_position[1],
                        render_data.transform.g_position[2],
                        render_data.params.tint)
                end

            else
                -- log("Renderer.image", "waiting for image " ..
                --         (now() - sprite_data.loading_started_at) .. "")
            end
        else
            local sprite = Image.load(render_data.params.src)
            Assets.loaded_images[sprite_id] = {
                sprite = sprite,
                loaded = false,
                loading_started_at = now()
            }
        end
    end,
    text = function(render_data)
        if (render_data.params.color ~= nil) then
            if (render_data.params.shadow_color) then
                screen.print(render_data.transform.g_position[1] or 0,
                             render_data.transform.g_position[2] or 0,
                             tostring(render_data.params.text),
                             render_data.params.font_size,
                             render_data.params.color,
                             render_data.params.shadow_color)
            else
                screen.print(render_data.transform.g_position[1] or 0,
                             render_data.transform.g_position[2] or 0,
                             tostring(render_data.params.text),
                             render_data.params.font_size,
                             render_data.params.color)
            end
        else
            screen.print(render_data.transform.g_position[1] or 0,
                         render_data.transform.g_position[2] or 0,
                         tostring(render_data.params.text),
                         render_data.params.font_size)
        end

        screen.print(0, 100, " ")
    end,
    mesh = function(render_data)
        local mesh_id = render_data.params.src
        local mesh_data = Assets.loaded_models[mesh_id]
        -- log("Renderer", "prepare to render image `"..mesh_id.."`")
        if (mesh_data ~= nil) then
            if (mesh_data.mesh ~= nil) then
                mesh_data.loaded = true
                -- log(dump(render_data.transform.position))
                Model3D.position(mesh_data.mesh, 1,
                                 render_data.transform.g_position)
                Model3D.render(mesh_data.mesh)
            end
        else
            local mesh = Model3D.load(render_data.params.src)
            log("Renderer", "loading " .. render_data.params.src)
            Assets.loaded_models[mesh_id] = {
                mesh = mesh,
                loaded = false,
                loading_started_at = now()
            }
        end
    end
}

local speed = 0.0001

function Renderer.render(delta)
    local mode2d = true
    amg.begin()
    -- test rotation
    Cam3D.position(camera, {
        Math.sin(CLOCK_TIME_SINCE_START * speed) * 5,
        15 + (math.sin(CLOCK_TIME_SINCE_START * speed) * 4),
        Math.cos(CLOCK_TIME_SINCE_START * speed) * (2 + Math.sin(CLOCK_LOOP_ID * speed) * 5)
    })

    table.sort(render_list, Renderer.default_render_list_sorting)
    for i, render_data in rpairs(render_list) do
        mode2d = renderables_config[render_data.params.type].mode2d == true
        if (mode2d) then
            amg.mode2d(1)
        else

            Cam3D.set(camera)
            amg.mode2d(0)
        end
        drawing_methods[render_data.params.type](render_data)
    end

    if (Renderer.on_render) then Renderer.on_render(mode2d) end

    amg.mode2d(0)
    screen.flip()
    amg.update()
    Renderer.clear_render_list()
end
function Renderer.default_render_list_sorting(a, b)
    return Renderer.calculate_render_order(a) >
               Renderer.calculate_render_order(b)
end
function Renderer.calculate_render_order(render_data)
    local tp = renderables_config[render_data.params.type].render_order
    local ro = render_data.params.render_order or 0
    return tp * 1000 + ro
end
function Renderer.clear_render_list() render_list = {} end
function Renderer.add(render_data) table.insert(render_list, render_data) end

amg.init(__8888)
amg.perspective(35.0)

return Renderer
