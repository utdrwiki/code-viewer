if (wall_destroy == 1)
{
    if (x < (__view_get((0 << 0), 0) - 40))
        instance_destroy()
    if (x > (__view_get((0 << 0), 0) + 680))
        instance_destroy()
    if (y < (__view_get((1 << 0), 0) - 40))
        instance_destroy()
    if (y > (__view_get((1 << 0), 0) + 520))
        instance_destroy()
}
