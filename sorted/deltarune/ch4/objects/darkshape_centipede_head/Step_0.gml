var hx = obj_heart.x + 10;
var hy = obj_heart.y + 10;
timer++;
image_alpha = scr_approach(image_alpha, 1, 0.035);
if (image_alpha == 1)
{
    xscale = scr_approach(xscale, image_alpha, abs(xscale - image_alpha) * 0.25);
    yscale = scr_approach(yscale, image_alpha, abs(yscale - image_alpha) * 0.25);
}
else
{
    xscale = image_alpha + ((timer % 2) * 0.1);
    yscale = image_alpha + ((timer % 2) * 0.1);
}
if (image_alpha == 1)
    active = true;
tracking_val = scr_approach(tracking_val, 30, 0.037500000000000006);
chase_centipede();
do_shrivel();
check_death();
