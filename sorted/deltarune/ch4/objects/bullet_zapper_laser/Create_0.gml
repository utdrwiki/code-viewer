scr_bullet_init();
element = 1;
spin = 0;
spinspeed = 0;
image_alpha = 1;
if (!instance_exists(obj_heart))
    instance_destroy();
wall_destroy = 1;
bottomfade = 0;
image_yscale = 0.2;
image_speed = 0;
image_yscale_goal = 1;
destroyonhit = false;
first = false;
bounce_offset = 14;
do_bounce = false;
if (i_ex(obj_growtangle))
{
    bottom = (obj_growtangle.y + (obj_growtangle.sprite_height / 2)) - 4;
    top = (obj_growtangle.y - (obj_growtangle.sprite_height / 2)) + 4;
}
do_bounce_image = false;
neverbounce = false;
true_neverbounce = false;
blend = #898989;
grazepoints = 2;
