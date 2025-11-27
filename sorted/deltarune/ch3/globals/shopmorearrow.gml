function scr_shopmorearrow(arg0)
{
    var cx = camera_get_view_x(view_camera[0]);
    var cy = camera_get_view_y(view_camera[0]);
    var drawup = false;
    var drawdown = false;
    if (pagemax > 0)
        drawup = true;
    if ((5 + pagemax) < arg0)
    {
        if (menu == 11)
        {
            drawdown = false;
            var i = 5 + pagemax;
            while (i < array_length(itemsellname))
            {
                if (itemsellname[i] != " ")
                    drawdown = true;
                i++;
            }
        }
        else
        {
            drawdown = true;
        }
    }
    if (drawup)
        draw_sprite_ext(spr_morearrow, 0, cx + 370, (cy + 280) - (sin(cur_jewel / 12) * 3), 1, -1, 0, c_white, 1);
    if (drawdown)
        draw_sprite_ext(spr_morearrow, 0, cx + 370, cy + 440 + (sin(cur_jewel / 12) * 3), 1, 1, 0, c_white, 1);
}
