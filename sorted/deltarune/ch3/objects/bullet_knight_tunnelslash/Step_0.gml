event_inherited();
timer++;
image_alpha = scr_approach(image_alpha, 1, 0.25);
image_xscale = scr_approach(image_xscale, 1, 1);
if (totalspin)
{
    totalspin *= 0.8;
    direction = aim + totalspin;
    image_angle = direction;
}
if (!alarm[0] && totalspin < 1)
{
    if (speed == 0)
        speed = 4;
    else
        speed = scr_approach(speed, 20, 2);
}
if (x <= (scr_get_box(2) + 12) && y > (scr_get_box(1) + 8) && y < (scr_get_box(3) - 8))
{
    speed = 0;
}
else if (x > (scr_get_box(2) + 50) || (y <= (scr_get_box(1) + 8) || y >= (scr_get_box(3) - 8)))
{
    var afterimage = instance_create(x, y, obj_afterimage);
    afterimage.sprite_index = sprite_index;
    afterimage.image_index = image_index;
    afterimage.image_blend = image_blend;
    afterimage.image_speed = 0;
    afterimage.depth = depth;
    afterimage.image_xscale = image_xscale;
    afterimage.image_yscale = image_yscale;
    afterimage.image_angle = image_angle;
    afterimage.fadeSpeed = 0.1;
    afterimage.image_alpha = 0.4;
}
