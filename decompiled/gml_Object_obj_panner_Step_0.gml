if (type == 0)
{
    __view_set((0 << 0), 0, (__view_get((0 << 0), 0) + panx))
    __view_set((1 << 0), 0, (__view_get((1 << 0), 0) + pany))
}
pantimer += 1
if (type == 1)
{
    __view_set((0 << 0), 0, lerp(startx, finalx, (pantimer / panmax)))
    __view_set((1 << 0), 0, lerp(starty, finaly, (pantimer / panmax)))
}
if (pantimer >= panmax)
    instance_destroy()
