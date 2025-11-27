get_inputs(true);
t++;
if (selected)
    exit;
var _sel_prev = selection;
if (vinput != 0)
    vfast += vinput;
else
    vfast = 0;
var _rapid = false;
if ((t % 3) == 0)
    _rapid = true;
if (press_up || (_rapid && vfast < -9))
    selection--;
if (press_down || (_rapid && vfast > 9))
    selection++;
selection = scr_wrap_new(selection, 0, menu_length - 1);
if (selection != _sel_prev)
    snd_play(snd_menumove);
if (hinput != 0)
    hfast += hinput;
else
    hfast = 0;
if (selection < (menu_length - 1))
{
    if ((press_left || press_right) || (_rapid && abs(hfast) > 9))
    {
        opt[selection] = clamp(opt[selection] + hinput, 0, optmax[selection]);
        snd_play(snd_menumove);
        refresh_options();
    }
}
if ((press_jump && selection == (menu_length - 1)) || keyboard_check_pressed(vk_enter) || button3_p())
{
    selected = true;
    snd_play(snd_select);
    alarm[0] = 30;
}
