if (init == false)
{
    if random_image
    {
        image_speed = 0
        image_index = irandom((image_number - 1))
    }
    init = true
}
if (rotation != 0)
    image_angle += rotation
if (destroyoffscreen && (x < (camerax() - 50) || x > (camerax() + 680) || y < (cameray() - 50) || y > (cameray() + 510)))
    instance_destroy()
else if (lifetime > 0)
{
    lifetime--
    if (lifetime <= 0)
        instance_destroy()
    else if (fadeondeath && lifetime < 10)
        image_alpha = (lifetime / 10)
}
