function scr_subtitles_add(arg0, arg1)
{
    if (v_ex("subtitle_count"))
        subtitle_count = 0;
    if (v_ex("subtitle_time"))
        subtitle_time = [];
    if (v_ex("subtitle_text"))
        subtitle_time = [];
    if (v_ex("subtitle_index"))
        subtitle_index = -1;
    subtitle_time[subtitle_count] = arg0;
    subtitle_text[subtitle_count] = arg1;
    subtitle_count++;
}

function scr_subtitles_clear(arg0)
{
    scr_subtitles_add(arg0, "");
}

function scr_subtitles_clear_all()
{
    subtitle_time = [];
    subtitle_text = [];
    subtitle_count = 0;
    subtitle_index = -1;
}

function scr_subtitles_draw(arg0, arg1 = 200, arg2 = 50, arg3 = 2, arg4 = 16777215, arg5 = true, arg6 = 0)
{
    if (subtitle_count == 0)
        exit;
    if (subtitle_index < subtitle_count && arg0 >= subtitle_time[subtitle_index + 1])
        subtitle_index++;
    if (subtitle_text != "")
        scr_subtitles_draw_text(subtitle_text[subtitle_index], arg1, arg2, arg3, arg4, arg5, arg6);
}

function scr_subtitles_draw_text(arg0, arg1 = 200, arg2 = 50, arg3 = 2, arg4 = 16777215, arg5 = true, arg6 = 0)
{
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    if (arg5)
    {
        draw_set_color(arg6);
        draw_text_transformed(arg1 - arg3, arg2, arg0, arg3, arg3, 0);
        draw_text_transformed(arg1 + arg3, arg2, arg0, arg3, arg3, 0);
        draw_text_transformed(arg1, arg2 - arg3, arg0, arg3, arg3, 0);
        draw_text_transformed(arg1, arg2 + arg3, arg0, arg3, arg3, 0);
    }
    draw_set_color(arg4);
    draw_text_transformed(arg1, arg2, arg0, arg3, arg3, 0);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
