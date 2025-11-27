with (obj_chefs_scoretxt)
    instance_destroy();
if (depletionrate < 0.15)
    depletionrate += 0.002;
if (!gamestart)
{
    gamestart = 1;
    mus_play_ext("minigame_kart.ogg", true);
}
if (gameover)
    exit;
timer--;
alarm[0] = 30;
if (timer <= 0 && !i_ex(obj_gameover_minigame))
{
    audio_sound_get_track_position(global.currentsong[0]);
    gameover = true;
    switch (microgame)
    {
        case 0:
            if (win == 0)
            {
                if (scorepoints >= 0)
                {
                    win = 1;
                    snd_play(snd_lancerwhistle);
                }
                else
                {
                    win = -1;
                }
            }
            break;
        case 1:
            win = 1;
            snd_play(snd_lancerwhistle);
            break;
        case 2:
        case 3:
            var _count = 0;
            var _hit = 0;
            if (instance_exists(obj_chefs_evilguest))
            {
                with (obj_chefs_evilguest)
                {
                    _count++;
                    if (hit || stomped)
                        _hit++;
                }
            }
            if (_hit == _count || !instance_exists(obj_chefs_evilguest))
            {
                snd_play(snd_lancerwhistle);
                win = 1;
            }
            break;
        case 4:
        case 5:
            var _count = 0;
            var _hit = 0;
            if (instance_exists(obj_chefs_customer))
            {
                with (obj_chefs_customer)
                {
                    _count++;
                    if (leaving)
                        _hit++;
                }
            }
            if (_hit == _count || !instance_exists(obj_chefs_customer))
            {
                snd_play(snd_lancerwhistle);
                win = 1;
            }
            else
            {
                win = -1;
            }
            break;
    }
}
