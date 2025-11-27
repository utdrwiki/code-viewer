event_inherited();
timer++;
if ((timer > 24 && !irandom(4)) || timer > 40)
{
    if (blank)
    {
        timer = -999;
        scr_lerpvar("image_xscale", image_xscale, 0, 8);
        scr_lerpvar("image_yscale", image_yscale, 0, 8);
        scr_script_delayed(instance_destroy, 8);
    }
    else
    {
        timer = -999;
        alarm[0] = 4;
        scr_lerpvar("image_xscale", image_xscale, 3, 4, 2, "in");
        scr_lerpvar("image_yscale", image_yscale, 3, 4, 2, "in");
    }
}
