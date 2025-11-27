function findsprite(arg0, arg1 = "all", arg2 = -99999, arg3 = -99999, arg4 = -99999, arg5 = -99999, arg6 = -99999)
{
    var layerstocheck = [];
    var spritestocheck = [];
    if (arg1 == "all")
        layerstocheck = layer_get_all();
    else
        layerstocheck = [arg1];
    for (var i = 0; i < array_length(layerstocheck); i++)
    {
        var elements = layer_get_all_elements(layerstocheck[i]);
        for (var j = 0; j < array_length(elements); j++)
        {
            if (layer_get_element_type(elements[j]) == 4)
            {
                if (layer_sprite_get_sprite(elements[j]) == arg0)
                    array_push(spritestocheck, elements[j]);
            }
        }
    }
    for (var i = 0; i < array_length(spritestocheck); i++)
    {
        var isitme = true;
        if (arg2 != -99999)
        {
            if (layer_sprite_get_blend(spritestocheck[i]) != arg2)
                isitme = false;
        }
        if (arg3 != -99999)
        {
            if (layer_sprite_get_xscale(spritestocheck[i]) != arg3)
                isitme = false;
        }
        if (arg4 != -99999)
        {
            if (layer_sprite_get_yscale(spritestocheck[i]) != arg4)
                isitme = false;
        }
        if (arg5 != -99999)
        {
            if (layer_sprite_get_index(spritestocheck[i]) != arg5)
                isitme = false;
        }
        if (arg6 != -99999)
        {
            if (layer_sprite_get_speed(spritestocheck[i]) != arg6)
                isitme = false;
        }
        if (isitme)
            return spritestocheck[i];
    }
    debug_message("asset not found");
    return -4;
}

function findspriteinfo(arg0, arg1 = "all", arg2 = -99999, arg3 = -99999, arg4 = -99999, arg5 = -99999, arg6 = -99999)
{
    var spr = findsprite(arg0, arg1, arg2, arg3, arg4, arg5, arg6);
    var myreturn = 
    {
        sprite_index: layer_sprite_get_sprite(spr),
        image_index: layer_sprite_get_index(spr),
        image_speed: layer_sprite_get_speed(spr),
        image_xscale: layer_sprite_get_xscale(spr),
        image_yscale: layer_sprite_get_yscale(spr),
        image_angle: layer_sprite_get_angle(spr),
        image_blend: layer_sprite_get_blend(spr),
        image_alpha: layer_sprite_get_alpha(spr),
        x: layer_sprite_get_x(spr),
        y: layer_sprite_get_y(spr)
    };
    return myreturn;
}
