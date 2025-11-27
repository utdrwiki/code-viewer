var spritesArray = layer_get_all_elements("DEBUG_ASSETS");
for (var i = 0; i < array_length(spritesArray); i++)
{
    if (layer_sprite_get_sprite(spritesArray[i]) == 4600)
    {
        var info = scr_assetgetinfo(spritesArray[i]);
        greenflame = instance_create(info[2], info[3], obj_dw_church_warpflame);
        with (greenflame)
        {
            roomtarg = 261;
            entrance = 16;
            musfade = true;
            color = "green";
        }
        var blocker = scr_genmarker("churchc_fireblock");
        with (instance_create(blocker.x, blocker.y, obj_solidblock))
            scr_sizeexact(blocker.sprite_width, blocker.sprite_height);
    }
}
