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
if imageonly
    image_angle += spin
else
    direction += spin
if (updateimageangle == 1)
    image_angle = direction
