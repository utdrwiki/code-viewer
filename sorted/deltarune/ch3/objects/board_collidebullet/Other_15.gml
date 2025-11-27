if (active == 1)
{
    global.boardhp -= damage;
    snd_play_x(snd_damage, 1, 1.2);
    if (destroyonhit == 1)
        instance_destroy();
}
