alarm[1] = 30;
if (replayversion && !i_ex(obj_tenna_enemy))
    instance_create(x, y, obj_minigame_quit_ui);
countdown = clamp(countdown - 1, -1, countdown);
switch (countdown)
{
    case 3:
    case 2:
    case 1:
        snd_play(snd_menumove);
        break;
    case 0:
        snd_play(snd_select);
        break;
    case -1:
        alarm[1] = -1;
        break;
}
