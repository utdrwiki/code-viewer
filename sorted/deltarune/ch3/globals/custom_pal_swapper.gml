function pal_swap_ext_init(arg0, arg1, arg2)
{
    var _swapper = 
    {
        shader: -4,
        html5: false,
        html5_sprite: -4,
        html5_surface: -4,
        texel_size: [0],
        uvs: [0],
        index: [0],
        texture: [0],
        layer_priority: 0,
        layer_temp_priority: 0,
        layer_map: 0,
        
        cleanup: function()
        {
            ds_priority_destroy(layer_priority);
            ds_priority_destroy(layer_temp_priority);
            ds_map_destroy(layer_map);
        }
    };
    _swapper.html5 = false;
    if (!_swapper.html5)
    {
        _swapper.shader = arg0;
        _swapper.texel_size[0] = shader_get_uniform(arg0, "u_pixelSize");
        _swapper.uvs[0] = shader_get_uniform(arg0, "u_Uvs");
        _swapper.index[0] = shader_get_uniform(arg0, "u_paletteId");
        _swapper.texture[0] = shader_get_sampler_index(arg0, "u_palTexture");
    }
    else
    {
        if (arg1 == undefined || arg2 == undefined)
        {
            show_message("Must provide pal_swap_init_system() with 2 additional arguments for HTML5 Compatible Sprite and Surface Shaders");
            game_end();
        }
        _swapper.html5_sprite = arg1;
        _swapper.html5_surface = arg2;
        _swapper.texel_size[1] = shader_get_uniform(arg1, "u_pixelSize");
        _swapper.uvs[1] = shader_get_uniform(arg1, "u_Uvs");
        _swapper.index[1] = shader_get_uniform(arg1, "u_paletteId");
        _swapper.texture[1] = shader_get_sampler_index(arg1, "u_palTexture");
        _swapper.texel_size[2] = shader_get_uniform(arg2, "u_pixelSize");
        _swapper.uvs[2] = shader_get_uniform(arg2, "u_Uvs");
        _swapper.index[2] = shader_get_uniform(arg2, "u_paletteId");
        _swapper.texture[2] = shader_get_sampler_index(arg2, "u_palTexture");
    }
    return _swapper;
}

function pal_swap_set_ext(arg0, arg1, arg2, arg3)
{
    if (arg1 == 0)
        exit;
    shader_set(arg2.shader);
    var _tex = sprite_get_texture(arg0, 0);
    var _UVs = sprite_get_uvs(arg0, 0);
    texture_set_stage(arg2.texture[0], _tex);
    var _texel_x = texture_get_texel_width(_tex);
    var _texel_y = texture_get_texel_height(_tex);
    var _texel_hx = _texel_x * 0.5;
    var _texel_hy = _texel_y * 0.5;
    shader_set_uniform_f(arg2.texel_size[0], _texel_x, _texel_y);
    shader_set_uniform_f(arg2.uvs[0], _UVs[0] + _texel_hx, _UVs[1] + _texel_hy, _UVs[2], _UVs[3]);
    shader_set_uniform_f(arg2.index[0], arg1);
}

function pal_swap_set_custom(arg0, arg1, arg2, arg3)
{
    if (arg1 == 0)
        exit;
    shader_set(arg2);
    var _tex = sprite_get_texture(arg0, 0);
    var _UVs = sprite_get_uvs(arg0, 0);
    var sampler_index = shader_get_sampler_index(arg2, "u_palTexture");
    texture_set_stage(sampler_index, _tex);
    var _texel_x = texture_get_texel_width(_tex);
    var _texel_y = texture_get_texel_height(_tex);
    var _texel_hx = _texel_x * 0.5;
    var _texel_hy = _texel_y * 0.5;
    shader_set_uniform_f(shader_get_uniform(arg2, "u_pixelSize"), _texel_x, _texel_y);
    shader_set_uniform_f(shader_get_uniform(arg2, "u_Uvs"), _UVs[0] + _texel_hx, _UVs[1] + _texel_hy, _UVs[2], _UVs[3]);
    shader_set_uniform_f(shader_get_uniform(arg2, "u_paletteId"), arg1);
}

function pal_swap_reset_custom()
{
    if (shader_current() != -1)
        shader_reset();
}
