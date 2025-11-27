EVENT = 0;
TIMER = 0;
HEARTMADE = 0;
HSINER = 0;
OBMADE = 0;
global.flag[20] = 0;
global.flag[6] = 1;
global.typer = 667;
scr_windowcaption(stringsetloc("THE DEATH", "DEVICE_FAILURE_slash_Create_0_gml_12_0"));
FADEFACTOR = 0;
WHITEFADE = 0;
FADEUP = 0;
DARK_WAIT = 0;
text_timer = 30;
restart = false;
restart_timer = 0;
gamepad_controls = [gp_face1, gp_face2, gp_face3, gp_face4, gp_shoulderl, gp_shoulderlb, gp_shoulderr, gp_shoulderrb, gp_select, gp_start, gp_stickl, gp_stickr, gp_padu, gp_padd, gp_padl, gp_padr];
knight_mode = false;
knight_mode_con = -1;
if (global.chapter > 1)
{
    if (global.chapter == 3)
    {
        if (global.tempflag[93] == 1)
        {
            heart_marker = scr_marker(156, 40, spr_heart);
            heart_marker.depth = depth - 1000;
            heart_marker.image_xscale = 0.5;
            heart_marker.image_yscale = 0.5;
            var previous_times_attempted = scr_get_knight_total_attempts();
            if (previous_times_attempted > 0)
            {
                EVENT = -1;
                knight_mode = true;
                knight_mode_con = 0;
                snd_free_all();
                global.currentsong[0] = snd_init("AUDIO_DRONE.ogg");
                global.currentsong[1] = mus_loop(global.currentsong[0]);
                global.typer = 667;
                global.fc = 0;
                global.flag[6] = 0;
                with (obj_event_manager)
                    trigger_event(UnknownEnum.Value_0, UnknownEnum.Value_13);
                if (variable_global_exists("knight_battle_losses"))
                {
                    global.knight_battle_losses++;
                    if (global.knight_battle_losses >= 2)
                    {
                        knight_mode_con = 20;
                        if (scr_armorcheck_equipped_party(23) == 0)
                            knight_mode_con = 40;
                    }
                    if (global.knight_battle_losses >= 3)
                    {
                        var show_unique_message = false;
                        if (global.tempflag[96] == 1)
                        {
                            global.tempflag[96] = 0;
                            show_unique_message = scr_flag_get(1263) == 0;
                        }
                        if (show_unique_message)
                        {
                            scr_flag_set(1263, 1);
                            knight_mode_con = 30;
                        }
                        else
                        {
                            knight_mode_con = 50;
                        }
                    }
                }
                else
                {
                    global.knight_battle_losses = 1;
                }
                scr_flag_set(1264, global.knight_battle_losses);
            }
        }
    }
    if (!knight_mode)
    {
        with (obj_event_manager)
            trigger_event(UnknownEnum.Value_0, UnknownEnum.Value_13);
        var gameover_bg = instance_create(0, 20, obj_gameoverbg);
        with (gameover_bg)
            scr_depth();
    }
}

enum UnknownEnum
{
    Value_0,
    Value_13 = 13
}
