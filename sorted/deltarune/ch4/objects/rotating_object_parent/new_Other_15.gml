if (global.inv < 0)
{
    snd_stop(snd_hurt1);
    snd_play(snd_hurt1);
    if (i_ex(obj_rotating_tower_controller_new) && obj_rotating_tower_controller_new.appearance == 2)
    {
        with (obj_climb_kris)
        {
            obj_climb_kris.fallingcon = 1;
            obj_climb_kris.fallingtimer = 12;
            global.interact = 1;
            with (obj_mainchara)
                alarm[1] = 7;
            other.hit = 1;
            global.heartx = x - 6 - camerax();
            global.hearty = y - 6 - cameray();
        }
        exit;
    }
    if (target != 3)
        scr_damage();
    if (target == 3)
        scr_damage_all_overworld();
    with (obj_darkcontroller)
        charcon = 1;
    global.interact = 1;
    with (obj_mainchara)
        alarm[1] = 7;
    hit = 1;
}
