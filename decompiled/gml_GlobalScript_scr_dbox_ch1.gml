scr_dbox_ch1 = function() //gml_Script_scr_dbox_ch1
{
    xxx = __view_get((0 << 0), 0)
    yyy = __view_get((1 << 0), 0)
    if (global.darkzone == false)
    {
        if (side == 0)
        {
            draw_set_color(c_white)
            draw_rectangle((xxx + 16), (yyy + 5), (xxx + 304), (yyy + 80), false)
            draw_set_color(c_black)
            draw_rectangle((xxx + 19), (yyy + 8), (xxx + 301), (yyy + 77), false)
        }
        else
        {
            draw_set_color(c_white)
            draw_rectangle((xxx + 16), (yyy + 160), (xxx + 304), (yyy + 235), false)
            draw_set_color(c_black)
            draw_rectangle((xxx + 19), (yyy + 163), (xxx + 301), (yyy + 232), false)
        }
    }
    if (global.darkzone == true)
    {
        if (side == 0)
        {
            draw_set_color(c_black)
            draw_rectangle((xxx + 38), (yyy + 16), (xxx + 602), (yyy + 154), false)
            scr_darkbox_ch1(((xxx + 32) - 8), ((yyy + 10) - 8), ((xxx + 608) + 8), ((yyy + 160) + 8))
        }
        else
        {
            draw_set_color(c_black)
            draw_rectangle((xxx + 38), (yyy + 326), (xxx + 602), (yyy + 464), false)
            scr_darkbox_ch1(((xxx + 32) - 8), ((yyy + 320) - 8), ((xxx + 608) + 8), ((yyy + 470) + 8))
        }
    }
    return;
}

