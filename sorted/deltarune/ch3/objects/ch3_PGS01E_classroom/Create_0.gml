con = -1;
customcon = 0;
blackall = scr_dark_marker(-10, -10, spr_pixel_white);
blackall.image_xscale = 999;
blackall.image_yscale = 999;
blackall.depth = 90000;
blackall.image_blend = c_white;
blackall.image_alpha = 1;
with (obj_mainchara)
    visible = 0;
scr_lerp_instance_var(blackall, "image_alpha", 1, 0, 60);
create_writer = false;
if (global.plot < 45)
    con = 0;
else
    instance_destroy();
