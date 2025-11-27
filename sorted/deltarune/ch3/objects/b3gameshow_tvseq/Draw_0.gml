if (active)
{
    var drawoverlay = 0;
    if (i_ex(obj_board_grayregion))
    {
        if (place_meeting(x, y, obj_board_grayregion))
        {
            if (photo == 0)
            {
                scr_delay_var("image_alpha", 0.25, 3);
                scr_delay_var("image_alpha", 0.5, 6);
                scr_delay_var("image_alpha", 0.75, 9);
                scr_delay_var("image_alpha", 1, 12);
            }
            photo = 1;
            drawoverlay = 1;
        }
    }
    if (photo)
    {
        var ind = 0;
        if (global.lang == "ja")
            ind = 1;
        draw_sprite_ext(spr_board_b3gameshow_word, ind, x, y, 2, 2, 0, c_white, 1);
    }
}
