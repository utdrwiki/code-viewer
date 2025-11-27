draw_self();
draw_sprite_ext(spr_board_sphinx_face, face, x + 24, y + 34, 2, 2, 0, c_white, 1);
if (hurt)
    draw_sprite_ext(spr_board_sphinx_bandage, 0, (x + 84) - 6 - 8, (y + 36) - 8 - 4, 2, 2, 0, c_white, 1);
if (active && scr_debug())
{
    if (obj_board_camera.con == 0)
        scr_board_objname();
    draw_set_halign(fa_left);
}
