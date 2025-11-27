if (counter == the_max)
{
    with (scr_dark_marker(x, y, spr_repairsparkle))
    {
        image_blend = c_yellow;
        scr_doom(id, 8);
        scr_scale(3, id);
        scr_lerpvar_instance(id, "image_xscale", 3, 0, 8);
        scr_lerpvar_instance(id, "image_yscale", 3, 0, 8);
        scr_lerpvar_instance(id, "image_angle", 0, 180, 8);
        scr_lerpvar_instance(id, "image_alpha", 1, 0, 4);
        depth = other.depth - 100;
    }
    with (scr_dark_marker(x, y, spr_repairsparkle))
    {
        image_blend = c_lime;
        scr_doom(id, 8);
        scr_scale(3, id);
        scr_lerpvar_instance(id, "image_xscale", 3, 0, 8);
        scr_lerpvar_instance(id, "image_yscale", 3, 0, 8);
        scr_lerpvar_instance(id, "image_angle", 0, 180, 8);
        depth = other.depth - 100;
    }
    with (obj_susiezilla_statue)
    {
        if (hp < maxhp)
        {
            hp = scr_approach(hp, maxhp, 3);
        }
        else
        {
            with (obj_susiezilla_singlescreen_hud_score)
                score_change(1);
        }
        healflash = 5;
        snd_play_pitch(snd_sparkle_gem, 2);
    }
    instance_destroy();
    exit;
}
abs_counter++;
counter += interval;
with (scr_afterimagefast())
{
    image_index = 0;
    image_speed = 0;
    image_blend = c_lime;
    image_xscale = (1.4 + ((global.time % 3) * 0.6)) * 1.35 * 0.375 * 0.65;
    image_yscale = (0.7 + ((global.time % 3) * 0.6)) * 0.85 * 0.375 * 0.65;
    image_angle = other.image_angle;
    scr_lerpvar("image_yscale", image_yscale, 0, 4);
}
var prevx = x;
var prevy = y;
x = xanchor + (xspeed * abs_counter);
y = yanchor + (yspeed * abs_counter) + (sin(counter) * amplitude * amp_choice);
image_angle = point_direction(prevx, prevy, x, y);
