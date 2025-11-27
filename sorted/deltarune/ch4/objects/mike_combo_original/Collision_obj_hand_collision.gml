if (cooldown <= 0 && action > 2 && action < 6)
{
    fade = 1;
    cooldown = 30;
    alarm[0] = 1;
    hp -= 1;
    snd_play(snd_spell_pacify);
    var num = 8;
    dir = irandom(360);
    for (i = 0; i < num; i++)
    {
        with (instance_create_depth(x + lengthdir_x(16, (i / num) * 360), y + lengthdir_y(16, (i / num) * 360), depth - 1, obj_heart_sparkle))
            motion_set(other.dir, irandom_range(4, 6));
        dir += ((i / num) * 360);
    }
}
