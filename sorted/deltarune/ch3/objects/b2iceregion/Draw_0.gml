if (active && scr_debug())
{
    if (obj_board_camera.con == 0)
        scr_board_objname();
    draw_set_halign(fa_left);
}
if (screenblack == true)
{
    draw_set_color(c_black);
    ossafe_fill_rectangle(0, 0, 640, 480);
    draw_set_color(c_white);
}
