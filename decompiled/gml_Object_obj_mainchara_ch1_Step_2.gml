if (global.darkzone == true)
{
    if (cutscene == false && (!instance_exists(obj_shake_ch1)))
    {
        wd = (x - floor(((__view_get((2 << 0), 0) / 2) - (initwd / 2))))
        ht = (y - floor(((__view_get((3 << 0), 0) / 2) - (initht / 2))))
        __view_set((0 << 0), 0, wd)
        __view_set((1 << 0), 0, ht)
        if (__view_get((0 << 0), 0) < 0)
            __view_set((0 << 0), 0, 0)
        if (__view_get((0 << 0), 0) > (room_width - __view_get((2 << 0), 0)))
            __view_set((0 << 0), 0, (room_width - __view_get((2 << 0), 0)))
        if (__view_get((1 << 0), 0) < 0)
            __view_set((1 << 0), 0, 0)
        if (__view_get((1 << 0), 0) > (room_height - __view_get((3 << 0), 0)))
            __view_set((1 << 0), 0, (room_height - __view_get((3 << 0), 0)))
    }
}
if (global.darkzone == false && global.plot >= 245)
{
    if (cutscene == false && (!instance_exists(obj_shake_ch1)))
    {
        __view_set((9 << 0), 0, -4)
        wd = ((x - floor((__view_get((2 << 0), 0) / 2))) + 11)
        ht = ((y - floor((__view_get((3 << 0), 0) / 2))) + 17)
        __view_set((0 << 0), 0, wd)
        __view_set((1 << 0), 0, ht)
        if (__view_get((0 << 0), 0) < 0)
            __view_set((0 << 0), 0, 0)
        if (__view_get((0 << 0), 0) > (room_width - __view_get((2 << 0), 0)))
            __view_set((0 << 0), 0, (room_width - __view_get((2 << 0), 0)))
        if (__view_get((1 << 0), 0) < 0)
            __view_set((1 << 0), 0, 0)
        if (__view_get((1 << 0), 0) > (room_height - __view_get((3 << 0), 0)))
            __view_set((1 << 0), 0, (room_height - __view_get((3 << 0), 0)))
    }
}
if (bg == 1)
{
    with (obj_backgrounderparent_ch1)
        event_user(0)
}
