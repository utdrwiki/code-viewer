event_inherited();
wobble++;
if (!active)
    y += cos(wobble * 0.075);
if (!active)
{
    if (x < (obj_growtangle.x - 118))
    {
        image_alpha = scr_approach(image_alpha, 0, 0.0625);
        if (image_alpha == 0)
            instance_destroy();
    }
}
if (draw_eye)
    eye_dist = scr_approach(eye_dist, 1, 0.125);
