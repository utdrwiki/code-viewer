if (grazed == true)
{
    grazetimer += 1
    if (grazetimer >= 30)
    {
        grazetimer = 0
        grazed = false
    }
}
if (wall_destroy == 1)
{
    if (x < (__view_get((0 << 0), 0) - 80))
        instance_destroy()
    if (x > (__view_get((0 << 0), 0) + 760))
        instance_destroy()
    if (y < (__view_get((1 << 0), 0) - 80))
        instance_destroy()
    if (y > (__view_get((1 << 0), 0) + 580))
        instance_destroy()
}
if (updateimageangle == 1)
    image_angle = direction
