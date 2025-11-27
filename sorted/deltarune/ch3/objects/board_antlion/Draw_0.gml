if (special == 0)
{
    if (photod)
        sprite_index = spr_board_antlion_black;
    else
        sprite_index = spr_board_antlion_blue;
}
else
{
    sprite_index = spr_board_antlion_red;
}
draw_self_board();
