if (init == 0)
{
    if (room == room_dark_twostoryTest)
    {
        tilelayer[0] = layer_get_id("TILES");
        var shelfcount = instance_number(obj_dw_church_pushableshelf_darklight);
        for (var i = 0; i < shelfcount; i++)
            instance_list[i] = instance_find(obj_dw_church_pushableshelf_darklight, i);
    }
    if (room == room_dw_church_bookshelfpuzzle1)
    {
        tilelayer[0] = layer_get_id("Tiles_1");
        var shelfcount = instance_number(obj_dw_church_pushableshelf_3x3);
        for (var i = 0; i < shelfcount; i++)
            instance_list[i] = instance_find(obj_dw_church_pushableshelf_3x3, i);
    }
    if (room == room_debug_layeredLevelTest)
    {
        tilelayer[1] = layer_get_id("TILES_FLOOR_0");
        tilelayer[0] = layer_get_id("TILES_FLOOR_1");
    }
    for (var i = 0; i < array_length(tilelayer); i++)
        tiledepth[i] = layer_get_depth(tilelayer[i]);
    init = 1;
}
if (init == 1)
{
    if (active == 0)
    {
        if (obj_mainchara.floorheight != 0 || obj_mainchara.climbing)
            active = 1;
    }
    if (active == 1)
    {
        var _partyclimbing = false;
        if (partyclimb)
        {
            with (obj_caterpillarchara)
            {
                if (special[target] == 1)
                    _partyclimbing = true;
            }
        }
        if (obj_mainchara.floorheight == 0 && !obj_mainchara.climbing && !_partyclimbing)
            active = 2;
        for (var i = 0; i < array_length(instance_list); i++)
        {
            if (i_ex(instance_list[i]))
            {
                with (instance_list[i])
                {
                    scr_depth();
                    depth += 5000;
                }
            }
        }
        for (var i = 0; i < array_length(tilelayer); i++)
            layer_depth(tilelayer[i], 1000000 + (i * 100));
    }
    if (active == 2)
    {
        for (var i = 0; i < array_length(tilelayer); i++)
            layer_depth(tilelayer[i], tiledepth[i]);
        active = 0;
    }
}
