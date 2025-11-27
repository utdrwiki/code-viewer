scr_flag_set(7, 1);
global.interact = 0;
con = 0;
customcon = 0;
blackall = scr_dark_marker(-10, -10, spr_pixel_white);
blackall.image_xscale = 999;
blackall.image_yscale = 999;
blackall.depth = 94000;
blackall.image_alpha = 0.65;
blackall.image_blend = c_black;
blackall.visible = 1;
bgm[0] = snd_init("rtenna_zoom.ogg");
bgm[1] = -4;
bgm_start = false;
with (obj_caterpillarchara)
{
    fun = 1;
    follow = 0;
    visible = 0;
}
