var krcol = 15245824;
var sucol = 13138410;
var racol = 1959605;
var dist = 180;
var dbalpha = (lerp_ease_in(0, 1, clamp(camerax(), 0, dist), dist) / dist) + 0.5;
if (drawblack)
{
    with (obj_actor)
    {
        if (visible)
        {
            if (name == "ralsei")
            {
                gpu_set_fog(1, racol, 0, 0);
                draw_self();
                gpu_set_fog(1, c_black, 0, 0);
                draw_sprite_ext(sprite_index, image_index, x, y + 2, image_xscale, image_yscale, image_angle, c_black, 1);
                gpu_set_fog(0, c_white, 0, 0);
            }
        }
    }
    with (obj_actor)
    {
        if (visible)
        {
            if (name == "susie")
            {
                gpu_set_fog(1, sucol, 0, 0);
                draw_self();
                gpu_set_fog(1, c_black, 0, 0);
                draw_sprite_ext(sprite_index, image_index, x, y + 2, image_xscale, image_yscale, image_angle, c_black, 1);
                gpu_set_fog(0, c_white, 0, 0);
            }
        }
    }
    with (obj_actor)
    {
        if (visible)
        {
            if (name == "kris")
            {
                gpu_set_fog(1, krcol, 0, 0);
                draw_self();
                gpu_set_fog(1, c_black, 0, 0);
                draw_sprite_ext(sprite_index, image_index, x, y + 2, image_xscale, image_yscale, image_angle, c_black, 1);
                gpu_set_fog(0, c_white, 0, 0);
            }
        }
    }
}
var count = 0;
var space = 10;
var border = 8;
