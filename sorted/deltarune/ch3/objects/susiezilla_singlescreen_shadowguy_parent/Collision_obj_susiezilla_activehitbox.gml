with (obj_susiezilla_gamecontroller)
{
    if (gameover)
        exit;
}
if (iframes <= 0 && ropeheight == 0 && state != states.dead)
{
    var _hit = other.daddy;
    if (i_ex(_hit))
    {
        iframes = 15;
        var closeenough = 1;
        if (abs(_hit.fakeheight - fakeheight) > 40)
            closeenough = 0;
        if (_hit.canhit == 1 && _hit.hitstop <= 0 && abs(_hit.hitspeed) > 0 && _hit != id && closeenough && state != states.dead)
        {
            snd_stop(snd_punchmed);
            snd_play(snd_punchmed);
            if (i_ex(obj_tenna_enemy))
                scr_tenna_add_score(3);
            sprite_index = s_spin_large;
            image_index = 0;
            image_speed = 0.5;
            state = states.dead;
            state_timer = 0;
            alarm[0] = -1;
            washit = true;
            hitstop = 4;
            drawshake = hitstop;
            canhit = true;
            memspeed = _hit.hitspeed;
            memdir = _hit.hitdir;
            xdes = x;
            ydes = y;
            _hit.hitstop = 4;
            _hit.drawshake = _hit.hitstop;
            _hit.memspeed = _hit.speed;
            _hit.memdir = _hit.direction;
            _hit.speed = 0;
            scr_susiezilla_hiteffect(_hit);
            with (obj_susiezilla_singlescreen_hud_score)
                score_change(other.value);
            with (obj_susiezilla_gamecontroller)
                check_enemies();
        }
    }
}
