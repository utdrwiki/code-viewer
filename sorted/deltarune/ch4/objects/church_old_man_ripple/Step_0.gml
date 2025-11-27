if (room == room_ripple_test)
{
    if (keyboard_check_pressed(vk_numpad5))
    {
        type = 0;
        if (distance <= 0)
            distance = 90;
        else
            distance -= 30;
        play = true;
    }
    else if (keyboard_check_pressed(vk_numpad6))
    {
        type = 1;
        play = true;
    }
    else if (keyboard_check_pressed(vk_numpad9))
    {
        shiner = 0;
    }
    else if (keyboard_check_pressed(vk_numpad4))
    {
        type = 2;
        play = true;
    }
    else if (keyboard_check_pressed(vk_numpad7))
    {
        type = 3;
        play = true;
    }
    else if (keyboard_check_pressed(vk_numpad8))
    {
        type = 4;
        play = true;
    }
}
var _xx = x;
if (variant == 1)
    _xx = camerax() + 456 + 30;
if (play)
{
    active = true;
    if (type == 1)
        con = 1;
    else
        con = 0;
    con_timer = 0;
    deltatime = 1;
    timer = 0;
    susie_con = 0;
    dust_timer = 0;
    susie_timer = 0;
    play = false;
    spinner = 0;
    if (type == 3)
        snd_play(snd_metal_hit_reverb, 1, 1);
    if (type == 4)
    {
        var _pull_a = audio_sound_set_track_position(snd_play(snd_weaponpull, 1, 2), 0.06);
        var _pull_b = audio_sound_set_track_position(snd_play(snd_weaponpull, 1, 0.8), 0.06);
    }
    if (type == 5)
    {
    }
    with (obj_church_old_man_ripple_effect)
        depth += 2;
    if (type == 0)
    {
        _xx += distance;
        step_index = image_index;
        step_x = _xx;
        if ((image_index % 4) == 0)
            _xx -= 12;
    }
    step = 1 - step;
    var _ripple = -4;
    if (type == 2)
    {
        laugh = snd_play(snd_gerlaugh_distort);
        _ripple = instance_create(x, y - 70, obj_church_old_man_ripple_effect);
        _ripple.type = 2;
    }
    else if (type == 3 || type == 4)
    {
        _ripple = instance_create(x, y - 64, obj_church_old_man_ripple_effect);
        _ripple.color = c_aqua;
        _ripple.type = type;
    }
    else if (type == 5)
    {
        if (snd_is_playing(laugh))
            snd_stop(laugh);
        punch++;
        snd_play(snd_damage, 1, (punch == 1) ? 0.9 : 1.1);
        _ripple = instance_create(x + 10, y - 44, obj_church_old_man_ripple_effect);
        _ripple.type = 5;
        _ripple.punch = punch;
        _ripple.color = c_lime;
        _ripple.colorstart = 65280;
        var _sign = randomsign();
        var _anim = instance_create_depth(x + -32, y - 50, depth - 10, obj_animation);
        _anim.image_xscale = -2;
        _anim.image_yscale = (punch == 0) ? 2 : -2;
        _anim.depth = depth + 10;
        _anim.sprite_index = spr_gerson_hit_fx1;
        _anim.image_speed = 0.5;
    }
    else if (type == 6)
    {
        hurt_noise = snd_play(snd_damage, 1, 1);
        _ripple = instance_create(x + 10, y - 44, obj_church_old_man_ripple_effect);
        _ripple.type = 5;
        _ripple.depth = depth + 11;
        _ripple.active = true;
        var _anim = instance_create_depth(x - 30, y - 50, depth - 10, obj_animation);
        _anim.image_xscale = -2;
        _anim.image_yscale = 2;
        _anim.depth = depth + 10;
        _anim.sprite_index = spr_gerson_hit_fx2;
        _anim.image_speed = 0.25;
    }
    else if (type == 7)
    {
        _ripple = instance_create(x, y - 34, obj_church_old_man_ripple_effect);
        _ripple.type = 7;
        _ripple.depth = depth + 11;
        _ripple.active = true;
    }
    else
    {
        _ripple = instance_create(_xx, y, obj_church_old_man_ripple_effect);
        _ripple.type = 0;
    }
    _ripple.depth = depth + 10;
    if (i_ex(obj_sound_of_justice_enemy))
        depth = obj_sound_of_justice_enemy.depth + 1;
    _ripple.active = true;
    if (type == 0)
    {
        if ((step % 2) == 0)
            snd_play_pitch(snd_metalstep_echo, 1);
        else
            snd_play_pitch(snd_metalstep_echo, 0.9);
    }
    if (type == -1)
    {
        step_sound = snd_play_pitch(snd_metalstep_echo, 0.7);
        snd_volume(step_sound, 0, 60);
    }
    if (type == 1)
        snd_play(snd_noise);
}
if (active)
    timer += deltatime;
if (type == 1)
{
    con_timer++;
    if (variant == 1)
    {
        if (con_timer >= leap_time && con_timer <= 65)
            con_timer += 0.5;
    }
    var _inc = false;
    if (con == 2)
    {
        with (obj_church_old_man_ripple_effect)
            deltatime = lerp(0.5, 0.15, other.con_timer / other.leap_time);
    }
    if (con == 0 && con_timer >= 15)
    {
        _inc = true;
    }
    else if (con == 1 && con_timer >= 15)
    {
        var _ripple = instance_create(_xx, y, obj_church_old_man_ripple_effect);
        _ripple.type = 1;
        _ripple.depth = depth + 8;
        _ripple.active = true;
        if (version == 1)
            _ripple.looping = false;
        deltatime = 0.5;
        with (obj_church_old_man_ripple_effect)
            deltatime = 0.95;
        snd_stop(motor_swing_down);
        snd_play_pitch(motor_swing_down, 1.4);
        _inc = true;
    }
    else if (con == 2 && con_timer >= leap_time)
    {
        deltatime = 0.15;
        with (obj_church_old_man_ripple_effect)
            deltatime = 0.15;
        _inc = true;
        wind_sfx = snd_play(snd_strongwind_loop);
        snd_pitch(wind_sfx, 0.5);
        snd_volume(wind_sfx, 0, 0);
        snd_volume(wind_sfx, 1, 45);
    }
    else if (con == 3 && con_timer == 30)
    {
    }
    else if (con == 3 && con_timer >= 65)
    {
        snd_play(snd_heavyswing);
        snd_play_pitch(snd_heavyswing, 0.5);
        susie_con = 2;
        snd_pause(wind_sfx);
        snd_volume(step_sound, 1, 0);
        _inc = true;
    }
    else if (con == 4 && con_timer >= 12)
    {
        snd_resume(wind_sfx);
        snd_pitch(wind_sfx, 1);
        snd_volume(wind_sfx, 1, 0);
        snd_volume(wind_sfx, 0, 80);
        deltatime = 2;
        var _ripple = instance_create(_xx, y, obj_church_old_man_ripple_effect);
        _ripple.type = 0;
        _ripple.depth = depth + 8;
        _ripple.active = true;
        with (obj_church_old_man_ripple_effect)
        {
            deltatime = 2;
            looping = false;
        }
        _inc = true;
    }
    if (_inc)
    {
        con++;
        con_timer = 0;
    }
}
if (type == 2)
{
    if ((timer % 16) == 0)
    {
        var _ripple = instance_create(x, y - 64, obj_church_old_man_ripple_effect);
        _ripple.type = 2;
        _ripple.depth = depth + 10;
        _ripple.active = true;
    }
    if (timer > 32)
        timer = 33;
}
if (type == 3)
{
}
