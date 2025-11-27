with (obj_susiezilla_gamecontroller)
{
    if (gameover)
        exit;
}
if (state != states.dead && ropeheight == 0)
{
    var _hit = other.id;
    if (_hit.hitactive)
    {
        snd_stop(snd_punchmed);
        snd_play(snd_punchmed);
        with (_hit)
            event_user(0);
        sprite_index = s_spin;
        if (i_ex(obj_tenna_enemy))
            sprite_index = s_hurt;
        image_index = 0;
        image_speed = 0.5;
        state = states.dead;
        state_timer = 0;
        alarm[0] = -1;
        hittimer = 0;
        hitstop = 4;
        drawshake = hitstop;
        canhit = true;
        memspeed = max(_hit.memspeed, 8) + irandom_range(-1, 1);
        memdir = _hit.memdir;
        scr_susiezilla_hiteffect(_hit);
        with (obj_susiezilla_singlescreen_hud_score)
            score_change(other.value);
        with (obj_susiezilla_gamecontroller)
            check_enemies();
    }
}
