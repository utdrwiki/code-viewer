if (neverwork)
    disable = true;
if (cheer_flag > 0 && global.flag[cheer_flag] == 0)
    exit;
var in_range = obj_mainchara.x >= threshold_left && obj_mainchara.x <= threshold_right && obj_mainchara.y >= threshold_vertical && obj_mainchara.y <= (threshold_vertical + max_vertical_threshold);
if (in_range && !glitz_active && !disable)
{
    var _on_screen = obj_mainchara.y >= y;
    if (!_on_screen)
        exit;
    glitz_active = true;
    with (cheer_audience)
        show_crowd();
    with (camera_crowd)
        show_crowd();
    if (!snd_is_playing(audience_sfx[1]))
        audience_sfx[1] = mus_loop_ext(audience_sfx[0], 1, 1);
    else
        snd_volume(audience_sfx[1], 1, 8);
    ooaatimer = 30;
    timer = 25;
}
if (glitz_active)
{
    if (!in_range || disable)
    {
        glitz_active = false;
        with (cheer_audience)
            hide_crowd();
        with (camera_crowd)
            hide_crowd();
        snd_volume(audience_sfx[1], 0, 8);
        exit;
    }
    timer++;
    ooaatimer++;
    if (obj_mainchara.y >= y && obj_mainchara.x >= threshold_left && obj_mainchara.x < threshold_right)
    {
        if (ooaatimer > ooaa_max)
        {
            var snd = 453;
            var snd_pick = irandom(1);
            switch (snd_pick)
            {
                case 1:
                    snd = 451;
                    break;
            }
            var pitch = random_range(0.75, 1.5);
            snd_play_x(snd, 1, pitch);
            ooaatimer = 0;
            ooaa_max = irandom(140) + 30;
        }
    }
    if (obj_mainchara.y >= y && timer > timer_max)
    {
        var rand_x = (threshold_left + irandom(threshold_right - threshold_left)) - 80;
        var rand_y = irandom(40);
        var this_flash = scr_dark_marker(rand_x, (y - 40) + rand_y, spr_dw_teevie_flash);
        var flash_scale = random_range(1.5, 2);
        var flash_scalex = random_range(1.75, 2.5);
        this_flash.image_xscale = flash_scalex;
        this_flash.image_yscale = flash_scale;
        timer_max = irandom(3) + 10;
        scr_lerp_var_instance(this_flash, "image_index", 0, 3, 6);
        scr_script_delayed(scr_lerp_var_instance, 6, this_flash, "image_alpha", 1, 0, 8);
        scr_doom(this_flash, timer_max + 16);
        timer = 0;
    }
    if (obj_mainchara.y >= (y - 40))
    {
        if (obj_mainchara.x < threshold_left)
        {
            var _min_x_pos = threshold_left;
            var _max_x_pos = _min_x_pos - 280;
            var _audio_pos = clamp(((obj_mainchara.x - _min_x_pos) * 100) / (_max_x_pos - _min_x_pos), 0, 100) / 100;
            snd_volume(audience_sfx[1], 1 - _audio_pos, 0);
        }
        else if (obj_mainchara.x >= threshold_right)
        {
            var _min_x_pos = threshold_right;
            var _max_x_pos = _min_x_pos + 280;
            var _audio_pos = clamp(((obj_mainchara.x - _min_x_pos) * 100) / (_max_x_pos - _min_x_pos), 0, 100) / 100;
            snd_volume(audience_sfx[1], 1 - _audio_pos, 0);
        }
    }
    else
    {
        var _min_y_pos = y - 40;
        var _max_y_pos = y - 180;
        var _audio_pos = clamp(((obj_mainchara.y - _min_y_pos) * 100) / (_max_y_pos - _min_y_pos), 0, 100) / 100;
        snd_volume(audience_sfx[1], 1 - _audio_pos, 0);
    }
}
