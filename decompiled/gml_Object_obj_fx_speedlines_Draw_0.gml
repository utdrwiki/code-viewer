if (offsetx || offsety)
{
    if offsetx
        xoff = (x - camerax())
    if offsety
        yoff = (y - cameray())
    offsetx = 0
    offsety = 0
}
if flashframe
    depth = -1000
draw_sprite_ext(sprite_index, 0, (camerax() + (camerawidth() / 2)), (cameray() + (cameraheight() / 2)), (flipB * 2), (flipA * 2), image_angle, (flashframe ? c_gray : c_white), 1)
draw_sprite_ext(sprite_index, 1, (camerax() + (camerawidth() / 2)), (cameray() + (cameraheight() / 2)), (flipA * 2), (flipB * 2), (-image_angle), 0xEAAA8E, 1)
if (flipA == flipB)
    flipA *= -1
else
{
    flipB *= -1
    image_angle += 90
}
if flashframe
    instance_destroy()
