global.flag[7] = 0;
con = -1;
customcon = 0;
scr_setparty(1, 1, 0);
blackall = scr_dark_marker(-10, -10, spr_pixel_white);
blackall.image_xscale = 999;
blackall.image_yscale = 999;
blackall.depth = 100;
blackall.image_blend = c_black;
blackall.visible = 1;
rippler = -4;
ripple_con = -1;
savetension = 0;
susie_timer = 0;
susie_ripple = false;
auto_ripple = true;
force_ripple = false;
msgno = -1;
gerson_marker = -4;
ralsei_marker = -4;
punch = 0;
if (global.plot < 240)
{
    con = 0;
    with (obj_border_controller)
        hide_border();
}
attackpattern_save = 0;
