con = 0;
timer = 0;
init = 0;
siner = 0;
if (global.plot < 244.9)
    global.plot = 244.9;
layer_set_visible("DEBUG_ASSETS", 0);
if (scr_debug())
{
    if (keyboard_check(ord("P")))
    {
    }
}
maxvol = global.flag[16];
instance_create(x, y, obj_musicer_dw_church3);
volume = maxvol;
if (obj_mainchara.y < 640)
    volume = 0;
snd_volume(global.currentsong[1], volume, 0);
shop = -4;
var spritesArray = layer_get_all_elements("DEBUG_ASSETS");
for (var i = 0; i < array_length(spritesArray); i++)
{
    if (layer_sprite_get_sprite(spritesArray[i]) == 4518)
    {
        shop = scr_makenpc_fromasset(spritesArray[i]);
        shop.marker.image_speed = 0.125;
        shop.cost = -1;
        shop.maketype = 0;
    }
    if (layer_sprite_get_sprite(spritesArray[i]) == 4600)
    {
        if (global.plot >= 249)
        {
            if (layer_sprite_get_blend(spritesArray[i]) == 255)
            {
                var info = scr_assetgetinfo(spritesArray[i]);
                redflame = instance_create(info[2], info[3], obj_dw_church_warpflame);
                with (redflame)
                {
                    musfade = true;
                    roomtarg = 280;
                    entrance = 3;
                    color = "red";
                }
            }
        }
        if (layer_sprite_get_blend(spritesArray[i]) == 8061183)
        {
            var info = scr_assetgetinfo(spritesArray[i]);
            pinkflame = instance_create(info[2], info[3], obj_dw_church_warpflame);
            with (pinkflame)
            {
                color = "pink";
                roomtarg = 270;
                entrance = 12;
            }
        }
    }
}
