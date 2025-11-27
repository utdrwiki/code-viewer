if (!i_ex(obj_noellehouse_basement))
    exit;
if (convo_timer > 0 && !d_ex())
    convo_timer--;
if (convo_timer <= 0 && con == 0 && !d_ex() && !obj_noellehouse_basement.camera_pan_active)
{
    con = 10;
    convo_wait = false;
    var _convo = convo[convo_parent_index][convo_index][convo_line_index];
    scr_speaker(_convo.speaker);
    if (convo_parent_index < 4)
    {
        global.fc = 0;
        global.fe = 0;
    }
    msgset(0, _convo.dialogue + "/%");
    var d = d_make();
    d.zurasu = 1;
    d.stay = 5;
}
if (con == 10 && !d_ex())
{
    con = -1;
    if (convo_line_index < (array_length(convo[convo_parent_index][convo_index]) - 1))
    {
        convo_line_index++;
        con = 0;
    }
    else if (convo_index < (array_length(convo[convo_parent_index]) - 1))
    {
        convo_index++;
        convo_line_index = 0;
        var _seconds = 10;
        if (convo_parent_index == 2)
        {
            _seconds = 5;
            if (convo_index == 5)
            {
                with (obj_noellehouse_basement)
                    watch_movie();
            }
        }
        else if (convo_parent_index == 5)
        {
            _seconds = 8;
            if (convo_index == 3)
                _seconds = 15;
        }
        con = 0;
        set_timer(_seconds * 30);
    }
    else
    {
        convo_wait = true;
        if (convo_parent_index == 1 || convo_parent_index == 4)
        {
            convo_parent_index++;
            convo_index = 0;
            convo_line_index = 0;
            con = 0;
            if (convo_parent_index == 5)
                set_timer(240);
        }
    }
}
if (auto_text)
{
    if (i_ex(obj_writer))
    {
        if (!auto_text_start)
        {
            auto_text_start = true;
            auto_text_stop = false;
            auto_text_buffer = auto_text_buffer_time;
        }
        if (!auto_text_stop && obj_writer.reachedend == 1)
        {
            auto_text_stop = true;
            auto_text_buffer = auto_text_buffer_time;
        }
        if (auto_text_stop)
        {
            auto_text_buffer--;
            if (variable_instance_exists(1026, "button1") && obj_writer.button1 == 1)
                auto_text_start = false;
            if (auto_text_buffer <= 0)
            {
                auto_text_start = false;
                auto_text_stop = false;
                auto_text_buffer = auto_text_buffer_time;
                with (obj_writer)
                    forcebutton1 = 1;
            }
        }
    }
    else if (auto_text_start)
    {
        auto_text_start = false;
    }
}
