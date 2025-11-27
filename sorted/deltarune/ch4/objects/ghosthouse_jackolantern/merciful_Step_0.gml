timer++;
if (quick_start && !feared)
{
    if (fleetype == 0)
        event_user(0);
    else if (fleetype == 1)
        event_user(10);
    else
        event_user(12);
    event_user(2);
    scare_con = -1;
    feared = true;
}
if (scr_debug())
{
    if (sunkus_kb_check_pressed(9))
    {
        fleetype++;
        if (fleetype == 3)
            fleetype = 0;
        if (fleetype == 0)
            debug_print("Taxi Mode");
        if (fleetype == 1)
            debug_print("Corner Huddle Mode");
        if (fleetype == 2)
            debug_print("Herding Mode");
    }
}
if (!init)
{
    if (!quick_start)
        snd_play(snd_jackolantern_laugh);
    else
        sprite_index = spr_jackolantern_frown;
    init = true;
}
if (mercy < 99)
{
    with (obj_jackenstein_enemy)
        other.mercy = global.mercymod[myself];
}
else
{
    mercy++;
}
if (accelmultiplier < 1)
    accelmultiplier = clamp(accelmultiplier + 0.1, 0, 1);
else if (accelmultiplier > 1)
    accelmultiplier = clamp(accelmultiplier - 0.28, 1, 9);
if (end_con >= 4)
{
    with (obj_dmgwriter_boogie)
        instance_destroy();
    fader.image_alpha = clamp01(timer / 30);
    obj_lightsource_heartlight.radius *= 1.1;
    if (timer >= 30)
    {
        with (obj_jackenstein_enemy)
        {
            with (susiemarker)
                instance_destroy();
            with (ralseimarker)
                instance_destroy();
            x = -9999;
            y = -9999;
        }
        with (obj_npc_jackenstein)
            visible = true;
        with (fader)
        {
            scr_script_delayed(scr_lerp_var_instance, 45, id, "image_alpha", 1, 0, 30);
            scr_script_delayed(scr_doom, 45, id, 30, true);
        }
        global.charinstance[0].x = 2256;
        global.charinstance[0].y = 1961;
        global.charinstance[1].x = 2208;
        global.charinstance[1].y = 1945;
        global.charinstance[2].x = 2172;
        global.charinstance[2].y = 1950;
        with (obj_afterimage)
            instance_destroy();
        with (obj_battlecontroller)
            dancing_jackolantern_con = 0;
        if (i_ex(obj_ch4_DCA08D))
        {
            with (obj_ch4_DCA08D.jackenstein)
                stopdrawing = true;
        }
        obj_battlecontroller.skipvictory = 1;
        global.flag[39] = 1;
        global.turntimer = 0;
        with (obj_lightsource_heartlight)
            instance_destroy();
        instance_destroy();
    }
    exit;
}
var _tick_speed = 7;
if (mercy >= 80)
    _tick_speed = 9;
if (mercy >= 90)
    _tick_speed = 10;
if (feared || scare_con >= 1)
    obj_lightsource_heartlight.biggerrad = ceil(lerp(obj_lightsource_heartlight.biggerrad, 300, 0.5));
if (scare_con >= 1)
{
    if (scare_con == 1 && timer >= 10)
        event_user(1);
    if (scare_con == 2 && timer >= 35)
    {
        event_user(1);
        if (i_ex(obj_jackenstein_enemy))
            obj_jackenstein_enemy.spooked = true;
        with (instance_create(obj_battlesolid.x - 120 - (58 * (variable_global_exists("lang") && global.lang == "ja")), obj_battlesolid.y - 134, obj_takingtoolong))
            bright = 1;
        if (variable_global_exists("lang") && global.lang == "ja")
            snd_play(snd_your_too_bright_jp);
        else
            snd_play(snd_your_too_bright);
    }
    if (scare_con == 3 && timer >= 75)
    {
        timer = 0;
        scare_con = -1;
        obj_heart.wspeed = global.sp;
        if (screamcon == 0)
        {
            screamsound = snd_loop(snd_pumpkin_scream_mama);
            sprite_index = spr_jackolantern_cry;
            screamcon = 2;
        }
        event_user(10);
        event_user(2);
        quick_start = true;
    }
    if (scare_con >= 1)
        exit;
}
if (feared && screamcon > 0 && mercy < 99)
{
    jumptimer++;
    if (jumptimer >= jumpthreshold)
    {
        var audiopos = audio_sound_get_track_position(screamsound);
        audio_sound_set_track_position(screamsound, audiopos + random_range(-3, 3));
        jumptimer = 0;
        jumpthreshold = 2 + random(17);
    }
}
prog = clamp01(total_ticks / (run_threshold * 7));
if (screamcon > 0)
{
    siner++;
    if (end_con == 3)
    {
        snd_pitch(screamsound, 0.75);
    }
    else if (prog >= 1 || end_con == 1)
    {
        var _sine = cos(siner / 6) * 0.5;
        snd_pitch(screamsound, (size * 2) + _sine);
    }
    else
    {
        snd_pitch(screamsound, (size * 2) + 1);
    }
}
image_speed = lerp(0.25, 1, size);
if (ticks < 0)
    ticks += 1;
var _sizze = size;
if (mercy > 70)
    _sizze = -size;
if (mercy >= 99)
{
    if (screamcon != 2)
    {
        if (screamcon == 0)
            screamsound = snd_loop(snd_pumpkin_scream_mama);
        else
            snd_resume(screamsound);
        screamcon = 2;
        sprite_index = spr_jackolantern_cry;
    }
    if (end_con == 2)
    {
        direction = point_direction(x, y, targ_x, targ_y);
        var _heart_distance = point_distance(x, y, targ_x, targ_y);
        if (_heart_distance < (light_distance - (_sizze * 30)) || _heart_distance > last_distance)
        {
            snd_stop(global.batmusic[1]);
            snd_pause(screamsound);
            sprite_index = spr_jackolantern_stunned;
            size = 1;
            end_con = 3;
            timer = 0;
            speed = 0;
            var _damage = 1;
            obj_heart.wspeed = 1;
            snd_play(snd_graze);
            with (obj_jackenstein_enemy)
            {
                if (!i_ex(obj_dmgwriter_boogie))
                {
                    global.mercymod[myself] += _damage;
                    __mercydmgwriter = instance_create_depth(global.monsterx[myself], global.monstery[myself] + 40, depth - 99999, obj_dmgwriter_boogie);
                    __mercydmgwriter.damage = _damage;
                    __mercydmgwriter.type = 5;
                    global.hittarget[myself]++;
                    snd_play_x(snd_mercyadd, 0.8, 1.4);
                }
                else if (global.mercymod[myself] < 100)
                {
                    obj_dmgwriter_boogie.damage += _damage;
                    obj_dmgwriter_boogie.init = 0;
                    global.mercymod[myself] += _damage;
                }
                if (i_ex(obj_dmgwriter_boogie))
                    obj_dmgwriter_boogie.damage -= (global.mercymod[myself] - 100);
                global.mercymod[myself] = 100;
            }
        }
        else
        {
            last_distance = _heart_distance;
        }
    }
    if (end_con == 3)
    {
        if (timer == 45)
        {
            snd_resume(screamsound);
            sprite_index = spr_jackolantern_cry;
            audio_sound_set_track_position(screamsound, 7.9);
        }
        else if (timer == 93)
        {
            debug_print("battle_end");
            shake_power = 4;
            fader = instance_create(0, 0, obj_marker);
            fader.image_blend = c_white;
            fader.image_alpha = 0;
            fader.sprite_index = spr_pixel_white;
            fader.image_xscale = room_width / 4;
            fader.image_yscale = room_height / 4;
            fader.depth = -100;
            obj_heart.wspeed = 1;
            snd_play_pitch(snd_great_shine, 1.4);
            timer = 0;
            speed = 0;
            snd_volume(screamsound, 0, 30);
            snd_volume(global.batmusic[1], 0, 60);
            end_con = 4;
        }
    }
}
else if (ticks >= 0 && point_distance(x, y, obj_heart.x + 4, obj_heart.y + 4) < (light_distance - (_sizze * 30)) && alarm[0] == -1)
{
    if (mercy >= 90)
        ticks += 0.1;
    else if (mercy >= 80)
        ticks += 0.15;
    else
        ticks += 0.2;
    if (fleetype == 1)
        accelmultiplier += 0.31;
    size_cooldown += 0.2;
    if (ticks >= 1)
    {
        size_cooldown = 1;
        if (!feared && scare_con == 0)
        {
            if (!quick_start)
            {
                speed = 0;
                scare_con = 1;
                debug_print(string(obj_heart.wspeed));
                obj_heart.wspeed = 0;
            }
            else
            {
                scare_con = -1;
            }
            bright = true;
            exit;
        }
        ticks = 0.2;
        total_ticks++;
        sizer++;
        tick_chain++;
        snd_play(snd_graze);
        var _damage = burst_damage ? 7 : 1;
        if (screamcon != 2)
        {
            if (screamcon == 0)
                screamsound = snd_loop(snd_pumpkin_scream_mama);
            else
                snd_resume(screamsound);
            screamcon = 2;
            sprite_index = spr_jackolantern_cry;
        }
        if (tick_chain >= 7)
        {
            ticks = 0;
            completed_ticks++;
            if (!feared && tick_chain < 99)
            {
                feared = true;
                if (fleetype == 0)
                    event_user(0);
                else if (fleetype == 1)
                    event_user(10);
                else
                    event_user(12);
                event_user(2);
            }
        }
        if (tick_chain == 3 && fleetype != 0)
        {
            if (fleetype == 1)
                event_user(10);
            else
                event_user(12);
            event_user(2);
        }
        if (!burst_damage || tick_chain >= 7)
        {
            if (tick_chain >= 7)
            {
                if (fleetype == 2)
                    event_user(12);
                event_user(2);
                tick_chain = 0;
            }
            with (obj_jackenstein_enemy)
            {
                if (!i_ex(obj_dmgwriter_boogie))
                {
                    global.mercymod[myself] += _damage;
                    __mercydmgwriter = instance_create_depth(global.monsterx[myself], global.monstery[myself] + 40, depth - 99999, obj_dmgwriter_boogie);
                    __mercydmgwriter.damage = _damage;
                    __mercydmgwriter.type = 5;
                    global.hittarget[myself]++;
                    snd_play_x(snd_mercyadd, 0.8, 1.4);
                }
                else if (global.mercymod[myself] < 99)
                {
                    obj_dmgwriter_boogie.damage += _damage;
                    obj_dmgwriter_boogie.init = 0;
                    global.mercymod[myself] += _damage;
                }
                if (global.mercymod[myself] >= 99 && other.end_con == 0)
                {
                    global.turntimer += 300;
                    if (i_ex(obj_dmgwriter_boogie))
                        obj_dmgwriter_boogie.damage -= (global.mercymod[myself] - 99);
                    global.mercymod[myself] = 99;
                    with (obj_dmgwriter_boogie)
                    {
                        if (damage == 0)
                            instance_destroy();
                    }
                    other.end_con = 1;
                    debug_print("PANIC");
                    exit;
                }
            }
        }
        if (!quick_start && completed_ticks == 1)
        {
            quick_start = true;
            exit;
        }
        if (total_ticks >= (run_threshold * 7) && scare_con == -1)
        {
            debug_print_persistent("state", "flee");
            ticks = -100;
            global.turntimer = 60;
            snd_volume(screamsound, 0, 60);
            speed = 8;
            friction = -0.1;
            direction = point_direction(x, y, obj_heart.x + 4, obj_heart.y + 4);
        }
    }
}
else if (total_ticks < (run_threshold * 7))
{
    if (size_cooldown > 0)
    {
        size_cooldown -= 0.05;
        if (size_cooldown <= 0)
        {
            sprite_index = spr_jackolantern_frown;
            size_offset = 0;
        }
    }
    else if (sizer > 0)
    {
        sizer = scr_movetowards(sizer, 0, 0.5);
    }
    if (screamcon == 2 && ticks >= 0)
    {
        screamcon = 1;
        snd_pause(screamsound);
        sprite_index = spr_jackolantern_stunned;
    }
    if (ticks > 0)
        ticks -= 0.1;
    if (ticks == 0 && feared)
    {
    }
}
if (mercy >= 99)
{
    sizer = scr_movetowards(sizer, run_threshold * 7, 1);
    if (end_con >= 3)
        speed = 0;
    else
        speed = remap_clamped(100, 190, 20, 60, mercy);
}
else if (total_ticks >= (run_threshold * 7) && end_con == 0)
{
    sizer = scr_movetowards(sizer, run_threshold * 7, 1);
}
else if (speed != 0)
{
    speed = lerp(3, 20, size);
}
size = clamp01(sizer / (run_threshold * 7));
prog = clamp01(total_ticks / (run_threshold * 7));
if (completed_ticks < run_threshold)
{
    var _mercymod;
    if (!i_ex(obj_jackenstein_enemy))
        _mercymod = 0;
    else
        _mercymod = global.mercymod[obj_jackenstein_enemy.myself];
    var _mm = 1;
    var lower = 2;
    var upper = 3;
    var mult = 1;
    if (fleetype == 1)
    {
        lower = 1.4;
        upper = 1.8;
        mult = 0.7;
    }
    if (!first_turn)
    {
        if (_mercymod < 70)
            _mm = remap_clamped(0, 70, 1, lower, _mercymod);
        else
            _mm = remap_clamped(70, 100, lower, upper, _mercymod);
    }
    if (feared && alarm[0] == -1 && end_con < 3)
    {
        reset_timer++;
        var _target_distance = point_distance(x, y, targ_x, targ_y);
        if (reset_timer > 90 || _target_distance < 15 || _target_distance > last_distance)
        {
            if (end_con >= 2)
            {
                debug_print("snapping to player");
                end_con = 3;
                x = targ_x;
                y = targ_y;
                speed = 0;
            }
            else
            {
                if (fleetype == 0)
                    event_user(0);
                else if (fleetype == 1)
                    event_user(10);
                else
                    event_user(11);
                reset_timer = 0;
                last_distance = point_distance(x, y, targ_x, targ_y);
            }
        }
        else
        {
            last_distance = _target_distance;
        }
        scr_debug_print_persistent("state", "feared");
        if (end_con >= 3)
        {
            x = targ_x;
            y = targ_y;
            speed = 0;
        }
        else if (end_con == 0)
        {
            speed = 3 + log2(max(1, abs(ticks))) + (mult * completed_ticks * _mm);
        }
        speed *= accelmultiplier;
        if (end_con == 2)
            direction = point_direction(x, y, obj_heart.x, obj_heart.y);
        else if (end_con < 2)
            direction = point_direction(x, y, targ_x, targ_y);
    }
    else if (alarm[0])
    {
        debug_print("alarm 0");
        speed *= 0.95;
        speed -= 0.125;
    }
    else
    {
        scr_debug_print_persistent("state", "unfeared");
        speed = min(sqrt(max(0, timer - 30)), 4) / (1 + ticks + (completed_ticks * _mm));
        direction = scr_at_player(x, y);
    }
}
