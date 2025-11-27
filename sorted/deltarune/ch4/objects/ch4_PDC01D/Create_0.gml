scr_musicer("home.ogg");
con = -1;
customcon = 0;
susie_con = 0;
star_fall = false;
star_fall_timer = 0;
star_throw = false;
star_throw_timer = 0;
var tile_cover = scr_marker(-10, -40, spr_pixel_white);
with (tile_cover)
{
    image_blend = c_black;
    image_xscale = 200;
    image_yscale = 10;
}
kris_star = scr_marker(247, 42, spr_krisroom_star);
with (kris_star)
{
    scr_depth();
    visible = 0;
}
asriel_star_cover = scr_marker(122, 45, spr_pixel_white);
with (asriel_star_cover)
{
    scr_depth();
    image_blend = #FFCF80;
    image_xscale = 3;
    image_yscale = 2;
}
asriel_star = scr_marker(123, 45, spr_krisroom_star);
asriel_star.depth = asriel_star_cover.depth - 10;
if (scr_flag_get(747) > 0)
{
    with (kris_star)
        instance_destroy();
    with (asriel_star_cover)
        instance_destroy();
}
stain_cover = scr_marker(264, 160, spr_pixel_white);
with (stain_cover)
{
    depth = 100000;
    image_blend = #EA7536;
    image_xscale = 4;
    image_yscale = 5;
    visible = 0;
}
blackall = scr_dark_marker(-10, -10, spr_pixel_white);
blackall.image_xscale = 999;
blackall.image_yscale = 999;
blackall.depth = 100;
blackall.image_blend = c_black;
blackall.image_alpha = 0;
