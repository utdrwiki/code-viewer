active = false;
if (i_ex(obj_church_ripple_area_manager))
    active = obj_church_ripple_area_manager.active;
if (active)
{
    if (place_meeting(x, y, obj_mainchara))
    {
        if (triggered == false)
        {
            triggered = true;
            scr_fancy_ripple(obj_mainchara.x + 18, obj_mainchara.y + 72, 50, 65535, 460, 1, 10, 1999980);
            scr_fancy_ripple(obj_mainchara.x + 18, obj_mainchara.y + 72, 50, 65535, 380, 1, 10, 1999980);
            scr_fancy_ripple(obj_mainchara.x + 18, obj_mainchara.y + 72, 50, 65535, 320, 1, 10, 1999980);
            scr_fancy_ripple(obj_mainchara.x + 18, obj_mainchara.y + 72, 50, 65535, 240, 1, 10, 1999980);
            snd_play(snd_bell);
        }
    }
    else
    {
        triggered = false;
    }
}
