buffer -= 1
if (coord == 2 && buffer < 0)
{
    if save_data_error
    {
        if (!instance_exists(obj_savedata_error))
        {
            save_data_error = 0
            global.interact = 0
            with (obj_mainchara_ch1)
                onebuffer = 3
            instance_destroy()
        }
        return;
    }
    if button1_p_ch1()
    {
        coord = 99
        endme = 1
    }
}
if (coord < 2)
{
    if (left_p_ch1() || right_p_ch1())
    {
        if (coord == 1)
            coord = 0
        else
            coord = 1
    }
}
if (coord == 0 && buffer < 0)
{
    if button1_p_ch1()
    {
        snd_play_ch1(snd_save_ch1)
        var is_valid = script_execute(gml_Script_scr_save_ch1)
        coord = 2
        buffer = 3
        if is_valid
        {
            if (d == 2)
            {
                name = global.truename
                love = global.llv
            }
            scr_roomname_ch1(room)
            level = global.lv
            time = global.time
            minutes = floor((time / 1800))
            seconds = round((((time / 1800) - minutes) * 60))
            if (seconds == 60)
                seconds = 59
            if (seconds < 10)
                seconds = ("0" + string(seconds))
        }
        else
        {
            save_data_error = 1
            var error_message = instance_create(0, 0, obj_savedata_error)
            error_message.error_type = "save_failed"
        }
    }
}
if (button1_p_ch1() && coord == 1 && buffer < 0)
    endme = 1
if (button2_p_ch1() && buffer < 0)
    endme = 1
if (endme == 1)
{
    global.interact = 0
    with (obj_mainchara_ch1)
        onebuffer = 3
    instance_destroy()
}
