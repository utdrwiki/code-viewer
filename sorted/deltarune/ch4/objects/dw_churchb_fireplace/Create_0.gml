con = 0;
timer = 0;
init = 0;
siner = 0;
layer_set_visible("DEBUG_ASSETS", 0);
layer_set_visible("ASSETS_HIDEME", 0);
layer_set_visible("TILES_HIDEME", 0);
if (scr_debug())
{
    scr_setparty(1);
    if (keyboard_check(ord("P")))
    {
    }
}
if (global.plot < 239)
    global.plot = 239;
blackoverlay = scr_marker_ext(0, 0, spr_pxwhite, room_width, room_height, 0, undefined, c_black, 500, undefined, undefined, 0.5);
blackloc = [];
blackprog = 0.25;
caminit = 0;
germark = 0;
lockpoint = 0;
dolock = 0;
pitch = 0.75;
if (scr_debug())
{
    if (!snd_is_playing(global.currentsong[1]))
        scr_musicer("gerson_defeated.ogg", 0.6, 0.75);
    with (obj_border_controller)
    {
        set_border(border_dw_church_b, 1);
        show_border(1);
    }
}
with (obj_border_controller)
    set_custom_effect(6, 1);
