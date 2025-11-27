con = 0;
timer = 0;
init = 0;
siner = 0;
if (global.plot < 249)
{
    global.plot = 249;
    debug_print("plot updated");
}
layer_set_visible("DEBUG_ASSETS", 0);
if (scr_debug())
{
    if (keyboard_check(ord("P")))
    {
    }
}
scr_musicer("titan_pre.ogg");
with (instance_create(0, 0, obj_camera_nudger))
{
    scr_sizeexact(room_width, room_height);
    yamt = 80;
    lerpstrength = 1;
}
var spritesArray = layer_get_all_elements("DEBUG_ASSETS");
for (var i = 0; i < array_length(spritesArray); i++)
{
    if (layer_sprite_get_sprite(spritesArray[i]) == 4600)
    {
        var info = scr_assetgetinfo(spritesArray[i]);
        redflame = instance_create(info[2], info[3], obj_dw_church_warpflame);
        with (redflame)
        {
            musfade = true;
            roomtarg = 277;
            entrance = 3;
            color = "red";
        }
    }
    if (layer_sprite_get_sprite(spritesArray[i]) == 1779)
    {
        var info = scr_assetgetinfo(spritesArray[i]);
        for (i = 0; i < info[4]; i++)
        {
            for (var ii = 0; ii < info[5]; ii++)
            {
                with (instance_create(info[2] + (40 * i), info[3] + (40 * ii), obj_dw_churchc_fallingtiles))
                {
                    image_index = 1;
                    if (irandom(20) == 1)
                        image_index = choose(4, 6);
                    if (i == 0)
                        image_index = 0;
                    if (i == (info[4] - 1))
                        image_index = 2;
                }
            }
        }
    }
}
if (obj_mainchara.y < 320)
{
    with (obj_dw_churchc_fallingtiles)
    {
        instance_create(x, y, obj_solidblocksized);
        instance_destroy();
    }
}
