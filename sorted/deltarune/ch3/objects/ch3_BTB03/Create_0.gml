layer_depth("TILES_Curtains", 90000);
if (scr_debug() && global.tempflag[90] == 2)
{
    with (obj_mainchara)
        setxy(2046, 434);
    with (obj_caterpillarchara)
    {
        if (name == "susie")
            setxy(2028, 354);
        if (name == "ralsei")
            setxy(2028, 274);
        scr_caterpillar_interpolate();
    }
}
con = -1;
customcon = 0;
var staff_x_pos = -1500;
var staff_y_pos = 498;
lanino_marker = scr_dark_marker(3998 + staff_x_pos, staff_y_pos, spr_npc_lanino_slouch);
with (lanino_marker)
{
    scr_depth();
    image_speed = 0;
}
elnina_marker = scr_dark_marker(4094 + staff_x_pos, staff_y_pos + 1, spr_npc_elnina_slouch);
with (elnina_marker)
{
    scr_depth();
    image_speed = 0;
}
staff_markers = [lanino_marker, elnina_marker];
staff_leave = false;
staff_leave_timer = 0;
staff_index = 0;
staff_leave_loop = false;
staff_cleanup = false;
staff_leave_phase = 0;
spotlight = -4;
show_spotlight = false;
hide_spotlight = false;
dustpile = instance_create(2111, 420, obj_ch3_BTB_dustpile);
with (dustpile)
{
    max_plot = 280;
    scr_depth();
}
dustpile.target_cutscene = id;
dustpile_block = instance_create(dustpile.x + 30, dustpile.y, obj_solidblocksized);
dustpile_readable = instance_create(dustpile.x, dustpile.y, obj_readable_room1);
with (dustpile_readable)
{
    extflag = "dustpile_02";
    image_xscale = 2;
    image_yscale = 2;
}
if (global.plot >= 280)
{
    staff_cleanup = true;
    with (dustpile_block)
        instance_destroy();
    with (dustpile_readable)
        instance_destroy();
}
musfade = 0;
musvol = 1;
