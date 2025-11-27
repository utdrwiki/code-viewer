repeat (5 + irandom(5))
{
    with (instance_create_depth(x + random_range(-12, 12), y + random_range(-12, 12), depth + 2, obj_particle_generic))
    {
        image_blend = c_white;
        direction = irandom(360);
        speed = 4 + random(6);
        acceleration_type = 1;
        shrink_rate = 0.05 + random(0.05);
        acceleration_rate = 0.9 - random(0.1);
    }
}
snd_play_pitch(snd_hurt1_bc, 0.5);
light = 1;
autolight = false;
halfdrop = true;
check_death(true);
