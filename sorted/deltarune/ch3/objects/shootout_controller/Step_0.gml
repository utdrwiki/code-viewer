if (scr_debug())
{
    if (keyboard_check_pressed(ord("1")))
    {
        state = "wave_outro";
        wave = 0;
        timer = -1;
        scr_debug_print("switch to wave 1");
    }
    if (keyboard_check_pressed(ord("2")))
    {
        state = "wave_outro";
        wave = 1;
        timer = -1;
        scr_debug_print("switch to wave 2");
    }
    if (keyboard_check_pressed(ord("3")))
    {
        state = "wave_outro";
        wave = 2;
        timer = -1;
        scr_debug_print("switch to wave 3");
    }
    if (keyboard_check_pressed(ord("H")))
        kris_hp = 5;
}
if (i_ex(obj_tenna_enemy))
{
    tennatimer++;
    if (tennatimer == 270 && obj_tenna_zoom.con != 2 && obj_tenna_zoom.minigameinsanity == false)
    {
        with (obj_tenna_zoom)
        {
            con = 2;
            timer = -1;
        }
    }
}
invtimer--;
if (tutorialmode && tutorialorder == 1)
{
}
else
{
    shootout_endtimer++;
}
if (shootout_type == 0 && shootout_endtimer > 540)
    stopspawns = true;
if (shootout_type == 0 && shootout_endtimer > 600)
    endminigame = true;
if (shootout_type == 1 && shootout_endtimer > 540)
    stopspawns = true;
if (shootout_type == 1 && shootout_endtimer == 600)
    endminigame = true;
if (shootout_type == 2 && shootout_endtimer > 540)
    stopspawns = true;
if (shootout_type == 2 && shootout_endtimer == 600)
    endminigame = true;
if (i_ex(obj_tenna_minigame_ui) && obj_tenna_minigame_ui.timer > 240 && i_ex(obj_tenna_zoom) && obj_tenna_zoom.minigameinsanity == false)
    stopspawns = true;
if (music_init == false)
{
    music_init_timer++;
    if (music_init_timer == 10 || !i_ex(obj_tenna_enemy))
    {
        music_init = true;
        var snd = snd_play_complex(0, 0, -1);
        snd_add_complex(snd, 0, 445, 1.5, 0.15, 4, 10, 1);
        snd_add_complex(snd, 1, 374, 1.4, 0.7, 0, 14, 1);
        snd_add_complex(snd, 2, 445, 1.6, 0.1, 2, 10, 1);
        snd_add_complex(snd, 3, 445, 1.55, 0.05, 6, 10, 1);
    }
}
switch (state)
{
    case "intro":
        kris_actionable = false;
        var _intro_duration;
        if (i_ex(obj_ch3_GSD03))
            _intro_duration = 90;
        if (!i_ex(obj_ch3_GSD03))
            _intro_duration = 5;
        current_train = shootout_carriages[0];
        if (i_ex(obj_ch3_GSD03))
            obj_shootout_horse.x = kris_x + kris_x2 + (sin(current_time / 600) * 8);
        if (!i_ex(obj_ch3_GSD03))
            kris_x = ease_out_back(ease_in_sine(max(0, timer - 0), 0, _intro_duration, _intro_duration), -120, 180, _intro_duration - 0);
        train_x_prev = 650;
        train_x_target = -current_train.x_offset + 150;
        train_x = ease_out_sine(timer, train_x_prev, train_x_target - train_x_prev, _intro_duration);
        if (timer >= _intro_duration)
        {
            kris_actionable = true;
            state = "main";
            timer = -1;
            aim_x = current_window.x;
            aim_y = current_window.y;
        }
        break;
    case "wave_intro":
        kris_actionable = false;
        current_train = shootout_carriages[wave - 1];
        train_x_target = -current_train.x_offset + 150;
        var _intro_duration = 120;
        if (i_ex(obj_tenna_enemy))
        {
            layer_hspeed(bg, lerp(layer_get_hspeed(bg), -(wave * 1), timer / _intro_duration));
            layer_hspeed(md_back, lerp(layer_get_hspeed(md_back), -(wave * 2), timer / _intro_duration));
            layer_hspeed(md, lerp(layer_get_hspeed(md), -(wave * 3), timer / _intro_duration));
            layer_hspeed(fg, lerp(layer_get_hspeed(fg), -4 - (wave * 4), timer / _intro_duration));
        }
        else
        {
            layer_hspeed("bg", lerp(layer_get_hspeed("bg"), -(wave * 1), timer / _intro_duration));
            layer_hspeed("md_back", lerp(layer_get_hspeed("md_back"), -(wave * 2), timer / _intro_duration));
            layer_hspeed("md", lerp(layer_get_hspeed("md"), -(wave * 3), timer / _intro_duration));
            layer_hspeed("fg", lerp(layer_get_hspeed("fg"), -4 - (wave * 4), timer / _intro_duration));
        }
        var _factor = ease_in_sine(timer, 0, 1, _intro_duration);
        train_x = ease_out_back(_factor, train_x_prev, train_x_target - train_x_prev, 1, 1);
        with (obj_shootout_carriage)
            image_speed = lerp(image_speed, 0.5 + (other.wave * 0.5), 0.2);
        if (timer >= _intro_duration)
        {
            kris_actionable = true;
            state = "main";
            timer = -1;
            aim_x = current_window.x;
            aim_y = current_window.y;
        }
        break;
    case "wave_outro":
        hazard_warning = -1;
        kris_actionable = false;
        train_x_target = -current_train.x_offset + 150;
        if (timer == 0)
        {
            with (obj_shootout_window)
                event_user(14);
        }
        if (timer < 10)
        {
            train_x = lerp(train_x, train_x_target, 0.2);
        }
        else
        {
            train_x_prev = train_x_target;
            timer = -1;
            if (wave < 3)
                wave++;
            state = "wave_intro";
        }
        break;
    case "main":
        train_x = train_x_target + (sin(timer / 20) * 10);
        if (obj_shootout_controller.shootout_type == 3)
        {
            with (obj_shootout_window)
                krspopout = false;
            with (obj_shootout_window)
                event_user(12);
        }
        var _prev_col = current_window_column;
        var _prev_row = current_window_row;
        current_window_column = (1 + right_h()) - left_h();
        current_window_column = clamp(current_window_column, 0, window_columns - 1);
        current_window_row = (1 + down_h()) - up_h();
        current_window_row = clamp(current_window_row, 0, window_rows - 1);
        var _new_window = windows[current_window_column][current_window_row];
        if (_new_window.active == false)
        {
            current_window_column = _prev_col;
            current_window_row = _prev_row;
        }
        else
        {
            current_window = _new_window;
            current_window.krspopout = true;
        }
        aim_x = lerp(aim_x, current_window.x, 0.7);
        aim_y = lerp(aim_y, current_window.y, 0.7);
        if (point_distance(aim_x, aim_y, current_window.x, current_window.y) < 3)
        {
            aim_x = current_window.x;
            aim_y = current_window.y;
        }
        if (hazard_warning >= 0 && endminigame == false)
        {
            if (hazard_warning == 0)
            {
                var _hazard = instance_create_depth(640, kris_y_ground, depth - 1, obj_shootout_cactus);
                _hazard.hspeed = -4 - (wave * 4);
            }
            hazard_warning--;
        }
        if (timer == 0 && endminigame == false)
        {
            pattern_performed = array_create(50, 0);
            pattern = -1;
            pattern_timer = 0;
        }
        if (pattern == -1 && endminigame == false)
        {
            var _a = 0;
            if (shootout_type > 0)
                _a = 0.5;
            pattern = 1;
            if (room == room_shootout && scr_flag_get(1232) != 0)
                pattern_timer = 22;
            else if (i_ex(obj_tenna_enemy) && obj_tenna_enemy.cowboy1tooknodamage == true)
                pattern_timer = 22;
            else
                pattern_timer = 27;
            if (endminigame == true)
                pattern = -1;
        }
        if (pattern_timer == 0 && endminigame == false)
        {
            pattern_performed[pattern] += 1;
            debug_message("pattern: " + string(pattern));
        }
        switch (pattern)
        {
            case 0:
                if (pattern_timer >= 10)
                {
                    pattern = -1;
                    pattern_timer = -1;
                }
                break;
            case 1:
                if (pattern_timer >= 270 || endminigame == true)
                {
                    pattern_prev = pattern;
                    pattern = 0;
                    pattern_timer = -1;
                    break;
                }
                var createenemy = true;
                if (tutorialmode == true && hitcount < 3)
                {
                    for (var i = 0; i < instance_number(obj_shootout_window); i++)
                    {
                        enemy[i] = instance_find(obj_shootout_window, i);
                        if (enemy[i].type == 1 && (enemy[i].char_state == "idle" || enemy[i].char_state == "aim" || enemy[i].char_state == "shoot" || enemy[i].char_state == "hit"))
                            createenemy = false;
                    }
                }
                if (i_ex(obj_tenna_zoom) && obj_tenna_zoom.minigameinsanity == true)
                    createenemy = false;
                insanitytimer++;
                if (((pattern_timer % windowdelay) == 0 && stopspawns == false && alarm[1] < 1 && tennatimer < 240 && createenemy == true) || (i_ex(obj_tenna_zoom) && obj_tenna_zoom.minigameinsanity == true && insanitytimer == 4))
                {
                    var _rep = 1;
                    if (insanitytimer == 4 && i_ex(obj_tenna_enemy))
                    {
                        obj_tenna_enemy.insanitycowboycount++;
                        if (obj_tenna_enemy.insanitycowboycount == 1)
                            _rep = 2;
                        if (obj_tenna_enemy.insanitycowboycount == 2)
                            _rep = 3;
                        if (obj_tenna_enemy.insanitycowboycount >= 3)
                            _rep = 3;
                        if (i_ex(obj_tenna_zoom) && obj_tenna_zoom.minigameinsanity == true && obj_tenna_zoom.minigameinsanitytimermax <= 40)
                            _rep = 1;
                    }
                    repeat (_rep)
                    {
                        windowcount = 0;
                        if (tutorialmode == false)
                        {
                            with (obj_shootout_window)
                            {
                                if (state != "closed" && column == 1 && row == 0)
                                    other.windowcount++;
                                if (state != "closed" && column == 1 && row == 1)
                                    other.windowcount++;
                                if (state != "closed" && column == 1 && row == 2)
                                    other.windowcount++;
                                if (state != "closed" && column == 0 && row == 1)
                                    other.windowcount++;
                                if (state != "closed" && column == 2 && row == 1)
                                    other.windowcount++;
                            }
                        }
                        var _available_windows;
                        if (windowcount == 5 || tutorialmode == true)
                        {
                            _available_windows = [];
                            with (obj_shootout_window)
                            {
                                if (state == "closed" && active)
                                    array_push(_available_windows, id);
                            }
                        }
                        else
                        {
                            _available_windows = [];
                            with (obj_shootout_window)
                            {
                                if ((state == "closed" && active) && (column == 1 || (column == 0 && row == 1) || (column == 2 && row == 1)))
                                    array_push(_available_windows, id);
                            }
                        }
                        if (array_length(_available_windows) > 0)
                        {
                            var _chosen_window = _available_windows[irandom(array_length(_available_windows) - 1)];
                            if (tutorialmode == true && tutorialorder < 10)
                            {
                                var _column = irandom(2);
                                var _row = irandom(2);
                                tutorialorder++;
                                if (tutorialorder == 1)
                                {
                                    _column = 1;
                                    _row = 1;
                                }
                                if (tutorialorder == 2)
                                {
                                    _column = 2;
                                    _row = 1;
                                }
                                if (tutorialorder == 3)
                                {
                                    _column = 1;
                                    _row = 0;
                                }
                                if (tutorialorder == 4)
                                {
                                    _column = 0;
                                    _row = 1;
                                }
                                if (tutorialorder == 5)
                                {
                                    _column = 1;
                                    _row = 2;
                                }
                                if (tutorialorder == 6)
                                {
                                    _column = 0;
                                    _row = 0;
                                }
                                if (tutorialorder == 7)
                                {
                                    _column = 0;
                                    _row = 2;
                                }
                                if (tutorialorder == 8)
                                {
                                    _column = 2;
                                    _row = 2;
                                }
                                if (tutorialorder == 9)
                                {
                                    _column = 2;
                                    _row = 0;
                                }
                                for (var i = 0; i < instance_number(obj_shootout_window); i++)
                                {
                                    _window[i] = instance_find(obj_shootout_window, i);
                                    if (_window[i].column == _column && _window[i].row == _row)
                                        _chosen_window = _window[i];
                                }
                            }
                            with (_chosen_window)
                            {
                                event_user(12);
                                if (type == 2)
                                    duration = 30;
                                if (other.insanitytimer == 4 && obj_tenna_zoom.minigameinsanitytimermax <= 60)
                                    insta = true;
                            }
                        }
                        if (i_ex(obj_tenna_enemy) && obj_tenna_enemy.cowboy1tooknodamage == true && windowdelay > 15)
                            windowdelay -= 1;
                        else if (windowdelay > 19)
                            windowdelay -= 1;
                    }
                }
                break;
        }
        break;
}
timer++;
pattern_timer++;
if (kris_state == "idle")
{
    if (kris_y == kris_y_ground)
        obj_shootout_kris.sprite_index = kris_can_shoot ? spr_kris_ride_2 : spr_kris_ride_1;
    else
        obj_shootout_kris.sprite_index = kris_can_shoot ? spr_kris_ride_jump_2 : spr_kris_ride_jump_1;
}
if (kris_actionable)
{
    if ((i_ex(obj_tenna_zoom) && obj_tenna_zoom.con != 1) || minigameend == 1)
    {
    }
    else if (button1_p() && shootout_type != 3)
    {
        kris_state = "shoot";
        kris_timer = -1;
    }
}
if (kris_state == "shoot")
{
    if (kris_timer == 0)
    {
        with (obj_shootout_kris)
        {
            var fingerx = x + 28;
            var fingery = y - 16;
            sprite_index = spr_kris_ride_shoot;
            image_index = 0;
            image_speed = 0;
            var impactfx = instance_create(fingerx, fingery, obj_animation);
            impactfx.sprite_index = spr_attack_slap2;
            impactfx.image_xscale = 0.25;
            impactfx.image_yscale = 0.25;
            impactfx.image_blend = c_white;
            for (var i = 0; i < 8; i++)
            {
                var smokefx = scr_marker(fingerx, fingery, spr_slidedust);
                smokefx.hspeed = random_range(-2, 8);
                smokefx.gravity_direction = 180;
                smokefx.gravity = 2 - random(0.4);
                smokefx.image_speed = 0.2;
                smokefx.image_xscale = 2 + random(1);
                smokefx.image_yscale = 2 + random(1);
                smokefx.vspeed = random_range(-4, 0);
                scr_lerp_var_instance(smokefx, "image_alpha", 0.6, 0, 12);
                scr_doom(smokefx, 12);
            }
            snd_play_x(snd_punchmed, 0.8, 0.8 + random(0.2));
            timer = 0;
            shootcon = 2;
        }
        reticle_index = 1;
        with (current_window)
            event_user(13);
        var shot = instance_create_depth(obj_shootout_kris.x + 20, obj_shootout_kris.y - 20, obj_shootout_kris.depth, obj_shootout_vfx_mockup_shot);
        shot.targetx = current_window.x;
        shot.targety = current_window.y;
        shot.hittarget = hitwindow;
        hitwindow = false;
    }
    if (kris_timer >= 3)
    {
        alarm[2] = 10;
        kris_can_shoot = false;
        kris_state = "idle";
        kris_timer = -1;
    }
}
if ((button2_p() && kris_actionable && kris_y == kris_y_ground) && shootout_type != 3)
{
    kris_jump_held = true;
    kris_vy = -10;
}
if ((!button2_h() || (kris_y_ground - kris_y) > 50) && shootout_type != 3)
    kris_jump_held = false;
if (kris_jump_held)
    kris_vy -= 1;
kris_vy += 1;
kris_y += kris_vy;
if (kris_y > kris_y_ground)
{
    if (kris_vy > 1)
        dust_timer = 0;
    kris_y = min(kris_y, kris_y_ground);
    kris_vy = 0;
}
obj_shootout_horse.x = kris_x + kris_x2 + (sin(current_time / 600) * 8);
obj_shootout_horse.y = kris_y;
if (kris_y == kris_y_ground && shootout_type != 3)
{
    obj_shootout_horse.sprite_index = spr_ralsei_horse_run;
    if ((dust_timer % 12) == 0)
    {
        var _dust = instance_create_depth(obj_shootout_horse.x + 24 + irandom(8), kris_y_ground - 18, depth - 2, obj_shootout_dust);
        _dust.hspeed = -4;
    }
    if ((dust_timer % 8) == 0)
    {
        var _dust = instance_create_depth(obj_shootout_horse.x + 48, kris_y_ground - 12, depth - 2, obj_shootout_dust);
        _dust.hspeed = -3.5;
    }
    if ((dust_timer % 6) == 0)
    {
        var _dust = instance_create_depth(obj_shootout_horse.x + 94, kris_y_ground - 12, depth - 2, obj_shootout_dust);
        _dust.hspeed = -3;
    }
    dust_timer++;
}
else
{
    obj_shootout_horse.sprite_index = spr_ralsei_horse_jump;
}
var _jump_y_offset = min((kris_y_ground - kris_y) * 0.15, 8);
with (obj_shootout_kris)
{
    x = obj_shootout_horse.x + 68;
    y = obj_shootout_horse.y - 66 - _jump_y_offset;
    if (other.kris_y == other.kris_y_ground)
    {
        y -= (round(cos(((obj_shootout_horse.image_index + 1) / 8) * pi * 2)) * 2);
    }
    else
    {
    }
}
with (obj_shootout_susie)
{
    x = obj_shootout_horse.x + 38;
    y = obj_shootout_horse.y - 72 - _jump_y_offset;
    if (other.kris_y == other.kris_y_ground)
    {
        sprite_index = spr_susie_ride;
        y -= (round(cos(((obj_shootout_horse.image_index + 2) / 8) * pi * 2)) * 2);
    }
    else
    {
        sprite_index = spr_susie_ride_jump;
    }
}
var _hazard_hit;
with (obj_shootout_horse)
    _hazard_hit = place_meeting(x, y, obj_shootout_hazard);
if (krishit)
    _hazard_hit = 1;
if (_hazard_hit && !kris_invincible && state == "main")
{
    kris_actionable = false;
    kris_invincible = true;
    alarm[1] = 30;
    alarm[0] = 12;
    kris_vy = -8;
    beatwithoutgettinghit = false;
    global.interact = 1;
    if (i_ex(obj_tenna_zoom) && obj_tenna_zoom.con > 1)
    {
    }
    if (i_ex(obj_tenna_enemy))
    {
        scr_shakescreen();
        global.inv = -1;
        obj_tenna_enemy.minigamefailcount++;
        if (obj_tenna_enemy.minigamefailcount == 3 && obj_tenna_zoom.minigameinsanity == false)
        {
            with (obj_tenna_zoom)
            {
                con = 2;
                timer = -1;
            }
        }
    }
    else
    {
        global.inv = -1;
        scr_damage_all_overworld();
        with (obj_darkcontroller)
            charcon = 1;
        with (obj_dmgwriter)
        {
            x = camerax() + 100;
            y += 30;
            if (instance_number(obj_dmgwriter) > 1)
                instance_destroy();
        }
    }
    var _inst = instance_place(x, y, obj_shootout_hazard);
    with (_inst)
        instance_destroy();
    snd_play(snd_hurt1);
}
krishit = false;
if (kris_invincible)
{
    with (obj_shootout_horse)
    {
        if (!instance_exists(flash))
            flash = scr_oflash(true);
    }
    with (obj_shootout_kris)
    {
        if (!instance_exists(flash))
            flash = scr_oflash(true);
    }
    with (obj_shootout_susie)
    {
        if (!instance_exists(flash))
            flash = scr_oflash(true);
    }
}
if (obj_shootout_kris.sprite_index == spr_kris_ride_1 || obj_shootout_kris.sprite_index == spr_kris_ride_jump_1)
{
    if ((timer % 3) == 0)
    {
        var _hrt = scr_afterimage();
        _hrt.depth = depth - 5;
        _hrt.x = obj_shootout_kris.x + 18;
        _hrt.y = obj_shootout_kris.y - 28;
        _hrt.sprite_index = spr_shootout_heart;
        _hrt.image_xscale = 1;
        _hrt.image_yscale = 1;
        _hrt.direction = 135;
        _hrt.speed = 2;
        _hrt.image_speed = 0;
        _hrt.image_index = 1;
        _hrt.fadeSpeed = 0.1;
    }
}
kris_timer++;
susietimer++;
if (button1_p())
    susietimer = 520;
if (button2_p() && i_ex(obj_battleblcon))
    susietimer = 520;
if (susietimer == 350)
{
    global.typer = 75;
    msgsetloc(0, "Hey, what are&you doing!?&Shoot!", "obj_shootout_controller_slash_Step_0_gml_591_0");
    scr_enemyblcon(camerax() + 50, cameray() + 180, 2);
    with (obj_battleblcon)
    {
        sprite_index = spr_battleblcon_v_bigger;
        x += 4;
    }
}
if (susietimer == 520)
{
    with (obj_battleblcon)
        instance_destroy();
    with (obj_writer)
        instance_destroy();
}
if (endminigame == true && !i_ex(obj_tenna_enemy))
{
    endminigametimer++;
    if (endminigametimer == 1)
    {
        minigametext = instance_create(x, y - 150, obj_tenna_enemy_minigametext);
        minigametext.mystring = stringsetloc("ROUND CLEAR!", "obj_shootout_controller_slash_Step_0_gml_604_0");
        minigameend = 1;
    }
    if (endminigametimer > 60)
        kris_x2 += 12;
}
if (kris_x2 == 600)
    scr_fadeout(10);
if (kris_x2 == 720)
{
    global.interact = 3;
    global.facing = 2;
    global.entrance = 1;
    persistent = true;
    if (room == room_shootout)
    {
        if (scr_flag_get(1232) == 0)
            room_goto(room_dw_teevie_cowboy_zone_01_after);
        else
            room_goto(room_dw_teevie_cowboy_zone_02_after);
    }
    instance_create(0, 0, obj_persistentfadein);
    instance_destroy();
}
if (i_ex(obj_tenna_zoom) && obj_tenna_zoom.minigameinsanity == true && obj_tenna_zoom.minigametype == "cowboy" && obj_tenna_zoom.minigamedifficulty == 0)
{
    for (var i = 0; i < instance_number(obj_shootout_window); i++)
    {
        enemy[i] = instance_find(obj_shootout_window, i);
        if ((enemy[i].state == "open" || enemy[i].state == "opening") && enemy[i].char_state != "hit")
            obj_tenna_zoom.minigameinsanitytimer = obj_tenna_zoom.minigameinsanitytimermax - 5;
    }
}
