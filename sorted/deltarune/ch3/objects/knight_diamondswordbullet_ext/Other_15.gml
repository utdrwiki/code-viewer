if (active == 1)
{
    if (!shakeme && g == 255 && global.inv < 0)
    {
        if (image_angle == 90)
            scr_lerpvar("image_angle", image_angle, image_angle - 10, 6, 1, "out");
        else if (image_angle == 270)
            scr_lerpvar("image_angle", image_angle, image_angle + 10, 6, 1, "out");
        speed *= 0.5;
    }
    if (target != 3)
        scr_damage();
    if (target == 3)
        scr_damage_all();
}
