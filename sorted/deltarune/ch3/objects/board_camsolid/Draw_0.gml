if (active)
{
    for (var i = 0; i < 4; i++)
    {
        if (i_ex(mysolid[i]))
            draw_sprite_ext(spr_board_camerablock, i, mysolid[i].x, mysolid[i].y, 2, 2, 0, c_white, 1);
    }
}
