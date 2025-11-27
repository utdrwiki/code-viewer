sword_route = scr_flag_get(1055) == 6;
screen_alpha = 1;
screenwidth = view_wport[0] * 3;
screenheight = view_hport[0];
crttimer = 0;
crt_glitch = 0;
chromStrength = 0.25;
tenna_active = false;
tenna_sprite = 4519;
tenna_anim = 0;
tenna_anim_speed = 0.1;
bg_speed = 1;
bg_speed_max = 0;
star_transition = false;
star_timer = 0;
star_index = 0;
star_count = 6;
star_distance = 120;
star_x = 0;
star_y = 0;
star_rotation = 0;
runner_sprite = 237;
runner_anim = 0;
runner_anim_speed = 0.2;
runner_active = false;
event_chase_active = false;
event_chase = false;
event_x_pos = 640;
event_chase_timer = 0;
event_run_speed = 0;
event_start = false;
event_caught = false;
event_speed_up = false;
event_mode = "quiz";
door_active = false;
door_x_pos = 740;
challenge_ready = false;
challenge_activate = false;
challenge_activate_timer = 0;
challenge_started = false;
screen_anim = 0;
screen_anim_speed = 0.05;
heal_active = false;
heal_anim = 0;
heal_anim_speed = 0.05;
heal_x_pos = 740;
heal_activate = false;
heal_activate_timer = 0;
shakey_active = false;
shakey_x = 0;
shakey_y = 0;
shakey_siner = 0;
screen_x_pos[0] = 0;
screen_x_pos[1] = 416;
screen_x_pos[2] = 832;
screen_x_pos[3] = 1248;
screen_x_pos[4] = 1664;
screen_x_pos[5] = 2080;
screen_x_pos[6] = 2496;
tenna_mode = 0;
tv_anim = 0;
tv_anim_speed = 0.05;
tv_screens[0] = [new Vector2(112, 32), new Vector2(128, 32), new Vector2(32, 64), new Vector2(176, 80)];
tv_screens[1] = [new Vector2(0, 32), new Vector2(48, 64), new Vector2(112, 32), new Vector2(128, 32), new Vector2(160, 32), new Vector2(128, 64), new Vector2(144, 80), new Vector2(176, 64)];
tv_screens[2] = [new Vector2(32, 0), new Vector2(64, 32), new Vector2(80, 32), new Vector2(16, 80), new Vector2(32, 96), new Vector2(64, 80), new Vector2(96, 80), new Vector2(160, 64)];
tv_screens[3] = [new Vector2(48, 64), new Vector2(64, 96), new Vector2(128, 80)];
tv_screens[4] = [new Vector2(96, 16), new Vector2(176, 16), new Vector2(144, 96)];
overlay_active = true;

set_tenna = function(arg0)
{
    tenna_mode = arg0;
    if (tenna_mode == 0)
    {
        bg_speed_max = 0;
        tenna_anim_speed = 0.1;
        tenna_sprite = 4519;
    }
    else if (tenna_mode == 1)
    {
        bg_speed_max = 3;
        tenna_anim_speed = 0.2;
        tenna_sprite = 3227;
    }
    else if (tenna_mode == 2)
    {
        tenna_anim_speed = 0.4;
        bg_speed_max = 6;
    }
    else if (tenna_mode == 3)
    {
        tenna_anim_speed = 0;
        bg_speed_max = 0;
    }
};

star_transition = function()
{
    if (!sword_route)
    {
        var startsnd = 492;
        var endsnd = 493;
        var timespread = 15;
        var transitiontime = 20;
        scr_lerpvar("star_x", 320, (camerax() + (view_wport[0] / 2)) - 20, 8);
        scr_lerpvar("star_y", 192, cameray() + 74, 8);
        scr_lerpvar("star_distance", star_distance, 0, transitiontime);
        scr_delay_var("tenna_active", true, transitiontime);
        scr_delay_var("star_transition", false, transitiontime + 2);
        snd_play_delay(endsnd, transitiontime);
        snd_stop(startsnd);
        snd_play(startsnd);
    }
    else
    {
        tenna_active = true;
        star_transition = false;
    }
};

spawn_heal_spot = function()
{
    heal_active = true;
    heal_anim = 0;
    heal_anim_speed = 0.05;
    heal_x_pos = 540;
    heal_activate = false;
    heal_activate_timer = 0;
    heal_ready = false;
};

spawn_physical_challenge = function()
{
    door_active = true;
    door_x_pos = 540;
    challenge_ready = false;
    challenge_activate = false;
    challenge_activate_timer = 0;
    challenge_started = false;
};

challenge_start = function()
{
    set_tenna(3);
    scr_delay_var("tenna_mode", 0, 30);
    scr_delay_var("bg_speed_max", 0, 30);
    scr_delay_var("tenna_anim_speed", 0.1, 30);
    scr_delay_var("tenna_sprite", 4519, 30);
    scr_delay_var("door_active", false, 30);
    challenge_started = true;
};

event_chase = function(arg0 = "quiz")
{
    event_mode = arg0;
    event_caught = false;
    event_chase_active = true;
    event_x_pos = 500;
    event_run_speed = 1;
    runner_active = true;
    runner_anim = 0;
    runner_anim_speed = 0.08;
    switch (event_mode)
    {
        case "quiz":
            runner_sprite = 237;
            break;
        case "battle":
            runner_sprite = 3703;
            break;
    }
};

event_catch = function()
{
    event_speed_up = true;
    set_tenna(2);
    event_run_speed = 5;
    runner_anim_speed = 0.4;
};

event_start = function()
{
    set_tenna(3);
    event_speed_up = false;
    event_run_speed = 0;
    runner_anim = 0;
    runner_anim_speed = 0;
    event_caught = true;
    if (event_mode == "battle")
    {
        snd_play_delay(snd_tensionhorn, 3, 1, 1.1);
        snd_play_delay(snd_tensionhorn, 10, 1, 1.2);
    }
};

flash_background = function()
{
    for (var i = 0; i < 25; i++)
    {
        var _visible = (i % 2) == 1;
        scr_delay_var("overlay_active", _visible, i * 2);
    }
};
