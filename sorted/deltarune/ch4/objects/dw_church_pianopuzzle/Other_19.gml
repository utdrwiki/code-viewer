var spritesArray = layer_get_all_elements("DEBUG_ASSETS");
for (var i = 0; i < array_length(spritesArray); i++)
{
    if (layer_sprite_get_sprite(spritesArray[i]) == 4600)
    {
        var info = scr_assetgetinfo(spritesArray[i]);
        blueflame = instance_create(info[2], info[3], obj_dw_church_warpflame);
        with (blueflame)
        {
            roomtarg = 181;
            entrance = 8;
            color = "blue";
        }
    }
    if (layer_sprite_get_sprite(spritesArray[i]) == 1021)
    {
        var info = scr_assetgetinfo(spritesArray[i]);
        with (instance_create(info[2], info[3], obj_solidblock))
        {
            sprite_index = spr_pxwhite;
            image_blend = c_black;
            depth = layer_get_depth("Tiles_new_midground") - 10;
            scr_size(info[4], info[5]);
        }
    }
}
