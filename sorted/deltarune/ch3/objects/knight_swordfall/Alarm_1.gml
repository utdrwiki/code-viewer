if (difficulty == 0)
{
    with (instance_create((obj_growtangle.x - 55) + random(110), (obj_growtangle.y - 110) + random(30), obj_fallingsword))
    {
        image_angle = point_direction(x, y, scr_get_box(4), scr_get_box(5));
        direction = image_angle;
        speed = -6;
        speed_gain = 0.3;
        image_xscale = 2;
        scr_lerpvar("image_yscale", 0, -2, 8);
        scr_script_delayed(scr_lerpvar, 8, "image_yscale", -2, 2, 8);
        scr_lerpvar("image_angle", image_angle, image_angle + 360, 16, 1, "out");
        scr_lerpvar("image_alpha", 0, 1, 16, 1, "out");
        finalsword = true;
        grazepoints = 30;
    }
}
if (difficulty == 1)
{
    with (instance_create((obj_growtangle.x + 55) - random(40), (obj_growtangle.y - 110) + random(30), obj_fallingsword))
    {
        image_angle = point_direction(x, y, scr_get_box(4), scr_get_box(5));
        direction = image_angle;
        speed = -6;
        speed_gain = 0.3;
        image_xscale = 2;
        scr_lerpvar("image_yscale", 0, -2, 8);
        scr_script_delayed(scr_lerpvar, 8, "image_yscale", -2, 2, 8);
        scr_lerpvar("image_angle", image_angle, image_angle + 360, 16, 1, "out");
        scr_lerpvar("image_alpha", 0, 1, 16, 1, "out");
        finalsword = true;
        grazepoints = 30;
    }
    with (instance_create((obj_growtangle.x - 55) + random(40), (obj_growtangle.y - 110) + random(30), obj_fallingsword))
    {
        image_angle = point_direction(x, y, scr_get_box(4), scr_get_box(5));
        direction = image_angle;
        speed = -6;
        speed_gain = 0.3;
        image_xscale = 2;
        scr_lerpvar("image_yscale", 0, -2, 8);
        scr_script_delayed(scr_lerpvar, 8, "image_yscale", -2, 2, 8);
        scr_lerpvar("image_angle", image_angle, image_angle + 360, 16, 1, "out");
        scr_lerpvar("image_alpha", 0, 1, 16, 1, "out");
        finalsword = true;
        grazepoints = 30;
    }
}
