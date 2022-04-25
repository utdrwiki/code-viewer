if scr_debug()
{
    xx = 300
    yy = 465
    darkgrey = make_color_rgb(40, 40, 40)
    draw_set_font(fnt_small)
    if up_h()
        draw_set_color(c_white)
    else
        draw_set_color(darkgrey)
    draw_text_outline(xx, (yy - 6), "[U]", c_black)
    if left_h()
        draw_set_color(c_white)
    else
        draw_set_color(darkgrey)
    draw_text_outline((xx - 15), yy, "[L]", c_black)
    if down_h()
        draw_set_color(c_white)
    else
        draw_set_color(darkgrey)
    draw_text_outline(xx, yy, "[D]", c_black)
    if right_h()
        draw_set_color(c_white)
    else
        draw_set_color(darkgrey)
    draw_text_outline((xx + 15), yy, "[R]", c_black)
    if button1_h()
        draw_set_color(c_white)
    else
        draw_set_color(darkgrey)
    draw_text_outline((xx + 45), yy, scr_get_input_name(4), c_black)
    if button2_h()
        draw_set_color(c_white)
    else
        draw_set_color(darkgrey)
    draw_text_outline((xx + 60), yy, scr_get_input_name(5), c_black)
    if button3_h()
        draw_set_color(c_white)
    else
        draw_set_color(darkgrey)
    draw_text_outline((xx + 75), yy, scr_get_input_name(6), c_black)
}
