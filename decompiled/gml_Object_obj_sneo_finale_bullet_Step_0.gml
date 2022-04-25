if (x >= (room_width + 100) || x <= -100 || y >= (room_height + 100) || y <= -100)
    instance_destroy()
image_angle += 36
if (destroyable == true)
{
    flashsiner++
    image_blend = merge_color(0xE8A200, c_aqua, (0.25 + (sin((flashsiner / 3)) * 0.25)))
}
