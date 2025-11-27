con = -1;
customcon = 0;
camcon = 0;
timer = 0;
spotlight_con = -1;
sound_check = false;
sound_check_won = false;
game_start = false;
game_active = false;
game_retry = false;
border_switch = false;
laugh_track = false;
laugh_track_timer = 0;
laugh_track_finish = false;
left_button = scr_get_input_name(4);
right_button = scr_get_input_name(5);
if (scr_buttons_swapped())
{
    left_button = scr_get_input_name(5);
    right_button = scr_get_input_name(4);
}
if (scr_debug())
{
    if (!scr_havechar(2) || !scr_havechar(3))
    {
        scr_losechar();
        scr_getchar(2);
        scr_getchar(3);
        room_restart();
    }
}
if (global.plot < 140)
{
    con = 0;
    with (obj_border_controller)
        hide_border();
}
else
{
    con = 31;
    game_retry = true;
    snd_free_all();
    global.interact = 0;
    with (obj_mainchara)
        visible = 0;
    with (obj_caterpillarchara)
        visible = 0;
    var retry_screen = instance_create(0, 0, obj_gameover_retry);
    if (os_type == os_ps4 || os_type == os_ps5)
        retry_screen.split_screen_timer = -3;
}
cheerloop = 0;
cheercon = -1;
lifttimer = 0;
spotlight[0] = -4;
rhythmgame_con = 0;
krispose = 0;
instrument_offset[0] = 0;
instrument[0] = -4;
instruments = 0;
silhouettes = false;
raiser = 0;
pistonsound = 0;
fulltimer = 0;
susie_spotlight = false;
ralsei_spotlight = false;
kris_spotlight = false;
kris_flash = false;
show_debug = false;
audience_cheer = instance_create(0, 0, obj_ch3_audience);
audience_cheer.audience_active = true;
audience_cheer.blend_mode = 13788985;
tutorial_con = 0;
tutorial_current_con = tutorial_con;
tutorial_advance = false;
tutorial_loaded = false;
tv_time = -4;
tv_time_con = 0;
tv_time_active = false;

start_song = function(arg0)
{
    with (obj_actor)
        visible = false;
    var _retry = scr_flag_get(1096) > 0;
    var y_offset = _retry ? 0 : 100;
    if (global.plot >= 150)
        y_offset = 0;
    with (obj_rhythmgame)
    {
        with (performer)
        {
            y += y_offset;
            visible = true;
            sprite_index = spr_kris_rock_2;
        }
        with (drums.performer)
        {
            y += y_offset;
            visible = true;
            sprite_index = spr_susie_drum;
        }
        with (vocals.performer)
        {
            y += y_offset;
            visible = true;
        }
    }
    var is_hardmode = variable_global_exists("band_difficulty") && global.band_difficulty == 1;
    var is_replay = global.plot >= 150;
    with (obj_rhythmgame)
    {
        replayversion = is_replay;
        freeplay = is_replay;
        hardmode = is_hardmode;
        song_id = arg0;
        event_user(0);
    }
    if (variable_global_exists("band_difficulty"))
        global.band_difficulty = 0;
    with (obj_rhythmgame_spotlight_solo)
        con = 2;
};

end_song = function(arg0 = true)
{
    with (obj_rhythmgame_spotlight_solo)
        con = 0;
    with (obj_rhythmgame)
    {
        if (arg0)
            event_user(1);
        with (performer)
        {
            visible = false;
            y -= 100;
        }
        with (drums.performer)
        {
            visible = false;
            y -= 100;
        }
        with (vocals.performer)
        {
            visible = false;
            y -= 100;
        }
    }
};
