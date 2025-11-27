snd_play(snd_motor_upper_2, 1, 0.25 + pull_pitch);
pull_pitch += 0.125;
alarm[0] = reverse;
reverse = scr_approach(reverse, 4, 2);
with (instance_create_depth(x - 140, y, depth - 1, obj_bulletparent))
{
    _modifier = 2;
    image_xscale = 1 * _modifier;
    image_yscale = 2 * _modifier;
    sprite_index = spr_finisher_explosion;
    image_index = 6;
    image_speed = -0.5;
    image_blend = c_white;
    speed = 2;
    direction = 0;
    gravity = 2;
    gravity_direction = 0;
    scr_lerpvar("image_xscale", 1 * _modifier, 0, 10);
    scr_lerpvar("image_yscale", 2 * _modifier, 0, 10);
    scr_script_delayed(instance_destroy, 10);
}
