-- created by @sanyabeast 6 DEC 2021
local Object = require("retro.object")
local Renderer = class("Renderer", Object)
local render_list = {}

local drawing_methods = {
    image = function(render_data)
        local sprite_id = render_data.params.src
        local sprite_data = Assets.loaded_images[sprite_id]
        if (sprite_data ~= nil) then
            if (sprite_data.sprite ~= nil) then
                sprite_data.loaded = true
                sprite_data.sprite:resize(render_data.params.size[1],
                                          render_data.params.size[2])
                local blending = render_data.params.blending or 0

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

            end
        else
            local sprite = Image.load(sprite_id)
            Assets.loaded_images[sprite_id] = {sprite = sprite, loading = false}
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
    end
}
function Renderer.start(params) return end
function Renderer.render()
    screen.flip()
    for i, render_data in ipairs(render_list) do
        drawing_methods[render_data.params.type](render_data)
    end
    Renderer.clear_render_list()
end
function Renderer.clear_render_list() render_list = {} end
function Renderer.add(render_data) table.insert(render_list, render_data) end
return Renderer
