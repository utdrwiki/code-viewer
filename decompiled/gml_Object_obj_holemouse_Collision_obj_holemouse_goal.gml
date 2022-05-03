nointeract = 1
if (con != 5 || bouncethisframe)
{
    if (gulped == 0)
    {
        snd_play(snd_swallow)
        gulped = 1
    }
    other.win = 1
    win = 1
    con = 2
    if (room == room_dw_city_mice)
    {
        if instance_exists(obj_controller_dw_city_mice)
            obj_controller_dw_city_mice.victory = true
        if (global.plot < 72)
            global.plot = 72
    }
    if (room == room_dw_city_mice2)
    {
        if instance_exists(obj_controller_city_mice2)
            obj_controller_city_mice2.victory = true
        if (global.plot < 77)
            global.plot = 77
        if (global.flag[368] == 0)
            global.flag[368] = 0.5
    }
}
