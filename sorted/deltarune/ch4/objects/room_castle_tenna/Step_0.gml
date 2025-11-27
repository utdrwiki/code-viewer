if (tenna_npc != -4)
{
    if (tenna_con >= 0)
    {
        if (tenna_con == 0 && !i_ex() && global.interact == 0)
        {
            tenna_con = 1;
            global.interact = 1;
            scr_speaker("tenna");
            msgsetloc(0, "* This room is FUNKY and FUNNY!/", "obj_room_castle_tenna_slash_Step_0_gml_13_0");
            msgnextloc("* It may not be my forever home^1, but for now..^1. wow^1, you're great hosts!/", "obj_room_castle_tenna_slash_Step_0_gml_14_0");
            msgnextloc("\\M1* (Not as great a host as me^1, but what can ya do!?)/%", "obj_room_castle_tenna_slash_Step_0_gml_15_0");
            var d = d_make();
            d.side = 0;
        }
        if (tenna_con == 1 && !d_ex())
        {
            global.interact = 0;
            tenna_con = -1;
        }
    }
    if (global.flag[20] == 1)
    {
        with (tenna_npc)
        {
            sprite_index = spr_tenna_whisper;
            x = 478;
            y = 376;
        }
        if (!d_ex())
        {
            with (tenna_npc)
            {
                sprite_index = spr_tenna_dance_cabbage_smol;
                x = xstart;
                y = ystart;
            }
            scr_flag_set(20, 0);
        }
    }
}
if (rouxls_npc != -4)
{
    if (lamp_on && !d_ex())
    {
        lamp_switch_timer++;
        if (lamp_switch_timer == 1)
        {
            snd_play_x(snd_noise, 0.6, 2);
            with (rouxls_npc)
                image_index = 1;
        }
        if ((lamp_switch_timer % 15) == 1)
        {
            snd_play_x(snd_noise, 0.6, 2);
            with (rouxls_npc)
                image_index = 0;
        }
        if ((lamp_switch_timer % 30) == 1)
        {
            snd_play_x(snd_noise, 0.6, 2);
            with (rouxls_npc)
                image_index = 1;
        }
        if (lamp_switch_timer >= 120)
        {
            lamp_switch_timer = 0;
            lamp_on = false;
        }
    }
}
