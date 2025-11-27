con = 0;
timer = 0;
init = 0;
siner = 0;
layer_set_visible("DEBUG_ASSETS", 0);
layer_set_visible("BGCOLOR", 1);
if (scr_debug())
{
    if (keyboard_check(ord("P")))
        global.flag[1595] = 0;
}
ripplemanager = instance_create(0, 0, obj_church_ripple_area_manager);
ripplemanager.active = true;
riparea = instance_create(0, 0, obj_church_ripple_area);
riparea.visible = false;
scr_sizeexact(room_width, room_height, riparea);
solidarea = -4;
floorswitch = -4;
keepinlines = [];
