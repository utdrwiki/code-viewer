if (iframes <= 0)
{
    var _hit = other.daddy;
    var closeenough = 1;
    if (abs(_hit.fakeheight - fakeheight) > sprite_height)
        closeenough = 0;
    if (_hit.canhit == 1 && _hit.hitstop <= 0 && _hit != id && _hit.speed > 0 && hitstop <= 0 && closeenough)
    {
        iframes = 15;
        snd_stop(snd_punchmed);
        snd_play(snd_punchmed);
        image_index = 0;
        image_speed = 0;
        hitcon = 1;
        hitstop = 4;
        drawshake = hitstop;
        canhit = true;
        memspeed = _hit.hitspeed;
        memdir = _hit.hitdir;
        with (_hit)
        {
            hitstop = 4;
            drawshake = 4;
            memspeed = speed;
            memdir = direction;
            speed = 0;
        }
        scr_susiezilla_hiteffect(_hit);
    }
}
