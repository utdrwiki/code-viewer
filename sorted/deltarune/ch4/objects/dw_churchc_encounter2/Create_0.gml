con = 0;
timer = 0;
init = 0;
siner = 0;
layer_set_visible("DEBUG_ASSETS", 0);
layer_set_visible("BGCOLOR", 1);
instance_create(0, 0, obj_musicer_dw_church3);
nighttimetiles = [];
array_push(nighttimetiles, layer_get_id("RIPPLEWALLS"));
daytimetiles = [];
array_push(daytimetiles, layer_get_id("FLOORTILES"));
array_push(daytimetiles, layer_get_id("FLOOR_GLOW"));
array_push(daytimetiles, layer_get_id("Assets_1"));
array_push(daytimetiles, layer_get_id("PARALLAX_1"));
array_push(daytimetiles, layer_get_id("FLOORTILES_UPPERLAYER"));
array_push(daytimetiles, layer_get_id("FLOORTILES_LOWERLAYER"));
lightstate = 0;
for (var i = 0; i < array_length(nighttimetiles); i++)
    layer_set_visible(nighttimetiles[i], false);
for (var i = 0; i < array_length(daytimetiles); i++)
    layer_set_visible(daytimetiles[i], true);
if (scr_debug())
{
    scr_setparty(1, 1);
    if (keyboard_check(ord("P")))
        global.flag[1595] = 0;
}
BLACKOUTCON = 0;
riptimer = 0;
ripplemanager = -4;
riparea = instance_create(0, 0, obj_church_ripple_area);
riparea.visible = false;
scr_sizeexact(room_width, room_height, riparea);
if (global.flag[1595] == 2)
{
    scr_script_delayed(event_user, 1, 1);
    BLACKOUTCON = 99;
}
