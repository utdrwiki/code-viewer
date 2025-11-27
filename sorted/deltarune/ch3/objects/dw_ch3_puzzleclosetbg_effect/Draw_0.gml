if (view_current == 0)
{
    draw_sprite_tiled_ext(spr_dw_ch3_puzzleclosetbg, 0, camerax() * 0.5, y, 2, 2, c_white, 1);
    gpu_set_blendmode(bm_subtract);
    var startY = 240;
    var endY = 320;
    if (room == room_dw_puzzlecloset_2)
        endY = 360;
    ossafe_fill_rectangle_color(camerax(), cameray() + startY, camerax() + 640, cameray() + endY, c_black, c_black, c_white, c_white, 0);
    var lwallstart = 200;
    var lwallfade = 200;
    if (room == room_dw_puzzlecloset_0)
    {
        lwallstart = 400;
        lwallfade = 800;
    }
    ossafe_fill_rectangle_color(lwallstart, 0, lwallstart + lwallfade, 480, c_white, c_black, c_black, c_white, 0);
    var rightx = room_width - 160;
    if (room == room_dw_puzzlecloset_1)
        rightx = 968;
    if (room == room_dw_puzzlecloset_2)
        rightx = 1240;
    if (room == room_dw_puzzlecloset_3)
        rightx = 1240;
    ossafe_fill_rectangle_color(rightx, 0, rightx - 400, 480, c_black, c_white, c_white, c_black, 0);
    gpu_set_blendmode(bm_normal);
    draw_sprite_ext(spr_pxwhite, 0, camerax(), cameray() + endY, 640, 480, 0, c_black, 1);
    draw_sprite_ext(spr_pxwhite, 0, 0, 0, lwallstart, 480, 0, c_black, 1);
    draw_sprite_ext(spr_pxwhite, 0, rightx, 0, 200, 480, 0, c_black, 1);
}
