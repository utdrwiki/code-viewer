if (bullet.invincibility < 0)
{
    if (con == 0)
    {
        con = 1;
        savey = bullet.y + 20 + irandom(35);
        snd_stop(snd_punch_ish_1);
        snd_play_x(snd_punch_ish_1, 0.3, 1.3);
        snd_stop(snd_bump);
        snd_play_x(snd_bump, 0.3, 1.2);
        event_user(0);
        with (bullet)
            event_user(0);
    }
}
