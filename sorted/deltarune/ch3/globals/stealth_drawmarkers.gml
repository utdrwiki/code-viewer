function scr_stealth_drawmarkers()
{
    var footcolor = #412311;
    var arrowcolor = #884823;
    var thedepth = 1000050;
    var aryoff = 0;
    if (room == room_dw_teevie_stealth_d)
    {
        footcolor = #A20B0D;
        arrowcolor = #FF946F;
        aryoff = -6;
        thedepth = 999999;
    }
    with (obj_b3bs_stealtharea)
    {
        mark[0] = scr_dark_marker(x - 4, ((10 + y) - 40) + aryoff, spr_dw_ch3_b3bs_stealth_downarrow);
        mark[1] = scr_marker_ext(x + 4 + sprite_width + 4, ((10 + y) - 40) + aryoff, spr_dw_ch3_b3bs_stealth_downarrow, -2, 2);
        for (var i = 0; i < ((sprite_width - 36) / 8); i++)
        {
            var xpos = 18 + (i * 8);
            mark[i + 2] = scr_dark_marker(x + xpos, (y - 40) + 12 + aryoff, spr_pxwhite);
            mark[i + 2].image_xscale = 8;
            mark[i + 2].image_yscale = 4;
            if ((xpos % 3) == 0)
                mark[i + 2].y -= 2;
        }
        for (var i = 0; i < array_length(mark); i++)
        {
            mark[i].depth = thedepth;
            mark[i].image_blend = arrowcolor;
        }
        for (var i = 0; i < (image_xscale / 40); i++)
        {
            var xpos = x + (i * 40);
            if ((i % 3) == 0)
                xpos += 4;
            var ypos = y + 4;
            if ((i % 2) == 0)
                ypos += 6;
            with (scr_dark_marker(xpos, ypos, spr_dw_ch3_b3bs_stealth_footprint))
            {
                depth = thedepth;
                image_blend = footcolor;
            }
        }
    }
}
