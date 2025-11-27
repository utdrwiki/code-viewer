with (obj_collidebullet)
{
    target = 1;
    damage = 0;
    global.hp[target] = global.maxhp[target];
}
with (obj_face)
    depth = -2;
with (obj_writer)
    prevent_mash_buffer = 3;
if (!(global.is_console || onSteamDeck()))
{
    if (audio_get_recorder_count() == 0 && global.right_click_mic == 0)
        global.right_click_mic = 2;
}
if (phase == 0 && canclick)
{
    global.msgno = 0;
    for (i = 0; i < 100; i++)
        global.msg[i] = stringsetloc("", "obj_mike_minigame_controller_slash_Step_0_gml_38_0");
    with (obj_mike_controller)
        x = scr_approach(x, 320, 10);
    with (obj_heroparent)
    {
        if (place_meeting(x, y, obj_hand_collision) && x == xstart)
        {
            other.phase = 999;
            other.petting = 0;
            other.alarm[5] = 15;
            with (obj_mike_battle)
            {
                move = true;
                spd = 16;
            }
            with (obj_writer)
                instance_destroy();
            with (obj_hand_collision)
                instance_destroy();
        }
    }
    with (obj_mike_battle)
    {
        if (place_meeting(x, y, obj_hand_collision) && x == newx)
        {
            act = 1;
            other.phase = 1;
            other.petting = 3;
            blush = 50;
            mus_volume(global.batmusic[1], 1, 10);
            with (obj_hand_collision)
                instance_destroy();
        }
    }
}
if (phase == 2)
{
    with (obj_mike_battle)
        move = true;
    with (obj_heroparent)
    {
        if (other.alarm[5] <= 0)
            x = scr_approach(x, xstart - 300, 8);
    }
}
else
{
    if (move_party)
    {
        with (obj_darkener)
            darken = 0;
    }
    with (obj_heroparent)
    {
        if (other.alarm[5] <= 0)
            x = scr_approach(x, xstart, 8);
    }
    with (obj_mike_controller)
        hand_distance = scr_approach(hand_distance, 240, 8);
}
if (phase == 1)
{
    phase = 2;
    timer = 0;
    wave = 0;
    alpha = 1;
    talking = false;
    life = 3;
    difficulty = 0;
    if (!instance_exists(obj_darkener))
        instance_create(0, 0, obj_darkener);
    with (obj_darkener)
        depth = obj_herokris.depth + 1;
    with (obj_writer)
        instance_destroy();
    switch (obj_mike_battle.sprite_index)
    {
        case spr_mike_m:
            action = 1;
            break;
        case spr_mike_med:
            action = 1;
            break;
        case spr_mike_l:
            action = 2;
            break;
        case spr_mike_big:
            action = 2;
            break;
        case spr_mike_s:
            action = 3;
            break;
        case spr_mike_small:
            action = 3;
            break;
    }
    with (obj_mike_controller)
        mic_reset();
}
if (phase == 2)
{
    if (action == 1)
        event_user(10);
    if (action == 2)
    {
        timer++;
        combo_buffer++;
        countdown--;
        with (obj_mike_controller)
        {
            x = scr_approach(x, 140, 10);
            if (other.wave == 2)
                hand_distance = scr_approach(hand_distance, 240, 10);
            else
                hand_distance = scr_approach(hand_distance, 120, 10);
        }
        if (wave == 0)
        {
            myscore = 0;
            mus_volume(global.batmusic[1], 1, 10);
            with (obj_mike_controller)
                type = 5;
            countdown = 1860;
            repeat (5)
                instance_create_depth(80 + irandom_range(-20, 20), 280 + irandom_range(-20, 20), depth + 1, obj_gravity_ball);
            if (!i_ex(obj_gravity_hoop))
                instance_create_depth(room_width - 140, 180, depth + 2, obj_gravity_hoop);
            if (!i_ex(obj_volumebar))
                instance_create_depth(0, 0, depth + 2, obj_volumebar);
            wave = 1;
        }
        if (wave == 1)
        {
            if (countdown <= 0)
            {
                wave = 2;
                mus_volume(global.batmusic[1], 0.25, 10);
                with (obj_mike_minigame_tv)
                {
                    latestscore[minigame] = other.myscore;
                    if (other.myscore > hiscore[minigame])
                    {
                        hiscore[minigame] = other.myscore;
                        global.flag[1699] = other.myscore;
                        snd_play(snd_won);
                        other.new_hiscore = 120;
                    }
                    else
                    {
                        snd_play(snd_coin);
                    }
                }
            }
        }
        if (game_over)
        {
            myscore = 0;
            timer = 0;
            phase = 3;
            with (obj_gravity_ball)
            {
                scr_sparkle(8);
                instance_destroy();
            }
            with (obj_gravity_hoop)
            {
                scr_sparkle(8);
                instance_destroy();
            }
        }
    }
    if (action == 3)
    {
        if (wave == 0)
        {
            mus_volume(global.batmusic[1], 1, 10);
            with (obj_mike_controller)
                type = 8;
            if (!i_ex(obj_volumebar))
                instance_create_depth(0, 0, depth + 2, obj_volumebar);
            fuel = 100;
            myscore = 0;
            wave = 1;
            timer = 10;
            level_timer = 0;
            level = 1;
            cave_speed = 30;
            cave_speed2 = cave_speed;
            cave_direction = 0;
            cave_height = 110;
            cave_y = 190;
            cave_last_top = -1;
            cave_last_bottom = -1;
            cave_angle[0] = 0;
            cave_angle[1] = 5;
            cave_max = 1;
            timer = 0;
            obj_mike_controller.vis = true;
            cat_timer = 60;
            cat_max = 60;
            meteor_timer = 0;
            meteor_max = 60;
            meteor_number = 2;
        }
        var _vol = obj_mike_controller.microphone_volume / 100;
        timer++;
        cave_timer++;
        meteor_timer++;
        cat_timer++;
        level_timer++;
        with (obj_mike_controller)
        {
            x = scr_approach(x, 160, 10);
            hand_distance = scr_approach(hand_distance, 120, 10);
            if (mx > x)
                hand_xscale = -1;
            else
                hand_xscale = 1;
        }
        if (wave == 1)
        {
            _vol = 0;
            if (timer > 30)
            {
                cave_speed2 = 4;
                cave_height = 120;
                wave = 2;
                cave_speed = 4;
                cave_max = 2;
            }
        }
        if (level_timer > 149)
        {
            cave_speed2 = scr_approach(cave_speed2, 18, 0.5);
            meteor_number = scr_approach(meteor_number, 11, 0.25);
            meteor_max = scr_approach(meteor_max, 40, 2);
            cat_max = scr_approach(cat_max, 30, 1);
            level_timer = 0;
        }
        if (wave > 0 && wave < 3)
        {
            cave_speed = lerp(cave_speed, cave_speed2 + (1 + (_vol * 10)), 0.5);
            if (cave_speed >= 20)
                cave_speed = 20;
            var _catheld = 0;
            if (obj_mike_controller.hand_type == 2)
                _catheld = 0.23;
            fuel = scr_approach(fuel, 0, 0.1 + _catheld);
            last_fuel = lerp(last_fuel, fuel, 0.1);
            if (cave_timer > cave_max)
            {
                cave_timer = 0;
                if (cave_last_top == -1)
                {
                    cave_last_top = create_wall(room_width, cave_y - cave_height, 50, 0);
                }
                else
                {
                    var _newx = cave_last_top.x + lengthdir_x(cave_last_top.image_xscale, cave_last_top.image_angle);
                    var _newy = cave_last_top.y + lengthdir_y(cave_last_top.image_xscale, cave_last_top.image_angle);
                    var _newangle = irandom_range(-2, 2);
                    if (_newy < (cave_y - cave_height - 10))
                        _newangle = irandom_range(-2, -8);
                    if (_newy > ((cave_y - cave_height) + 10))
                        _newangle = irandom_range(2, 8);
                    if (_newx < 2000)
                    {
                        var _a = create_wall(_newx, _newy, irandom_range(60, 120), _newangle + cave_direction);
                        cave_last_top.next = _a;
                        cave_last_top = _a;
                        with (cave_last_top)
                        {
                            image_yscale = -200;
                            if (other.cave_direction != 0)
                                scroll_up = true;
                        }
                    }
                }
                if (cave_last_bottom == -1)
                {
                    cave_last_bottom = create_wall(room_width, cave_y + cave_height, 50, 0);
                }
                else
                {
                    var _newx = cave_last_bottom.x + lengthdir_x(cave_last_bottom.image_xscale, cave_last_bottom.image_angle);
                    var _newy = cave_last_bottom.y + lengthdir_y(cave_last_bottom.image_xscale, cave_last_bottom.image_angle);
                    var _newangle = irandom_range(-2, 2);
                    if (_newy < ((cave_y + cave_height) - 10))
                        _newangle = irandom_range(-2, -8);
                    if (_newy > (cave_y + cave_height + 10))
                        _newangle = irandom_range(2, 8);
                    if (_newx < 2000)
                    {
                        var _a = create_wall(_newx, _newy, irandom_range(60, 120), _newangle + cave_direction);
                        cave_last_bottom.next = _a;
                        cave_last_bottom = _a;
                        with (cave_last_bottom)
                        {
                            image_yscale = 200;
                            if (other.cave_direction != 0)
                                scroll_up = true;
                        }
                    }
                }
                if (cave_height > 100)
                    cave_height = 100;
            }
        }
        if (frac(level_timer / 30) == 0)
        {
            myscore += (round((cave_speed * cave_speed) / 10) + 10);
            if (cave_speed >= 19)
                myscore += 200;
        }
        if (fuel <= 25)
        {
            var rate = 10;
            if (fuel <= 10)
                rate = 3;
            if (fuel <= 0)
                rate = 6;
            if ((cave_timer % rate) == 0)
            {
                with (scr_marker_ext(obj_heart.x + 10, obj_heart.y + 10, spr_cakesmoke))
                {
                    image_speed = 1;
                    depth = obj_heart.depth - 1;
                    vspeed = random_range(-2, 2);
                    hspeed = (other.cave_speed * -1) - random(2);
                    scr_lerpvar_instance(id, "image_alpha", 0.9, 0, 10);
                    scr_doom(id, 10);
                    scr_darksize(id);
                    if (other.fuel <= 0)
                    {
                        sprite_index = spr_realisticexplosion;
                        snd_stop(snd_badexplosion);
                        snd_play(snd_badexplosion, 0.5, 1 + random_range(-0.1, 0.1));
                    }
                    else
                    {
                        snd_play(snd_wing, 0.5, 1 + random(0.1));
                    }
                }
            }
        }
        if (wave == 2)
        {
            if (meteor_timer > meteor_max)
            {
                meteor_timer = 0;
                randomize();
                for (var _i = 0; _i < meteor_number; _i++)
                {
                    var _newy = cave_y + irandom_range(-cave_height * 0.85, cave_height * 0.85);
                    if (cave_last_top != -1 && cave_last_bottom != -1)
                        _newy = choose(cave_last_top.y + irandom_range(cave_height * 0.1, cave_height * 0.9), cave_last_bottom.y - irandom_range(cave_height * 0.1, cave_height * 0.9));
                    with (instance_create_depth(room_width + 50 + (_i * 130), _newy, depth - 2, obj_meteor))
                    {
                        while (collision_circle(x, y, 32, obj_meteor, 1, 1))
                        {
                            var _dir = point_direction(other.x, other.y, x, y);
                            x += lengthdir_x(4, _dir);
                            y += lengthdir_y(4, _dir);
                        }
                    }
                }
            }
            if (cat_timer > (cat_max / max(1, _vol * 4)))
            {
                cat_timer = 0;
                var _newy = cave_y + irandom_range(-cave_height * 0.85, cave_height * 0.85);
                if (cave_last_top != -1 && cave_last_bottom != -1)
                    _newy = choose(cave_last_top.y + irandom_range(cave_height * 0.35, cave_height * 0.85), cave_last_bottom.y - irandom_range(cave_height * 0.35, cave_height * 0.85));
                var _cat = 378;
                if (_vol < 0.1)
                    _cat = choose(378, 378, 788);
                instance_create_depth(room_width + 80, _newy, depth - 2, _cat);
            }
        }
        var _move_spd = 2;
        with (obj_meteor)
        {
            angle += (rotate_speed * myside);
            x += lengthdir_x(other.cave_speed, other.cave_direction - 180);
            var _col = collision_circle(x, y, 4, obj_cavern_wall, 1, 0);
            if (_col)
            {
                var _dir = point_direction(x, y, x, y - _col.image_yscale);
                x += lengthdir_x(_move_spd, _dir);
                y += lengthdir_y(_move_spd, _dir);
            }
            _col = collision_circle(x, y, 32, obj_meteor, 1, 1);
            if (_col)
            {
                var _dir = point_direction(other.x, other.y, x, y);
                x += lengthdir_x(_move_spd, _dir);
                y += lengthdir_y(_move_spd, _dir);
            }
        }
        with (obj_blue_cat)
        {
            x += lengthdir_x(other.cave_speed, other.cave_direction - 180);
            if (action == 0 && speed == 0)
            {
                var _col = collision_circle(x, y, 10, obj_cavern_wall, 1, 0);
                if (_col)
                {
                    var _dir = point_direction(x, y, x, y - _col.image_yscale);
                    x += lengthdir_x(_move_spd, _dir);
                    y += lengthdir_y(_move_spd, _dir);
                }
            }
        }
        with (obj_green_cat)
        {
            x += lengthdir_x(other.cave_speed, other.cave_direction - 180);
            if (action == 0)
            {
                var _col = collision_circle(x, y, 10, obj_cavern_wall, 1, 0);
                if (_col)
                {
                    var _dir = point_direction(x, y, x, y - _col.image_yscale);
                    x += lengthdir_x(_move_spd, _dir);
                    y += lengthdir_y(_move_spd, _dir);
                }
            }
        }
        with (obj_gold_cat)
        {
            x += lengthdir_x(other.cave_speed, other.cave_direction - 180);
            if (action == 0)
            {
                var _col = collision_circle(x, y, 10, obj_cavern_wall, 1, 0);
                if (_col)
                {
                    var _dir = point_direction(x, y, x, y - _col.image_yscale);
                    x += lengthdir_x(_move_spd, _dir);
                    y += lengthdir_y(_move_spd, _dir);
                }
            }
        }
        var _cave_scroll = false;
        with (obj_cavern_wall)
        {
            x += lengthdir_x(other.cave_speed, other.cave_direction - 180);
            if (x > (obj_heart.x - 10) && x < obj_heart.x)
            {
                if (scroll_up)
                    _cave_scroll = true;
            }
        }
        var _scroll_speed = 1;
        var _volume_speed = 0;
        with (obj_cavern_wall)
        {
            y += (_vol * _volume_speed);
            if (_cave_scroll)
                y += _scroll_speed;
        }
        with (obj_green_cat)
        {
            y += (_vol * _volume_speed);
            if (_cave_scroll)
                y += _scroll_speed;
        }
        with (obj_gold_cat)
        {
            y += (_vol * _volume_speed);
            if (_cave_scroll)
                y += _scroll_speed;
        }
        with (obj_blue_cat)
        {
            y += (_vol * _volume_speed);
            if (_cave_scroll)
                y += _scroll_speed;
        }
        with (obj_meteor)
        {
            y += (_vol * _volume_speed);
            if (_cave_scroll)
                y += _scroll_speed;
        }
        with (obj_heart_sparkle)
        {
            x += lengthdir_x(other.cave_speed, other.cave_direction - 180);
            y += (_vol * _volume_speed);
        }
        with (obj_gravity_text)
        {
            x += lengthdir_x(other.cave_speed, other.cave_direction - 180);
            y += (_vol * _volume_speed);
        }
        if (fuel == 0)
        {
            gameover_timer++;
            obj_mike_minigame_bg.image_blend = merge_colour(c_black, c_red, clamp(sin(current_time / 200) * 0.5, 0, 0.5));
            if ((current_time >> 7) & 1)
                obj_mike_controller.vis = false;
            else
                obj_mike_controller.vis = true;
            if (gameover_timer > 30)
            {
                game_over = true;
                obj_mike_minigame_bg.image_blend = c_black;
                obj_mike_controller.vis = true;
            }
        }
        else
        {
            obj_mike_minigame_bg.image_blend = c_black;
            obj_mike_controller.vis = true;
            gameover_timer = 0;
        }
        if (game_over)
        {
            with (obj_cavern_wall)
                instance_destroy();
            with (obj_green_cat)
            {
                scr_sparkle(8);
                instance_destroy();
            }
            with (obj_blue_cat)
            {
                scr_sparkle(8);
                instance_destroy();
            }
            with (obj_gold_cat)
            {
                scr_sparkle(8);
                instance_destroy();
            }
            with (obj_meteor)
            {
                scr_sparkle(8);
                instance_destroy();
            }
            with (obj_gold_cat_aura)
                instance_destroy();
            with (obj_mike_controller)
                hand_type = 0;
            mus_volume(global.batmusic[1], 0.5, 10);
            with (obj_mike_minigame_tv)
            {
                latestscore[minigame] = other.myscore;
                if (other.myscore > hiscore[minigame])
                {
                    hiscore[minigame] = other.myscore;
                    global.flag[1698] = other.myscore;
                    snd_play(snd_won);
                    other.new_hiscore = 120;
                }
                else
                {
                    snd_play(snd_coin);
                }
            }
            myscore = 0;
            timer = 0;
            phase = 3;
        }
    }
    if (action == 4)
    {
        var _width = 32 + (obj_mike_controller.line_width / 2);
        timer++;
        if (wave == 0 && timer == 30)
        {
            with (obj_mike_controller)
                type = 4;
            sound_play(snd_power);
            score_next = 30;
            wave = 1;
            timer = 2000;
            if (!i_ex(obj_volumebar))
                instance_create_depth(0, 0, depth + 1, obj_volumebar);
            if (!i_ex(obj_juggle_collision))
                instance_create_depth(0, 0, depth - 1, obj_juggle_collision);
        }
        if (wave < 2)
        {
            with (obj_mike_controller)
            {
                line_ypos = scr_approach(line_ypos, 96, 4);
                y = scr_approach(y, 240 + line_ypos, 4);
                hand_distance = scr_approach(hand_distance, 80, 4);
                line_width = scr_approach(line_width, 120 + min(other.difficulty * 40, 120), 2);
            }
        }
        if (wave == 1)
        {
            if (timer > (280 - min(difficulty * 40, 180)))
            {
                timer = 0;
                if (instance_number(obj_mike_ball) < min(3 + (difficulty * 2), 9))
                {
                    instance_create_depth((room_width / 2) + (_width * ball_side), -32, depth - 1, obj_mike_ball);
                    ball_side = -ball_side;
                }
                else
                {
                    wave = 2;
                    bubble_count = 0;
                    timer = bubble_timer;
                    bubble_num = irandom_range(3, min(3 + difficulty, 9));
                }
            }
        }
        if (wave == 2)
        {
            if (timer > bubble_timer && bubble_count <= bubble_num)
            {
                timer = 0;
                bubble_count++;
                bubble_timer = irandom_range(100, 200) - min(60, difficulty * 20);
                instance_create_depth((room_width / 2) + irandom_range(-160, 160), -32, depth - 2, obj_mike_bubble);
            }
            if (myscore >= score_next && bubble_count > bubble_num)
            {
                var _onscreen = 0;
                with (obj_mike_bubble)
                {
                    if (y > 150)
                        _onscreen++;
                }
                with (obj_mike_ball)
                {
                    if (wobble > 12 && _onscreen == instance_number(obj_mike_bubble))
                        act = 2;
                }
                if ((instance_number(obj_mike_ball) - instance_number(obj_mike_bubble)) == 0)
                {
                    wave = 3;
                    timer = 150;
                }
            }
        }
        if (wave == 3)
        {
            if (timer > 150 && instance_number(obj_mike_bubble) == 0)
            {
                timer = 0;
                difficulty++;
                snd_play(snd_lancerlaugh);
                var _l = instance_create_depth(room_width / 2, -64, depth - 1, obj_mike_lancer);
                _l.max_hits = irandom_range(4, min(10, 5 + difficulty));
                ball_side = -ball_side;
                wave = 4;
            }
        }
        if (wave == 4)
        {
            if (instance_number(obj_mike_lancer) == 0)
            {
                wave = 1;
                timer = 200;
                score_next = score + (irandom_range(25, 35) * 100);
            }
        }
        if (game_over)
        {
            mus_volume(global.batmusic[1], 0.5, 10);
            with (obj_mike_minigame_tv)
            {
                latestscore[minigame] = other.myscore;
                if (other.myscore > hiscore[minigame])
                {
                    hiscore[minigame] = other.myscore;
                    global.flag[1699] = other.myscore;
                    snd_play(snd_won);
                    other.new_hiscore = 120;
                }
            }
            myscore = 0;
            timer = 0;
            phase = 3;
            with (obj_mike_ball)
            {
                scr_sparkle(8);
                instance_destroy();
            }
            with (obj_mike_cat)
            {
                scr_sparkle(8);
                instance_destroy();
            }
        }
    }
    if (action == 5)
    {
        timer++;
        score_timer++;
        if (score_timer >= 30)
        {
            score_timer = 0;
            myscore += 1;
        }
        if (wave == 0 && timer == 15)
        {
            wave_reset();
            sign_side = 1;
            with (obj_mike_controller)
            {
                type = 1;
                last_type = 1;
            }
            if (!i_ex(obj_volumebar))
                instance_create_depth(0, 0, depth + 1, obj_volumebar);
        }
        with (obj_mike_controller)
            x = scr_approach(x, 180, 12);
        if (timer > wave_timer)
        {
            wave++;
            timer = 0;
            switch (wave)
            {
                case 1:
                case 2:
                case 3:
                case 4:
                case 5:
                case 6:
                case 7:
                case 8:
                    wave_timer -= 2;
                    break;
                case 60:
                case 70:
                case 80:
                case 90:
                    wave_timer -= 5;
                    break;
                case 9:
                    timer = -30;
                    wave_timer -= 2;
                    break;
                case 10:
                    wave_min = 40;
                    wave_max = 70;
                    wave_double = true;
                    wave_dist_min = 3;
                    wave_dist_max = 3;
                    wave_timer = 40;
                    break;
                case 20:
                    wave_min = 30;
                    wave_max = 100;
                    wave_dist_min = 2;
                    wave_dist_max = 2;
                    break;
                case 30:
                    wave_min = 25;
                    wave_max = 125;
                    wave_dist_min = 1.75;
                    wave_dist_max = 2;
                    break;
                case 40:
                    wave_min = 25;
                    wave_max = 140;
                    wave_dist_min = 1.5;
                    wave_dist_max = 1.75;
                    break;
                case 50:
                    wave_min = 20;
                    wave_max = 150;
                    wave_dist_min = 1;
                    wave_dist_max = 2;
                    break;
                case 24:
                case 34:
                case 44:
                case 54:
                case 64:
                case 74:
                case 84:
                case 94:
                    timer = -15;
                    break;
                case 25:
                case 35:
                case 45:
                case 55:
                case 65:
                case 75:
                case 85:
                case 95:
                    applause_speed += 1;
                    break;
                case 999:
                    wave_min = 80;
                    wave_max = 120;
                    wave_timer = 30;
                    applause_speed = 10;
                    break;
                case 100:
                    wave_ang = 15;
                    wave_min = 90;
                    break;
            }
            if (myscore > 1000 && myscore > (last_score + 900) && irandom(min(myscore, 100) > 10))
            {
                last_score = myscore;
            }
            else
            {
                var ob = instance_create_depth(camerax() + camerawidth() + 50, cameray() + 170 + (wave_y * sign_side), depth, obj_mike_pipe);
                ob.hspeed = -applause_speed;
                ob.scale = irandom_range(wave_min, wave_max);
                ob.angle = -wave_ang * random_range(0.5, 1);
                ob.wait = 5;
                if (wave_double && choose(1, 1, 0))
                {
                    sign_side = -sign_side;
                    var ob2 = instance_create_depth(camerax() + camerawidth() + 50, cameray() + 170 + (wave_y * sign_side), depth, obj_mike_pipe);
                    ob2.hspeed = -applause_speed;
                    ob2.angle = -wave_ang * random_range(0.5, 1);
                    ob2.scale = max(40, 170 - (ob.scale * random_range(wave_dist_min, wave_dist_max)));
                    ob2.wait = 5;
                }
                if (choose(0, 1) || !wave_double)
                    sign_side = -sign_side;
            }
        }
        if (hurt)
        {
            hurt = false;
            life -= 1;
            timer = wave_timer - 10;
            with (obj_mike_pipe)
            {
                scr_sparkle_pos(8, x, y + lengthdir_x(scale + 15, image_angle + 180));
                instance_destroy();
            }
            if (life <= 0)
                game_over = true;
        }
        if (game_over)
        {
            mus_volume(global.batmusic[1], 0.5, 10);
            with (obj_mike_minigame_tv)
            {
                latestscore[minigame] = other.myscore;
                if (other.myscore > hiscore[minigame])
                {
                    hiscore[minigame] = other.myscore;
                    global.flag[1698] = other.myscore;
                    snd_play(snd_won);
                    other.new_hiscore = 120;
                }
            }
            myscore = 0;
            wave = 0;
            timer = 0;
            phase = 3;
            with (obj_volumebar)
                instance_destroy();
            with (obj_mike_pipe)
            {
                scr_sparkle_pos(8, x, y + lengthdir_x(scale + 15, image_angle + 180));
                instance_destroy();
            }
        }
    }
}
if (phase == 3)
{
    with (obj_mike_battle)
        act = 0;
    with (obj_mike_controller)
        type = 0;
    hold_quit_timer = 0;
    game_over = false;
    plueyhealth = 3;
    phase = 0;
    talking = false;
    canclick = true;
    with (obj_darkener)
        darken = 0;
    with (obj_mike_controller)
        type = 5;
    with (obj_mike_battle)
        move = false;
    with (obj_herokris)
        idlesprite = spr_kris_dance;
    with (obj_herosusie)
        idlesprite = spr_susie_dance;
    with (obj_heroralsei)
        idlesprite = spr_ralsei_dance;
    battle_text();
}
if (!game_over && phase == 2)
{
    if (button3_h())
        hold_quit_timer = scr_approach(hold_quit_timer, 30, 1);
    else
        hold_quit_timer = scr_approach(hold_quit_timer, 0, 1);
    if (hold_quit_timer == 30)
    {
        game_over = true;
        hold_quit_timer = 0;
        plueyhealth = 0;
        if (action != 3)
            wave = 0;
        if (action == 1)
        {
            event_user(11);
        }
        else
        {
            with (obj_mike_minigame_tv)
            {
                latestscore[minigame] = other.myscore;
                if (other.myscore > hiscore[minigame])
                {
                    hiscore[minigame] = other.myscore;
                    if (other.action == 3)
                        global.flag[1698] = other.myscore;
                    else
                        global.flag[1699] = other.myscore;
                    snd_play(snd_won);
                    other.new_hiscore = 120;
                }
                else if (other.action != 3)
                {
                    snd_play(snd_coin);
                }
            }
        }
    }
}
