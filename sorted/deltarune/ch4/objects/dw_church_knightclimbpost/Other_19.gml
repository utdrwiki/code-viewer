if (!i_ex(greenflame))
{
    var spritesArray = layer_get_all_elements("DEBUG_ASSETS");
    for (var i = 0; i < array_length(spritesArray); i++)
    {
        if (layer_sprite_get_sprite(spritesArray[i]) == 4600)
        {
            if (global.plot >= 242)
            {
                var info = scr_assetgetinfo(spritesArray[i]);
                greenflame = instance_create(info[2], info[3], obj_dw_church_warpflame);
                with (greenflame)
                {
                    if (other.flamefade)
                    {
                        image_alpha = 0;
                        scr_lerpvar("image_alpha", 0, 1, 30);
                    }
                    roomtarg = 115;
                    entrance = 16;
                    musfade = true;
                    color = "green";
                }
            }
        }
    }
}
