buffer -= 1;
if (act == -1)
{
    var _up_pressed = 0;
    var _down_pressed = 0;
    if (up_h())
    {
        if (up_p())
            _up_pressed = true;
        hold_up += 1;
        if (hold_up > 8)
        {
            hold_up = 7;
            _up_pressed = 1;
        }
        if (_up_pressed)
        {
            current -= 1;
            if (current < 0)
                current = 2;
            snd_play(snd_menumove);
        }
    }
    else
    {
        hold_up = 0;
    }
    if (down_h())
    {
        if (down_p())
            _down_pressed = true;
        hold_down += 1;
        if (hold_down > 8)
        {
            hold_down = 7;
            _down_pressed = 1;
        }
        if (_down_pressed)
        {
            current += 1;
            if (current > 2)
                current = 0;
            snd_play(snd_menumove);
        }
    }
    else
    {
        hold_down = 0;
    }
    if (button1_p())
    {
        switch (current)
        {
            case 0:
                buffer = 1;
                act = 0;
                break;
            case 1:
                buffer = 1;
                act = 1;
                break;
            case 2:
                endme = 1;
                break;
        }
        snd_play(snd_select);
    }
    if (button2_p() && buffer < 0 && endme == 0)
        endme = 1;
    if (endme)
    {
        global.interact = 0;
        with (obj_mainchara)
            onebuffer = 3;
        instance_destroy();
    }
}
if (act == 0)
{
    var _up_pressed = 0;
    var _down_pressed = 0;
    if (up_h())
    {
        if (up_p())
            _up_pressed = true;
        hold_up += 1;
        if (hold_up > 8)
        {
            hold_up = 7;
            _up_pressed = 1;
        }
        if (_up_pressed)
        {
            current -= 1;
            if (current < 0)
                current = menu_max - 1;
            if (!is_pc || current != (menu_max - 2))
            {
                mic_reload = 20;
                alarm[0] = 1;
            }
            snd_play(snd_menumove);
        }
    }
    else
    {
        hold_up = 0;
    }
    if (down_h())
    {
        if (down_p())
            _down_pressed = true;
        hold_down += 1;
        if (hold_down > 8)
        {
            hold_down = 7;
            _down_pressed = 1;
        }
        if (_down_pressed)
        {
            current += 1;
            if (current == menu_max)
                current = 0;
            if (!is_pc || current != (menu_max - 2))
            {
                mic_reload = 20;
                alarm[0] = 1;
            }
            snd_play(snd_menumove);
        }
    }
    else
    {
        hold_down = 0;
    }
    if (button1_p() && buffer < 0)
    {
        if (current == (menu_max - 1))
        {
            act = -1;
            current = 0;
            global.microphone = selected;
            with (obj_mike_controller)
                mic_reset();
        }
        else if (current == (menu_max - 3) && is_pc)
        {
            buffer = 1;
            if (global.right_click_mic == 1)
                global.right_click_mic = 0;
            else
                global.right_click_mic = 1;
            if (mic_max == 2 && global.right_click_mic == 0)
                global.right_click_mic = 2;
        }
        else if (current == (menu_max - 2) && is_pc)
        {
            buffer = 1;
            if (global.right_click_mic == 2)
                global.right_click_mic = 0;
            else
                global.right_click_mic = 2;
            if (mic_max == 2 && global.right_click_mic == 0)
                global.right_click_mic = 1;
        }
        else
        {
            selected = current;
            global.right_click_mic = false;
        }
        snd_play(snd_select);
    }
    if (button2_p() && buffer < 0)
    {
        act = -1;
        current = 0;
    }
}
if (act == 1 && buffer < 0)
{
    if (button1_p())
    {
        snd_play(snd_select);
        buffer = 3;
        act = -1;
        current = 1;
    }
    if (button2_p() && buffer < 0)
    {
        act = -1;
        current = 0;
    }
    reload -= 1;
    if (reload < 0)
    {
        if (left_h())
        {
            reload = 2;
            global.mic_sensitivity = scr_approach(global.mic_sensitivity, 0.035, 0.1);
        }
        if (right_h())
        {
            reload = 2;
            global.mic_sensitivity = scr_approach(global.mic_sensitivity, 4, 0.1);
        }
    }
}
