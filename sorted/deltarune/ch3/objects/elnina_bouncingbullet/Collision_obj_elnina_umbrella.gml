if (bounce_buffer <= 0)
{
    snd_stop(snd_bump);
    if (i_ex(obj_tenna_zoom) && obj_tenna_zoom.con < 2 && obj_tenna_zoom.minigameinsanity == false)
        snd_play_x(snd_bump, 1, 1.5);
    var bouncespeed = 9;
    bounce_buffer = 3;
    vspeed = -bouncespeed;
    forceminigametocontinue = false;
    var plusdirection = point_direction(other.x, other.y, x, y) - 90;
    direction += plusdirection;
    if (up_h())
        vspeed -= 2;
    if (down_h())
    {
        if (vspeed < -3)
            vspeed += 3;
    }
    if (right_h())
        hspeed += 2;
    if (left_h())
        hspeed -= 2;
    if (i_ex(obj_tenna_minigame_ui) && i_ex(obj_elnina_umbrella) && i_ex(obj_tenna_zoom) && obj_tenna_zoom.con < 2)
    {
        obj_elnina_umbrella.scorevar++;
        if (obj_elnina_umbrella.scorevar == 1)
            scr_tenna_add_score(2);
        if (obj_elnina_umbrella.scorevar == 2)
            scr_tenna_add_score(2);
        if (obj_elnina_umbrella.scorevar == 3)
            scr_tenna_add_score(2);
        if (obj_elnina_umbrella.scorevar == 4)
            scr_tenna_add_score(3);
        if (obj_elnina_umbrella.scorevar == 5)
            scr_tenna_add_score(3);
        if (obj_elnina_umbrella.scorevar == 5)
            obj_elnina_umbrella.scorevar = 0;
    }
    with (object_index)
    {
        if (bounce_count == 1)
        {
            with (obj_lanino_rematch_enemy)
                scr_mercyadd(myself, 5);
            with (obj_elnina_rematch_enemy)
                scr_mercyadd(myself, 5);
            if (i_ex(obj_tenna_zoom) && obj_tenna_zoom.con == 1 && obj_tenna_zoom.minigameinsanity == false)
            {
                obj_tenna_zoom.con = 2;
                obj_tenna_zoom.timer = -1;
            }
        }
        if (bounce_count > 0)
            bounce_count--;
    }
}
