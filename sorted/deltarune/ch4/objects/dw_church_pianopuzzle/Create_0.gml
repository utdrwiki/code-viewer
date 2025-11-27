if (scr_debug())
{
    scr_setparty(1, 1, 0);
    if (keyboard_check(ord("P")))
        global.flag[850] = 7;
    if (keyboard_check(ord("1")))
        global.flag[892] = 0;
}
layer_set_visible("DEBUG_ASSETS", 0);
layer_set_visible("CUTSCENE_MARKERS", 0);
init = 0;
makecage = true;
blackoverlay = -4;
con = 0;
timer = 0;
rhint = 0;
if (global.flag[892] == 1)
{
    con = 99;
    makecage = false;
    with (obj_church_piano_playable)
        solved = 1;
    rhint = 999;
}
rhinttimer = 0;
hinttoget = 0;
if ((global.flag[886] && !global.flag[891]) || (!global.flag[886] && global.flag[891]))
    hinttoget = 1;
if (global.flag[886] && global.flag[891])
{
    hinttoget = -1;
    rhint = 999;
}
if (hinttoget == 0 && global.flag[893])
    rhint = 999;
if (hinttoget == 1 && global.flag[897])
    rhint = 999;
var fightjack = global.tempflag[98];
if (global.flag[850] >= 5)
    fightjack = false;
if (fightjack)
    event_user(9);
with (obj_border_controller)
{
    custom_effect_fade_speed = 0.02;
    stop_custom_effect();
}
scr_musicer("smallpiano_room.ogg");
