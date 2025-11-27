if (hitted == 0)
{
    event_user(0);
    scr_shakeobj();
    hittype = 1;
    hitcon = 1;
    hspeed = 0;
    vspeed = 0;
    snd_play(snd_ultraswing);
    snd_stop(snd_smallcar_yelp);
    snd_stop(snd_hitcar_little);
    if (obj_susiezilla.image_xscale > 0)
        dirsave = 45;
    else
        dirsave = 135;
    flashtimer = 5;
}
