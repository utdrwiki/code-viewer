siner++;
draw_self();
if (myflag != 0)
{
    var amt = sin(siner / 8) * 2;
    draw_sprite_ext(spr_board_photo, 0, scr_even(x), scr_even((y - 20) + amt), 2, 2, 0, c_white, 1);
}
