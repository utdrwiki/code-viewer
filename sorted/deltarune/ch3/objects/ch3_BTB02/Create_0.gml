if (scr_debug() && global.tempflag[90] == 1)
{
    with (obj_mainchara)
        setxy(1220, 380);
    with (obj_caterpillarchara)
    {
        if (name == "susie")
            setxy(1220, 300);
        if (name == "ralsei")
            setxy(1220, 220);
        scr_caterpillar_interpolate();
    }
}
con = -1;
customcon = 0;
var staff_x_pos = 0;
var staff_y_pos = -10;
var x_offset = -1340;
shadowman_marker_a = scr_dark_marker(2950 + x_offset, staff_y_pos + 125, spr_shadowman_sad);
with (shadowman_marker_a)
{
    scr_depth();
    image_speed = 0;
}
shadowman_marker_b = scr_dark_marker(2790 + x_offset, staff_y_pos + 166, spr_shadowman_sad);
with (shadowman_marker_b)
{
    scr_depth();
    image_speed = 0;
}
shadowman_marker_c = scr_dark_marker(2900 + x_offset, staff_y_pos + 170, spr_shadowman_sad);
with (shadowman_marker_c)
{
    scr_depth();
    image_speed = 0;
}
saxman_marker_a = scr_dark_marker(3020 + x_offset, staff_y_pos + 162, spr_shadowman_sad);
with (saxman_marker_a)
{
    scr_depth();
    image_speed = 0;
}
saxman_marker_b = scr_dark_marker(2820 + x_offset, staff_y_pos + 120, spr_shadowman_sad);
with (saxman_marker_b)
{
    scr_depth();
    image_speed = 0;
}
zapper_marker_a = scr_dark_marker(3180 + x_offset, staff_y_pos + 150, spr_zapper_jump);
with (zapper_marker_a)
{
    scr_depth();
    image_speed = 0;
    image_xscale = -2;
}
zapper_marker_b = scr_dark_marker(2888 + x_offset, staff_y_pos + 133, spr_zapper_jump);
with (zapper_marker_b)
{
    scr_depth();
    image_speed = 0;
    image_xscale = -2;
}
staff_markers = [shadowman_marker_a, saxman_marker_a, zapper_marker_a, zapper_marker_b, saxman_marker_b, shadowman_marker_b, shadowman_marker_c];
staff_leave = false;
staff_leave_timer = 0;
staff_index = 0;
staff_leave_loop = false;
staff_cleanup = false;
for (var i = 0; i < array_length(staff_markers); i++)
{
    with (staff_markers[i])
    {
        x = round(x / 2) * 2;
        y = round(y / 2) * 2;
        var amt = (bbox_bottom - 230) / 55;
        amt = clamp(amt, 0, 1);
        scr_depth_alt();
    }
}
dustpile = instance_create(1280, 185, obj_ch3_BTB_dustpile);
with (dustpile)
{
    max_plot = 270;
    scr_depth();
}
dustpile.target_cutscene = id;
dustpile_block = instance_create(dustpile.x + 30, dustpile.y, obj_solidblocksized);
dustpile_readable = instance_create(dustpile.x, dustpile.y, obj_readable_room1);
with (dustpile_readable)
{
    extflag = "dustpile_01";
    image_xscale = 2;
    image_yscale = 2;
}
if (global.plot >= 270)
{
    staff_cleanup = true;
    with (dustpile_block)
        instance_destroy();
    with (dustpile_readable)
        instance_destroy();
}
