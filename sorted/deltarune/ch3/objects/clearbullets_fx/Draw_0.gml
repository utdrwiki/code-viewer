draw_sprite_ext(spr_whitepixel, 0, x, y, image_xscale, image_yscale, 0, c_white, image_alpha);
image_alpha -= 0.1;
if (image_alpha == 0.3)
{
    count--;
    if (count > 0)
    {
        if (con == 0 || con == 1)
        {
            fx = instance_create(x + 60, y, obj_clearbullets_fx);
            fx.count = count;
            fx.con = 1;
        }
        if (con == 0 || con == -1)
        {
            fx = instance_create(x - 60, y, obj_clearbullets_fx);
            fx.count = count;
            fx.con = -1;
        }
    }
}
if (image_alpha < 0.1)
    instance_destroy();
