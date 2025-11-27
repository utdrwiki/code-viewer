with (instance_create(x + (sprite_width * 0.5), (y + (sprite_height * 0.5)) - 30, obj_fallingsword))
{
    alarm[0] = 1;
    image_angle = -90;
    direction = -image_angle;
    speed = -4;
    old_angle[2] = image_angle;
    old_angle[1] = image_angle;
    old_angle[0] = image_angle;
    image_xscale = 1.5;
    image_alpha = 1;
    nosfx = true;
    scr_lerpvar("image_xscale", 1.5, 2, 49, 1, "out");
    scr_lerpvar("image_yscale", 0, -3, 4, 1, "out");
    scr_script_delayed(scr_lerpvar, 4, "image_yscale", -3, 0, 5, 1, "in");
    scr_script_delayed(scr_lerpvar, 9, "image_yscale", 0, 2.5, 6, 1, "out");
    scr_script_delayed(scr_lerpvar, 15, "image_yscale", 2.5, 0, 7, 1, "in");
    scr_script_delayed(scr_lerpvar, 22, "image_yscale", 0, -2.25, 8, 1, "out");
    scr_script_delayed(scr_lerpvar, 30, "image_yscale", -2.25, 0, 9, 1, "in");
    scr_script_delayed(scr_lerpvar, 39, "image_yscale", 0, 2, 10, 1, "out");
}
