con = -1
customcon = 0
if (global.chapter != 2 || global.flag[319] > 2)
    instance_destroy()
else
{
    scr_losechar()
    if instance_exists(obj_caterpillarchara)
        instance_destroy(obj_caterpillarchara)
    with (obj_mainchara)
        visible = false
    blackall = scr_marker(-10, -10, spr_pixel_white)
    blackall.image_xscale = 999
    blackall.image_yscale = 999
    blackall.depth = 100
    blackall.image_blend = c_black
    blackall.image_alpha = 1
    berdly_glide = -4
    release_berdly = 0
    hide_berdly = 0
}
