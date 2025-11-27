if (global.interact == 0 && obj_board_camera.con == 0)
    siner++;
var sined = sin(siner / 10) * 2;
draw_sprite_ext(sprite_index, image_index, scr_even(x), scr_even(y + sined) - 6, 2, 2, 0, c_white, 1);
