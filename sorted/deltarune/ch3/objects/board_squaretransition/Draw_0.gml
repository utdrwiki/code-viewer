timer++;
if ((timer % 15) == 0)
    baramount--;
if (baramount > 0)
{
    for (var i = 0; i < baramount; i++)
    {
        draw_sprite_ext(spr_pxwhite, 0, board_tilex(0), board_tiley(7 - i), 640, 32, 0, merge_color(c_black, c_black, i / baramount), 1);
        var heartsize = 1;
        if (heartsize == 1)
        {
            if (i == 4)
                draw_sprite_ext(obj_board_squaretransition_heart, 0, 312, 182, 1, 1, 0, c_white, 1);
            if (i == 3)
                draw_sprite_ext(obj_board_squaretransition_heart, 1, 312, 192, 1, 1, 0, c_white, 1);
        }
        if (heartsize == 2)
        {
            if (i == 4)
                draw_sprite_ext(obj_board_squaretransition_heart, 0, 302, 172, 2, 2, 0, c_white, 1);
            if (i == 3)
                draw_sprite_ext(obj_board_squaretransition_heart, 1, 302, 192, 2, 2, 0, c_white, 1);
        }
    }
}
else
{
    completed = true;
    if (doom == false)
    {
        doom = true;
        scr_doom(id, 10);
    }
}
