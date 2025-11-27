if (destroyed == 0)
{
    destroyed = 1;
    repeat (11)
    {
        effect = instance_create(x + random(20), y + random(20), obj_house_placed_effect);
        effect.image_xscale = random_range(0.4, 0.5) * choose(-1, 1);
        effect.image_yscale = image_xscale * choose(-1, 1);
        effect = instance_create(x + random(20), y + random(20), obj_house_placed_effect);
        effect.image_xscale = random_range(0.4, 0.5) * choose(-1, 1);
        effect.image_yscale = image_xscale * choose(-1, 1);
    }
    image_index = 1;
    snd_stop(snd_explosion_firework);
    snd_play_pitch(snd_explosion_firework, 1.5);
}
