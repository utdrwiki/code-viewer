if (i_ex(target))
{
    image_xscale = target.image_xscale;
    image_yscale = target.image_yscale;
    x = target.x;
    y = target.y;
    sprite_index = target.sprite_index;
    image_index = target.image_index;
}
var fadeopacity = 1;
if (fadetime != -1)
{
    fadetimer++;
    fadeopacity = 1 - clamp(fadetimer / fadetime, 0, 1);
    if (fadetimer >= fadetime)
        instance_destroy();
}
else
{
    if (image_alpha <= 0)
        killtimer--;
    if (killtimer <= 0)
        instance_destroy();
}
draw_set_alpha(image_alpha * fadeopacity);
gpu_set_blendmode(myblend);
gpu_set_fog(true, image_blend, 0, 0);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha * fadeopacity);
gpu_set_fog(false, c_white, 0, 0);
gpu_set_blendmode(bm_normal);
draw_set_alpha(1);
