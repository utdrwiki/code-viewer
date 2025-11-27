con = -1;
customcon = 0;
gameshow_screen = instance_find(obj_dw_gameshow_screen, 0);
for (var i = 0; i < instance_number(obj_quiz_podium); i++)
    podium[i] = instance_find(obj_quiz_podium, i);
blackall = scr_dark_marker(-10, -10, spr_pixel_white);
blackall.image_xscale = 999;
blackall.image_yscale = 999;
blackall.depth = 100;
blackall.image_blend = c_black;
blackall.visible = 0;
bg_vfx = -4;
loop_start = false;
set_gacha = false;
set_lava = false;
lava_screen = -4;
lava_start = false;
show_fire = false;
border_switch = false;
quiz_chase = false;
quiz_chase_catch = false;
quiz_start = false;
quiz = -4;
battle_chase = false;
battle_chase_catch = false;
battle_start = false;
battle_active = false;
battle_sprite = -4;
heal_check = false;
heal_check_finish = false;
spawn_heal = false;
activate_heal = false;
spawn_challenge = false;
activate_challenge = false;
wipe_timer = 0;
tenna_idle = false;
tenna_move = false;
tenna_pause = false;
susie_punch = false;
susie_punch_timer = 0;
susie_punch_sound = true;
screenshot = false;
event_count = 0;
battle_count = 0;
heal_count = 0;
healed_previous = false;
current_encounterno = 133;
board_song_mode = "stop";
board_song_mode_current = board_song_mode;
board_song[0] = -4;
board_song[1] = -4;
heal_party = false;
tenna_convo = "";
convo_active = false;
convo_dismiss_time = 15;
convo_min_timer = convo_dismiss_time;
convo_base_time = 30;
convo_wait_time = convo_base_time;
flash_background = false;
funometer = instance_create(camerax() + view_wport[0] + 80, 17, obj_dw_tv_funometer);
funometer.hope = false;
funometer.fun = 0;
funometer.cracked = true;
funometer.depth = 79000;
if (global.plot == 230)
{
    con = 0;
    blackall.visible = 1;
    bg_vfx = instance_create(0, 0, obj_ch3_GSC07_bg);
}

set_board_song = function(arg0)
{
    var mode = arg0;
    switch (mode)
    {
        case "start":
            if (board_song[0] == -4)
                board_song[0] = snd_init("board_4.ogg");
            board_song[1] = mus_loop_ext(board_song[0], 1, 1);
            break;
        case "stop":
            snd_stop(board_song[1]);
            break;
        case "pause":
            snd_pause(board_song[1]);
            break;
        case "resume":
            snd_resume(board_song[1]);
            break;
    }
};

create_battle = function(arg0)
{
    var encounterno = arg0;
    var bg = instance_create(0, 0, obj_ch3_GSD01_battle_bg);
    battle_count++;
    blackall.depth = 100000;
    blackall.image_alpha = 0;
    blackall.visible = 1;
    scr_script_delayed(scr_lerpvar_instance, 7, bg, "screen_scale_x", 1, 4, 20);
    scr_script_delayed(scr_lerpvar_instance, 7, bg, "screen_scale_y", 1, 4, 20);
    scr_script_delayed(scr_lerpvar_instance, 6, bg, "screen_alpha", 0, 1, 20);
    with (bg)
        scr_var_delay("screen_active", false, 26);
    scr_script_delayed(scr_lerpvar_instance, 7, blackall, "image_alpha", 0, 1, 20);
    scr_script_delayed(scr_lerpvar_instance, 26, bg, "screen_alpha", 1, 0, 5);
    with (blackall)
    {
        scr_var_delay("image_alpha", 0, 32);
        scr_var_delay("visible", 0, 32);
        scr_var_delay("depth", 100, 32);
    }
    scr_doom(bg, 32);
    with (obj_actor)
        visible = 0;
    alarm[1] = 1;
};

create_dialogue_balloon = function(arg0)
{
    var _lifetime = convo_base_time + (string_length(arg0) * 2);
    scr_tennabubble_xytail(arg0, camerax() + 400, cameray() + 240, camerax() + 460, cameray() + 180, _lifetime);
};
