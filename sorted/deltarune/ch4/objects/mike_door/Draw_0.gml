var _left_door = 0;
var _bg_col = merge_colour(c_navy, c_dkgray, 0.5);
var right_offset = -22;
var bottom_offset = -48;
draw_set_colour(_bg_col);
if (act > 0)
    draw_set_colour(c_black);
ossafe_fill_rectangle(x, y, x + 159 + right_offset, y + 159 + bottom_offset, 0);
draw_set_colour(_bg_col);
if (act > 0)
    draw_set_colour(c_black);
ossafe_fill_rectangle(x + 1, y + 1, x + 78 + right_offset, y + 60 + bottom_offset, 0);
ossafe_fill_rectangle(x + 82, y + 1, x + 158 + right_offset, y + 60 + bottom_offset, 0);
if (act == 0)
{
    var v = 0;
    if (i_ex(obj_mike_controller) && scr_onscreen(id) && global.interact == 0)
        v = (obj_mike_controller.microphone_volume2 / 100) * 169;
    if (_left_door == 0)
    {
        var _mix = clamp(0.5 + (sin(current_time / 100) * 0.5), 0, 1);
        draw_set_colour(merge_colour(c_red, c_white, _mix));
        if (v > 70)
            ossafe_fill_rectangle(x, ((y + 79) - clamp(v - 90, 0, 15)) + bottom_offset, x + 159 + right_offset, y + 99 + bottom_offset, 0);
        draw_set_colour(merge_colour(c_yellow, c_white, _mix));
        if (v > 30)
            ossafe_fill_rectangle(x, ((y + 139) - clamp(v - 30, 0, 40)) + bottom_offset, x + 159 + right_offset, y + 139 + bottom_offset, 0);
        draw_set_colour(merge_colour(c_lime, c_white, _mix));
        if (v > 1)
            ossafe_fill_rectangle(x, ((y + 159) - clamp(v, 0, 30)) + bottom_offset, x + 159 + right_offset, y + 159 + bottom_offset, 0);
    }
    draw_sprite_ext(sprite_index, _left_door, x, y, image_xscale, 2, 0, c_white, 1);
    draw_sprite_ext(sprite_index, 1, x + 2, y, image_xscale, 2, 0, c_white, 1);
    if (charge > 0)
    {
    }
    if (v >= 100 && _left_door == 0)
    {
        if (rumble == 0)
        {
            rumble = snd_loop(snd_rumble);
            snd_volume(rumble, 0, 0);
        }
        else
        {
            snd_volume(rumble, charge, 0);
            mus_volume(global.currentsong[1], 1 - charge, 0);
        }
        charge = scr_approach(charge, 1, 0.1);
    }
    else
    {
        charge = 0;
        if (rumble != 0)
        {
            snd_stop(rumble);
            rumble = 0;
            mus_volume(global.currentsong[1], 1, 0);
        }
    }
    if (charge == 1)
    {
        snd_stop(rumble);
        rumble = 0;
        mus_volume(global.currentsong[1], 1, 0);
        act = 1;
        snd_play(snd_boost);
        scr_shakeobj(id, 4, 0.1);
        global.flag[1697] = 1;
        with (obj_doorAny)
            y = ystart;
        alarm[0] = 10;
        with (obj_solidblockDark)
        {
            if (x == 200 && y == 200)
                image_xscale = 1;
        }
    }
}
if (act == 1)
{
    timer += 1;
    if (timer > 45)
        xscale = lerp(xscale, 0, 0.2);
    var _col = _bg_col;
    if ((current_time % 300) > 150 || xscale < 1 || timer > 20)
        _col = 16777215;
    draw_sprite_ext(sprite_index, 2, round(x), round(y), image_xscale * xscale, 2, 0, _col, 1);
    draw_sprite_ext(sprite_index, 3, round(x) + 2 + ((2 * (1 - xscale) * sprite_width) / 2), round(y), image_xscale * xscale, 2, 0, _col, 1);
    if (console_version)
    {
        if (global.interact == 0 && lastinteract == 5)
        {
            if (global.input_g[4] == gp_shoulderrb && !obj_gamecontroller.gamepad_shoulderlb_reassign)
            {
                with (obj_mike_door)
                {
                    if (act == 1)
                    {
                        act = 0;
                        timer = 0;
                        xscale = 1;
                        snd_play(snd_locker);
                        with (obj_doorAny)
                        {
                            if (y < 300)
                                y = -1000;
                        }
                        with (obj_solidblockDark)
                        {
                            if (x == 200 && y == 200)
                                image_xscale = 5;
                        }
                        with (obj_mainchara)
                        {
                            if (bbox_right >= 200 && bbox_left <= 400 && bbox_top <= 240)
                                y += (240 - bbox_top);
                        }
                        scr_shakescreen(0, 4);
                    }
                }
            }
        }
    }
}
lastinteract = global.interact;
if (instance_number(obj_mike_controller) > 0 && instance_number(obj_micmenu) == 0)
{
    with (obj_mike_controller)
        microphone_volume2 += ((microphone_volume - microphone_volume2) * 0.25);
}
