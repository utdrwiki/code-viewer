if (loading > 0)
{
    loading--
    if (loading == 0)
        image_index = 0
    else if ((loading % 2) == 0)
        image_index++
}
draw_self()
if (bufferstate == 1)
    draw_sprite(spr_queen_buffering, (obj_queen_buffercontroller.bufferbar % 8), x, y)
if (loading <= 0 && image_blend != c_white)
    image_blend = merge_color(0x89D931, c_white, (timer / 10))
