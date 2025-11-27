if (active && scr_debug())
{
    if (obj_board_camera.con == 0)
        scr_board_objname();
    draw_set_halign(fa_left);
}
draw_set_blend_mode(bm_add);
var sirensinermod = abs(sin(sirensiner / 15)) - lightfade;
draw_set_alpha(sirensinermod);
draw_triangle_color(0, 0, 560, 0, 0, 480, c_red, 0, 0, 0);
draw_triangle_color(640, 0, 80, 0, 640, 480, c_red, 0, 0, 0);
draw_set_alpha(1);
draw_set_blend_mode(bm_normal);
