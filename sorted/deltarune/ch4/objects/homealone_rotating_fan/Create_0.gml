event_inherited();
dialogue_active = false;
talked = 0;
toggle = 0;
is_rotating = false;
sfx_volume = 0;
sfx_target_volume = 0;
sfx = -4;
if (scr_flag_get(784) == 1)
{
    toggle = 1;
    is_rotating = true;
    sfx = snd_loop(snd_smile);
    snd_volume(sfx, 0, 0);
    snd_pitch(sfx, 0.15);
    image_speed = 0.1;
}
else
{
    image_index = scr_flag_get(785);
}
scr_depth();
