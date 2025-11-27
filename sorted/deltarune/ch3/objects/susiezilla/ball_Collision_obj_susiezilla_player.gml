if (iframes <= 0)
{
    var _hit = other;
    iframes = 15;
    if (_hit.hitactive && _hit != id)
    {
        snd_stop(snd_punchmed);
        snd_play(snd_punchmed);
        with (_hit)
            event_user(0);
        image_index = 0;
        image_speed = 0;
        hitstop = 4;
        drawshake = hitstop;
        canhit = true;
        washit = true;
        memspeed = _hit.memspeed * 2;
        memdir = _hit.memdir;
        scr_susiezilla_hiteffect(_hit);
    }
}
