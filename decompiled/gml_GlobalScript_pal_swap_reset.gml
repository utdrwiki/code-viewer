pal_swap_reset = function() //gml_Script_pal_swap_reset
{
    if global.Pal_Shader_Is_Set
        shader_reset()
    global.Pal_Shader_Is_Set = 0
    return;
}

