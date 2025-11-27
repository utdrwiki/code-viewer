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
shootout_endtimer++;
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
switch (state)
{
    case "intro":
        kris_actionable = false;
        var _intro_duration = 5;
        current_train = shootout_carriages[0];
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
        if ((timer % 120) == 0)
        {
            if (irandom(2) == 0)
            {
            }
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
            var _speedfactor_start, _speedfactor_end;
            switch (wave)
            {
                case 1:
                    _speedfactor_start = 2 + random(1) + _a;
                    _speedfactor_end = _speedfactor_start + random(0.5) + _a;
                    break;
                case 2:
                    _speedfactor_start = 1.5;
                    _speedfactor_end = 3;
                    break;
                case 3:
                    _speedfactor_start = 2.5;
                    _speedfactor_end = 4;
                    break;
            }
            speedfactor = lerp(_speedfactor_start, _speedfactor_end, clamp(timer / wave_duration, 0, 1));
            if (pattern_prev == 1)
            {
                if (pattern_performed[2] > pattern_performed[3])
                    pattern = 3;
                else
                    pattern = 2;
            }
            else
            {
                pattern = 1;
            }
            if (irandom(10) == 0)
                pattern = 4;
            pattern = 1;
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
                if (pattern_timer == 0)
                {
                }
                if (pattern_timer >= 10)
                {
                    pattern = -1;
                    pattern_timer = -1;
                }
                break;
            case 1:
                if (pattern_timer >= 60)
                {
                    pattern_prev = pattern;
                    pattern = 0;
                    pattern_timer = -1;
                    break;
                }
                var _window_delay = floor(120 - (speedfactor * 30));
                if (_window_delay < 5)
                    _window_delay = 5;
                if ((pattern_timer % _window_delay) == 0 && stopspawns == false && alarm[1] < 1)
                {
                    var _available_windows = [];
                    with (obj_shootout_window)
                    {
                        if (state == "closed" && active)
                            array_push(_available_windows, id);
                    }
                    if (array_length(_available_windows) > 0)
                    {
                        var _chosen_window = _available_windows[irandom(array_length(_available_windows) - 1)];
                        with (_chosen_window)
                        {
                            event_user(12);
                            if (type == 2)
                                duration = 30;
                        }
                    }
                }
                break;
            case 2:
                if (pattern_timer >= floor(150 + (speedfactor * 15)))
                {
                    with (obj_shootout_window)
                    {
                    }
                    pattern_prev = pattern;
                    pattern = 0;
                    pattern_timer = -1;
                    break;
                }
                if (pattern_timer == 10 || pattern_timer == 20 || pattern_timer == 30)
                {
                    with (obj_shootout_window)
                    {
                        if (active)
                        {
                            var _flash = scr_oflash(true);
                            _flash.depth = other.depth - 1;
                        }
                    }
                }
                if (pattern_timer == 40)
                {
                    with (obj_shootout_window)
                    {
                        event_user(12);
                        duration = (type == 1) ? 999 : 60;
                        idle_duration = floor(20 + (other.speedfactor * 15));
                    }
                }
                break;
            case 3:
                var _delay_between = floor(26 - (speedfactor * 3));
                var _time_per_row = _delay_between * (window_columns * 2);
                if (pattern_timer >= (_time_per_row * window_rows))
                {
                    pattern_prev = pattern;
                    pattern = 0;
                    pattern_timer = -1;
                    break;
                }
                var _timer = pattern_timer % _time_per_row;
                var _row = floor(pattern_timer div _time_per_row);
                if (_timer == 0)
                {
                    with (obj_shootout_window)
                        event_user(14);
                }
                if (_timer >= 0 && _timer <= (_delay_between * (window_columns - 1)))
                {
                    if ((_timer % _delay_between) == 0)
                    {
                        var _xx = _timer div _delay_between;
                        if ((_row % 2) == 1)
                            _xx = window_columns - 1 - _xx;
                        with (windows[_xx][_row])
                        {
                            if (!active)
                                continue;
                            event_user(12);
                            type = scr_weighted_choice(1, 2.5, 2, 1);
                            if (shootout_type == 0 || shootout_type == 1)
                                type = 1;
                            if (type == 2)
                                duration = 60;
                            else
                                duration = 9999;
                        }
                    }
                }
                if (_timer >= 0 && _timer <= (_delay_between * ((window_columns * 2) - 1)))
                {
                    with (obj_shootout_window)
                    {
                        if (!active)
                            continue;
                        if (char_state == "idle" && type == 1)
                        {
                            var _shoot_delay = ((column % 2) == 1) ? (_delay_between * other.window_columns) : (_delay_between * (other.window_columns + 2));
                            if (_timer < _shoot_delay)
                                char_timer = min(char_timer, idle_duration - 2);
                            else
                                char_timer = idle_duration;
                        }
                    }
                }
                break;
            case 4:
                if (pattern_timer == 0)
                {
                    var _available_windows = [];
                    with (obj_shootout_window)
                    {
                        if (state == "closed" && active)
                            array_push(_available_windows, id);
                    }
                    if (shootout_type == 0 || shootout_type == 1)
                    {
                    }
                    var _window = _available_windows[irandom(array_length(_available_windows) - 1)];
                    with (_window)
                    {
                        event_user(12);
                        type = 3;
                    }
                }
                if (pattern_timer > floor(50 - (speedfactor * 10)))
                {
                    pattern_prev = pattern;
                    pattern = 0;
                    pattern_timer = -1;
                }
                break;
        }
        if (timer >= wave_duration)
        {
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
    if (kris_actionable)
    {
        if (button1_p() && shootout_type != 3)
        {
            kris_state = "shoot";
            kris_timer = -1;
        }
    }
}
if (kris_state == "shoot")
{
    if (kris_timer == 0)
    {
        obj_shootout_kris.sprite_index = (kris_y == kris_y_ground) ? spr_kris_ride_shoot : spr_kris_ride_jump_shoot;
        obj_shootout_kris.image_index = 0;
        snd_play(snd_gunshot);
        snd_play_x(snd_rocket, 1, 1.5);
        reticle_index = 1;
        with (current_window)
            event_user(13);
        var _line = instance_create_depth(obj_shootout_kris.x + 32, obj_shootout_kris.y - 24, obj_shootout_kris.depth, obj_shootout_line);
        _line.tx = current_window.x;
        _line.ty = current_window.y;
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
if (_hazard_hit && !kris_invincible && state == "main")
{
    kris_actionable = false;
    kris_invincible = true;
    alarm[1] = 30;
    alarm[0] = 12;
    kris_vy = -8;
    global.interact = 1;
    if (i_ex(obj_tenna_enemy))
    {
        scr_shakescreen();
        global.inv = -1;
        obj_tenna_enemy.minigamefailcount++;
        if (obj_tenna_enemy.minigamefailcount == 3)
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
            x = camerax() + 60;
            if (instance_number(obj_dmgwriter) > 1)
                instance_destroy();
        }
    }
    var _inst = instance_place(x, y, obj_shootout_hazard);
    with (_inst)
        instance_destroy();
    snd_play(snd_hurt1);
}
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
if (endminigame == true)
    kris_x2 += 6;
if (kris_x2 == 600)
    scr_fadeout(10);
if (kris_x2 == 720)
{
    if (room == room_shootout)
        room_goto(room_battletest);
    scr_fadein(10);
}
