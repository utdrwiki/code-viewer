function pal_swap_init_system()
{
    global.Pal_HTML5 = false;
    if (!global.Pal_HTML5)
    {
        global.Pal_Shader = argument[0];
        global.Pal_Texel_Size[UnknownEnum.Value_0] = shader_get_uniform(global.Pal_Shader, "u_pixelSize");
        global.Pal_UVs[UnknownEnum.Value_0] = shader_get_uniform(global.Pal_Shader, "u_Uvs");
        global.Pal_Index[UnknownEnum.Value_0] = shader_get_uniform(global.Pal_Shader, "u_paletteId");
        global.Pal_Texture[UnknownEnum.Value_0] = shader_get_sampler_index(global.Pal_Shader, "u_palTexture");
        global.Pal_Shader_Is_Set = false;
    }
    else
    {
        if (argument_count < 3)
        {
            show_message("Must provide pal_swap_init_system() with 2 additional arguments for HTML5 Compatible Sprite and Surface Shaders");
            game_end();
        }
        global.Pal_HTML5 = true;
        global.Pal_HTML5_Sprite = argument[1];
        global.Pal_HTML5_Surface = argument[2];
        global.Pal_Texel_Size[UnknownEnum.Value_1] = shader_get_uniform(global.Pal_HTML5_Sprite, "u_pixelSize");
        global.Pal_UVs[UnknownEnum.Value_1] = shader_get_uniform(global.Pal_HTML5_Sprite, "u_Uvs");
        global.Pal_Index[UnknownEnum.Value_1] = shader_get_uniform(global.Pal_HTML5_Sprite, "u_paletteId");
        global.Pal_Texture[UnknownEnum.Value_1] = shader_get_sampler_index(global.Pal_HTML5_Sprite, "u_palTexture");
        global.Pal_Texel_Size[UnknownEnum.Value_2] = shader_get_uniform(global.Pal_HTML5_Surface, "u_pixelSize");
        global.Pal_UVs[UnknownEnum.Value_2] = shader_get_uniform(global.Pal_HTML5_Surface, "u_Uvs");
        global.Pal_Index[UnknownEnum.Value_2] = shader_get_uniform(global.Pal_HTML5_Surface, "u_paletteId");
        global.Pal_Texture[UnknownEnum.Value_2] = shader_get_sampler_index(global.Pal_HTML5_Surface, "u_palTexture");
    }
    global.Pal_Layer_Priority = ds_priority_create();
    global.Pal_Layer_Temp_Priority = ds_priority_create();
    global.Pal_Layer_Map = ds_map_create();
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2
}
