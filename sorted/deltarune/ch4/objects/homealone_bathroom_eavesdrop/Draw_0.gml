if (dhaver == 1)
{
    draw_set_color(c_black);
    draw_set_alpha(0.15 * speech_alpha);
    prevalpha[0] = 1;
    var text_height = string_height(current_text) * 0.25;
    var text_width = string_width(current_text) * 0.65;
    for (i = 6; i > 0; i -= 1)
    {
        prevalpha[i] = prevalpha[i - 1];
        if (prevalpha[i] > 0)
        {
            var ypadding = 2;
            var xpadding = 2;
            xpos_offset = 0;
            ypos_offset = 0;
            xpos = speech_xpos - 20;
            ypos = speech_base_ypos - text_height - 10;
            if (cameray() < 300)
                ypos = (cameray() + 110) - text_height - 5;
            xpos = camerax() + 60;
            ossafe_fill_rectangle(xpos - (10 - i) - xpadding, ypos - (10 - i) - ypadding, xpos + text_width + (10 + i) + xpadding, ypos + text_height + (10 + i) + ypadding, false);
        }
    }
    draw_set_alpha(1);
    scr_84_set_draw_font("dotumche");
    draw_set_color(c_white);
    draw_set_alpha(speech_alpha);
    var xpos_offset = 0;
    var ypos_offset = 0;
    var xpos = speech_xpos - 20;
    var ypos = speech_base_ypos - text_height - 5;
    if (cameray() < 300)
        ypos = (cameray() + 115) - text_height - 5;
    xpos = camerax() + 60;
    draw_text_transformed(xpos, ypos - (text_height / 2) - 2, current_text, 0.5, 0.5, 0);
    draw_set_alpha(1);
}
