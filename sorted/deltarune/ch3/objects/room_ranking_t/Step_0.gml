if (con < 0)
    exit;
if (con == 1 && !d_ex() && global.interact == 0)
{
    con = 2;
    global.interact = 1;
    pitch += 0.1;
    if (explain_vfx == -4)
    {
        explain_vfx = instance_create(0, 0, obj_dw_ranking_t_explain);
        explain_vfx.image_alpha = pitch;
    }
    with (explain_vfx)
        show_explain();
}
if (con == 2)
{
    explain_close_timer--;
    if (explain_close_timer <= 0)
    {
        con = 3;
        explain_close_timer = explain_close_time;
        input_check = true;
        if (type == 1)
            snd_play_x(snd_trank, 1, 1.3);
    }
}
if (input_check)
{
    if (button1_p() || button2_p())
    {
        con = 4;
        input_check = false;
        with (explain_vfx)
            hide_explain();
    }
}
if (con == 4)
{
    var _is_closed = false;
    with (explain_vfx)
        _is_closed = is_closed;
    if (_is_closed)
        con = 5;
}
if (con == 5)
{
    con = -1;
    global.interact = 0;
}
if (pitch > 0.8)
    pitch -= 0.001;
