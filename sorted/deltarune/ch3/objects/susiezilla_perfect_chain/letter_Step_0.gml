v_off -= 0.5;
with (obj_susiezilla_gamecontroller)
{
    if (gameover)
        instance_destroy(other.id);
}
if (alarm[0])
{
    val = scr_approach(val, pi, 0.2617993877991494);
    image_yscale = scr_approach(image_yscale, 1, 0.08333333333333333);
}
else
{
    image_yscale = scr_approach(image_yscale, 0, 0.125);
    if (image_yscale == 0)
        instance_destroy();
}
