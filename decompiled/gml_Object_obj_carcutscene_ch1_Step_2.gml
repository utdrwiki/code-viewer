if (dhaver == true)
{
    with (myd)
    {
        writingx = (__view_get((0 << 0), 0) + 40)
        writingy = (__view_get((1 << 0), 0) + 20)
    }
}
if (v == 1)
{
    __view_set((0 << 0), 0, (c.x - vx))
    __view_set((1 << 0), 0, (c.y - vy))
}
