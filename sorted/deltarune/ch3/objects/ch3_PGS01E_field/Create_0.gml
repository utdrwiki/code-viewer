con = -1;
customcon = 0;
blackall = scr_dark_marker(-10, -10, spr_pixel_white);
blackall.image_xscale = 999;
blackall.image_yscale = 999;
blackall.depth = 90000;
blackall.image_blend = c_black;
blackall.image_alpha = 1;
scr_lerp_instance_var(blackall, "image_alpha", 1, 0, 60);
create_writer = false;
with (obj_mainchara)
    visible = 0;
rudinn_marker = scr_dark_marker(420, 196, spr_diamond_overworld);
with (rudinn_marker)
{
    scr_depth();
    image_speed = 0.1;
}
rudinn_marker = scr_dark_marker(366, 156, spr_diamond_overworld);
with (rudinn_marker)
{
    image_xscale = -2;
    scr_depth();
    image_speed = 0.1;
}
scr_losechar();
if (i_ex(obj_caterpillarchara))
{
    with (obj_caterpillarchara)
        instance_destroy();
}
if (global.plot < 45)
    con = 0;
else
    instance_destroy();
