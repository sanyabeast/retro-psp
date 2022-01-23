-- created by @sanyabeast 6 DEC 2021
local Object = require("retro.object")
local Renderer = class("Renderer", Object)
Renderer.on_render = nil
local render_list = {}
local renderables_config = {
    ["image"] = {r},
    ["text"] = {},
    ["primitive"] = {}
}

local drawing_methods = {
    ["image"] = function(render_data)
        local sprite_id = render_data.params.src
        local sprite_data = Assets.loaded_images[sprite_id]
        -- log("Renderer", "prepare to render image `"..sprite_id.."`")
        if (sprite_data ~= nil) then
            if (sprite_data.sprite ~= nil) then
                sprite_data.loaded = true
                -- sprite_data.sprite:reset()
                sprite_data.sprite:resize(render_data.params.size[1], render_data.params.size[2])
                local blending = render_data.params.blending or 0

                -- log("Renderer", "rendering image `"..sprite_id.."`")
                if (blending == 0) then
                    -- log("renderin sprite" .. render_data.transform.id ..
                    --         dump(render_data.transform.g_position))
                    sprite_data.sprite:blit(
                        render_data.transform.g_position[1],
                        render_data.transform.g_position[2],
                        render_data.params.opacity * 255
                    )
                elseif (blending == 1) then
                    sprite_data.sprite:blitadd(
                        render_data.transform.g_position[1],
                        render_data.transform.g_position[2],
                        render_data.params.blend_power
                    )
                elseif (blending == 2) then
                    sprite_data.sprite:blitsub(
                        render_data.transform.g_position[1],
                        render_data.transform.g_position[2],
                        render_data.params.blend_power
                    )
                else
                    sprite_data.sprite:blittint(
                        render_data.transform.g_position[1],
                        render_data.transform.g_position[2],
                        render_data.params.tint
                    )
                end
            else
                -- log("Renderer.image", "waiting for image " ..
                --         (NOW - sprite_data.loading_started_at) .. "")
            end
        else
            local sprite = Image.load(render_data.params.src)
            Assets.loaded_images[sprite_id] = {
                sprite = sprite,
                loaded = false,
                loading_started_at = NOW
            }
        end
    end,
    ["text"] = function(render_data)
        if (render_data.params.color ~= nil) then
            if (render_data.params.shadow_color) then
                screen.print(
                    render_data.transform.g_position[1] or 0,
                    render_data.transform.g_position[2] or 0,
                    tostring(render_data.params.text),
                    render_data.params.font_size,
                    render_data.params.color,
                    render_data.params.shadow_color
                )
            else
                screen.print(
                    render_data.transform.g_position[1] or 0,
                    render_data.transform.g_position[2] or 0,
                    tostring(render_data.params.text),
                    render_data.params.font_size,
                    render_data.params.color
                )
            end
        else
            screen.print(
                render_data.transform.g_position[1] or 0,
                render_data.transform.g_position[2] or 0,
                tostring(render_data.params.text),
                render_data.params.font_size
            )
        end

        screen.print(0, 100, " ")
    end,
    ["primitive"] = function(render_data)
        local shape = render_data.params.shape
        local outline = render_data.params.outline
        local gradient = render_data.params.gradient
        if (shape == "polygon") then
            if gradient then
                draw.gradcircle(
                    render_data.transform.g_position[1],
                    render_data.transform.g_position[2],
                    render_data.params.polygon_radius,
                    render_data.params.color,
                    render_data.params.color2,
                    render_data.params.polygon_segments
                )
            else
                draw.gradcircle(
                    render_data.transform.g_position[1],
                    render_data.transform.g_position[2],
                    render_data.params.polygon_radius,
                    render_data.params.color,
                    render_data.params.color,
                    render_data.params.polygon_segments
                )
            end
            if outline then
                draw.circle(
                    render_data.transform.g_position[1],
                    render_data.transform.g_position[2],
                    render_data.params.polygon_radius,
                    render_data.params.outline_color,
                    render_data.params.polygon_segments
                )
            end
        elseif (shape == "line") then
            local points = render_data.params.points
            for x = 2, table.getn(points), 1 do
                local prev = points[x - 1]
                local curr = points[x]
                local g_pos = render_data.transform.g_position
                draw.line(
                    prev[1] + g_pos[1],
                    prev[2] + g_pos[2],
                    curr[1] + g_pos[1],
                    curr[2] + g_pos[2],
                    render_data.params.color
                )
            end
        end
    end
}

function Renderer.render(delta)
    table.sort(render_list, Renderer.default_render_list_sorting)
    for i, render_data in rpairs(render_list) do
        drawing_methods[render_data.params.type](render_data)
    end
    if (Renderer.on_render) then
        Renderer.on_render()
    end
    screen.flip()
    Renderer.clear_render_list()
end
function Renderer.default_render_list_sorting(a, b)
    return Renderer.calculate_render_order(a) > Renderer.calculate_render_order(b)
end
function Renderer.calculate_render_order(render_data)
    return (render_data.params.render_order or 0) * (render_data.params.render_layer or 0)
end
function Renderer.clear_render_list()
    render_list = {}
end
function Renderer.add(render_data)
    table.insert(render_list, render_data)
end

return Renderer
