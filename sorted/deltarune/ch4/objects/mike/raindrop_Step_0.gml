var controller = 240;
var shelterwidth = 120;
if (place_meeting(x, y + 60, obj_mike_catbasket))
    harmless = 1;
if (y >= (cameray() + 310) || (image_blend != c_red && ((x <= (camerax() + shelterwidth) && controller.has_shelter_on_left) || (x >= ((camerax() + camerawidth()) - shelterwidth) && controller.has_shelter_on_right)) && y >= (cameray() + 124)))
{
    with (scr_marker(x, y, spr_mike_raindrop_land))
    {
        image_xscale = 2;
        image_yscale = 2;
        image_speed = 0.25;
        scr_doom(self, 7);
    }
    vspeed = min(vspeed, 6);
    if (controller == 240)
    {
        var seg = clamp(floor((x - camerax()) / 92), 0, 6);
        snd_play(snds[seg], random_range(0.8, 1.1), 1);
        with (instance_create_depth(x, bbox_bottom + 8, depth, obj_marker))
        {
            image_blend = other.cols[seg];
            sprite_index = spr_whitegradientdown_rhythm;
            image_speed = 0;
            image_alpha = 0.25;
            scr_lerpvar("image_alpha", 0.25, 0, 15);
            scr_lerpvar("image_xscale", 1, 0.25, 15, 2, "out");
            scr_lerpvar("image_yscale", 2, 0.25, 15, 2, "out");
            scr_doom(self, 15);
        }
    }
    instance_destroy();
}
