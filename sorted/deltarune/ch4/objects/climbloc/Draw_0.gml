if (scr_debug())
{
    if (keyboard_check_pressed(ord("V")))
        visible = !visible;
    if (visible)
    {
        draw_self();
        draw_text_debug(x, y, exitmarkerflag);
    }
}
