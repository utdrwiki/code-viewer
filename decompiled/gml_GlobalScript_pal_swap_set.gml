pal_swap_set = function(argument0, argument1, argument2) //gml_Script_pal_swap_set
{
    var _pal_sprite = argument0
    var _pal_index = argument1
    if (_pal_index == 0)
        return;
    var mode = (0 << 0)
    if (!argument2)
    {
        if global.Pal_HTML5
        {
            shader_set(global.Pal_HTML5_Sprite)
            mode = (1 << 0)
        }
        else
            shader_set(global.Pal_Shader)
        global.Pal_Shader_Is_Set = 1
        var tex = sprite_get_texture(_pal_sprite, 0)
        var UVs = sprite_get_uvs(_pal_sprite, 0)
        texture_set_stage(global.Pal_Texture[mode], tex)
        var texel_x = texture_get_texel_width(tex)
        var texel_y = texture_get_texel_height(tex)
        var texel_hx = (texel_x * 0.5)
        var texel_hy = (texel_y * 0.5)
        shader_set_uniform_f(global.Pal_Texel_Size[mode], texel_x, texel_y)
        shader_set_uniform_f(global.Pal_UVs[mode], (UVs[0] + texel_hx), (UVs[1] + texel_hy), UVs[2], UVs[3])
        shader_set_uniform_f(global.Pal_Index[mode], _pal_index)
    }
    else
    {
        if global.Pal_HTML5
        {
            shader_set(global.Pal_HTML5_Surface)
            mode = (2 << 0)
        }
        else
            shader_set(global.Pal_Shader)
        global.Pal_Shader_Is_Set = 1
        tex = surface_get_texture(_pal_sprite)
        texture_set_stage(global.Pal_Texture[mode], tex)
        texel_x = texture_get_texel_width(tex)
        texel_y = texture_get_texel_height(tex)
        texel_hx = (texel_x * 0.5)
        texel_hy = (texel_y * 0.5)
        shader_set_uniform_f(global.Pal_Texel_Size[mode], texel_x, texel_y)
        shader_set_uniform_f(global.Pal_UVs[mode], texel_hx, texel_hy, (1 + texel_hx), (1 + texel_hy))
        shader_set_uniform_f(global.Pal_Index[mode], _pal_index)
    }
    return;
}

