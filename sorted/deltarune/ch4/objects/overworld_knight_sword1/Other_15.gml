if (active == 1)
{
    with (obj_dw_windy_char)
    {
        top_anim_speed_max = 0.3;
        windspeedchangetimer = 0;
    }
    snd_stop(snd_hurt1);
    snd_play(snd_hurt1);
    global.interact = 1;
    if (target != 3)
        scr_damage();
    if (target == 3)
        scr_damage_all_overworld();
    with (obj_darkcontroller)
        charcon = 1;
    with (obj_mainchara)
        alarm[1] = 12;
    hit = 1;
    if (global.hp[1] <= 1)
    {
        with (obj_overworld_knight_sword1)
        {
            if (id != other.id)
                instance_destroy();
        }
        with (obj_overworld_knight_sword_manager)
            instance_destroy();
        with (obj_church_wind_effect)
        {
            con = 0;
            image_alpha = 0;
        }
        with (obj_ch4_DCA01)
        {
            blackall.depth = 100;
            blackall.image_alpha = 1;
            snd_free_all();
            snd_stop(snd_paper_surf);
            sword_fall = false;
            con = 40;
            customcon = 1;
            with (obj_darkcontroller)
                charcon = 0;
            with (obj_mainchara)
                alarm[1] = -1;
            with (obj_dmgwriter)
                instance_destroy();
        }
    }
}
