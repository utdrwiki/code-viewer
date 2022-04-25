var oob = 0
if (y < (boxTop + 18) || y > (boxBottom - 18))
{
    oob = 1
    scr_draw_in_box_begin()
}
draw_self()
if oob
    scr_draw_in_box_end()
