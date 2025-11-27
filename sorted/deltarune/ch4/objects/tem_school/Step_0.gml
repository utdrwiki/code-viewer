if (myinteract == 3)
{
    if (i_ex(mydialoguer) == false)
    {
        if (egcon == 1)
            egcon = 2;
        if (egcon == 2)
        {
            egtimer += 1;
            sprite_index = spr_tem_eggput;
            image_index = egtimer / 10;
            if (egtimer >= 60)
            {
                sprite_index = spr_tem_sit;
                egg = scr_marker(x + 29, y + 3, spr_egg);
                egg.depth = depth;
                egcon = 3;
            }
        }
        if (egcon == 3 || egcon == 0)
        {
            global.interact = 0;
            myinteract = 0;
            with (obj_mainchara)
                onebuffer = 5;
        }
    }
}
if (egcon != 2)
{
    if (myinteract == 0)
    {
        facing = dfacing;
        image_speed = 0;
    }
    scr_npcdir();
}
if (song_mode)
{
    if (song_con == 0 && global.interact == 0 && !d_ex())
    {
        global.interact = 1;
        song_con = 1;
        song_index = scr_flag_get(1651);
        audio_pause_all();
        var sound_index = song_index + 1;
        var sound_file_name = "snd_tem_sing_" + string(sound_index);
        var sound_file = asset_get_index(sound_file_name);
        snd_play(sound_file);
        scr_delay_var("song_con", 2, 130);
    }
    if (song_con == 2)
    {
        global.interact = 0;
        song_con = 0;
        song_mode = false;
        audio_resume_all();
        var next_index = scr_wrap_ondy(song_index + 1, song_min, song_max);
        scr_flag_set(1651, next_index);
    }
}
