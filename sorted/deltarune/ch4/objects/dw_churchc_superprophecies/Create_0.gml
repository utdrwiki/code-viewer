con = 0;
timer = 0;
init = 0;
siner = 0;
musiccon = 0;
glass = [];
var targdepth = layer_get_depth("GLASSMAKER") - 1;
var spritesArray = layer_get_all_elements("GLASSMAKER");
for (var i = 0; i < array_length(spritesArray); i++)
{
    var info = scr_assetgetinfo(spritesArray[i]);
    for (var ii = 0; ii < (info[4] / 80); ii++)
    {
        for (var iii = 0; iii < (info[5] / 80); iii++)
        {
            var daglass = instance_create(info[2] + (ii * 80), info[3] + (iii * 80), obj_dw_church_magicalglass_superprophecy);
            with (daglass)
            {
                depth = targdepth;
                scr_size(2, 2);
            }
            array_push(glass, daglass);
        }
    }
}
if (scr_debug())
{
    scr_setparty(1, 1);
    if (keyboard_check(ord("P")))
        global.flag[1615] = 0;
}
if (global.flag[1615] == 1)
{
    instance_create(x, y, obj_musicer_dw_church3);
    musiccon = 2;
}
layer_set_visible("DEBUG_ASSETS", 0);
gigaprophecy = instance_create_depth(0, 0, 2000010, obj_gigaprophecy);
blackoverlay = scr_marker_ext(0, 0, spr_pxwhite, room_width, room_height, undefined, undefined, c_black, 2000009, undefined, undefined, 1);
blackoverlay.con = 0;
spritesArray = layer_get_all_elements("DEBUG_ASSETS");
for (var i = 0; i < array_length(spritesArray); i++)
{
    if (layer_sprite_get_sprite(spritesArray[i]) == 4600)
    {
        if (global.plot >= 244.9)
        {
            var info = scr_assetgetinfo(spritesArray[i]);
            pinkflame = instance_create(info[2], info[3], obj_dw_church_warpflame);
            with (pinkflame)
            {
                roomtarg = 277;
                entrance = 12;
                color = "pink";
            }
        }
    }
}
with (obj_border_controller)
    set_border(border_dw_church_c);
