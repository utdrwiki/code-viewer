if (active)
{
    draw_set_color(#632323);
    draw_set_alpha(fadealpha);
    ossafe_fill_rectangle(x - 32, y - 32, (x - 32) + 384, ((y - 32) + 224) - 1, 0);
    ossafe_fill_rectangle(x - 32, (y - 32) + 224, ((x - 32) + 160) - 1, (((y - 32) + 224) - 1) + 32, 0);
    ossafe_fill_rectangle((x - 32) + 224, (y - 32) + 224, (((x - 32) + 160) - 1) + 224, (((y - 32) + 224) - 1) + 32, 0);
    draw_set_alpha(1);
    draw_set_color(c_white);
}
if (active && scr_debug())
{
    if (obj_board_camera.con == 0)
        scr_board_objname();
    draw_set_halign(fa_left);
}
