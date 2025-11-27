animindex++;
if (ver == 0)
{
    draw_set_color(c_black);
    ossafe_fill_rectangle(camerax(), cameray(), camerax() + 640, cameray() + 480, 0);
    draw_set_color(c_white);
    var xx = 3;
    var yy = 2;
    for (var i = 0; i < 6; i++)
    {
        for (var ii = 0; ii < 4; ii++)
            draw_sprite_ext(spr_board_occeananim, animindex * 0.125, board_tilex(xx + i), board_tiley(yy + ii), 2, 2, 0, c_white, 1);
    }
    bridgemade = false;
    if (obj_b2_badbridge.con > 0)
        bridgemade = true;
    if (bridgemade == true)
    {
        bx = board_tilex(5);
        by = board_tiley(3);
        alphaer++;
        alpha = (round(abs(sin(alphaer / 30) * 4)) / 4) - 0.5;
        draw_sprite_ext(spr_b2_badbridge, image_index, bx, by, 2, 2, 0, c_white, 1);
        gpu_set_fog(true, #CA2D2D, 0, 0);
        draw_sprite_ext(spr_b2_badbridge, image_index, bx, by, 2, 2, 0, c_white, alpha);
        gpu_set_fog(false, c_white, 0, 0);
    }
    var siner = sin(animindex / 10) * 2;
    draw_sprite_ext(spr_pxwhite, 0, board_tilex(9), board_tiley(3), 128, 64, 0, c_black, 1);
    draw_sprite_ext(spr_board_b2_atlantis, 0, board_tilex(5.5), scr_even(board_tiley(3.5) + siner), 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_board_binooverview, 0, board_tilex(xx), board_tiley(yy), 2, 2, 0, c_white, 1);
}
if (ver == 1)
{
    draw_set_color(c_black);
    ossafe_fill_rectangle(camerax(), cameray(), camerax() + 640, cameray() + 480, 0);
    draw_set_color(c_white);
    var xx = 3;
    var yy = 2;
    for (var i = 0; i < 6; i++)
    {
        for (var ii = 0; ii < 4; ii++)
            draw_sprite_ext(spr_board_occeananim, animindex * 0.125, board_tilex(xx + i), board_tiley(yy + ii), 2, 2, 0, c_white, 1);
    }
    var siner = sin(animindex / 10) * 2;
    draw_set_color(#084F54);
    draw_set_alpha(0.8);
    ossafe_fill_rectangle(board_tilex(xx), board_tiley(yy), board_tilex(xx + 6) - 1, board_tiley(yy + 4) - 1, 0);
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_sprite_ext(spr_board_binooverview, 0, board_tilex(xx), board_tiley(yy), 2, 2, 0, c_white, 1);
}
