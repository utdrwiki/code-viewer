con = -1;
customcon = 0;
blackall = scr_marker(-10, -10, spr_pixel_white);
blackall.image_xscale = 999;
blackall.image_yscale = 999;
blackall.depth = -110;
blackall.image_blend = c_black;
overlay = scr_marker(0, 0, spr_whitepx_10);
overlay.image_xscale = (room_width / 10) + 1;
overlay.image_yscale = (room_height / 10) + 1;
overlay.image_blend = merge_color(c_black, c_navy, 0.5);
overlay.image_alpha = 0.6;
overlay.depth = 1000;
if (global.plot < 350)
    con = 0;
else
    instance_destroy();
