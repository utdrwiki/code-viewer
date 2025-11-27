depth = -100;
time = 70;
type = 0;
if (scr_debug())
{
    if (keyboard_check_pressed(ord("C")))
    {
        x = camerax() + 320;
        if (type == 0)
            y = cameray() + 200;
        if (sprite_index == spr_tenna_grasp_zoom || sprite_index == spr_tenna_grasp)
            y = cameray() + 100;
        image_xscale = 2;
        image_yscale = 2;
    }
    if (keyboard_check_pressed(ord("D")))
    {
        image_xscale = 2;
        image_yscale = 2;
        zoomcon = 1;
        with (obj_lerpvar)
        {
            if (target.id == other.id)
                instance_destroy();
        }
    }
    if (keyboard_check_pressed(ord("T")))
    {
        sprite_index = spr_tenna_grasp_zoom;
        type = 1;
    }
}
if (zoomcon == 1)
{
    scr_lerpvar("image_xscale", image_xscale, 500, time, 3, "in");
    scr_lerpvar("image_yscale", image_yscale, 500, time, 3, "in");
    if (type == 0)
    {
        scr_lerpvar("y", y, 600, time, 2, "in");
        image_index = 0;
        scr_lerpvar("image_speed", 0.5, 0, time * 0.5);
    }
    zoomcon = 2;
}
