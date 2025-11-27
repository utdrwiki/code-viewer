with (obj_susiezilla_gamecontroller)
{
    if (gameover)
        exit;
}
if (state != states.dead && ropeheight == 0)
{
    var _hit = other.id;
    if (_hit.friendly)
    {
        snd_stop(snd_punchmed);
        snd_play(snd_punchmed);
        sprite_index = s_spin;
        image_index = 0;
        image_speed = 0.5;
        state = states.dead;
        state_timer = 0;
        alarm[0] = -1;
        hittimer = 0;
        hitstop = 4;
        drawshake = hitstop;
        canhit = true;
        memspeed = _hit.speed;
        memdir = _hit.direction;
        with (obj_susiezilla_singlescreen_hud_score)
            score_change(other.value);
        with (obj_susiezilla_gamecontroller)
            check_enemies();
        with (_hit)
        {
            if (!unstoppable)
                instance_destroy();
        }
        scr_susiezilla_hiteffect(id);
    }
}
