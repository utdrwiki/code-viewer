if (image_index > 7)
    instance_destroy();
if (image_index >= 5)
    image_blend = merge_color(c_white, c_black, 0.4);
if (image_index >= 6)
    image_blend = merge_color(c_white, c_black, 0.8);
if (image_index >= 7)
    image_blend = c_black;
if (image_index == 1)
{
    var lifetime = 8;
    var startalpha = 0.5;
    snd_stop(snd_knight_cut2);
    snd_play_x(snd_knight_cut2, 0.5, 1.3);
    if (slash1 == 0)
    {
        slash1 = scr_dark_marker(x - 12, y - 18, spr_bullet_knightcrescent);
        with (slash1)
        {
            image_speed = 0;
            image_index = 0;
            image_alpha = startalpha;
            scr_lerpvar("image_alpha", startalpha, 0, lifetime, 2, "in");
            scr_lerpvar("image_yscale", image_yscale, image_yscale * 2, lifetime, 2, "out");
            scr_doom(id, lifetime + 1);
            gravity = -0.5;
            hspeed = 2;
        }
    }
    if (slash2 == 0)
    {
        slash2 = scr_dark_marker(x - 12, y - 18, spr_bullet_knightcrescent);
        with (slash2)
        {
            image_yscale = -2;
            image_speed = 0;
            image_index = 1;
            image_alpha = startalpha;
            scr_lerpvar("image_alpha", startalpha, 0, lifetime, 2, "in");
            scr_lerpvar("image_yscale", image_yscale, image_yscale * 2, lifetime, 2, "out");
            scr_doom(id, lifetime + 1);
            gravity = 0.5;
            hspeed = 2;
        }
    }
}
fade = scr_afterimage();
fade.image_alpha = 0.3;
fade.fadeSpeed = 0.05;
fade.image_blend = image_blend;
fade.depth = depth + 1000;
