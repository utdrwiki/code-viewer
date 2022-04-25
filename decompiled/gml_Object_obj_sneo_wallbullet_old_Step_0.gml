if (x >= (room_width + 100) || x <= -100 || y >= (room_height + 100) || y <= -100)
    instance_destroy()
direction += angle_speed
if (angleadjust == 1)
    image_angle = direction
if (destroyable == true)
{
    yellowsiner++
    image_blend = merge_color(c_yellow, c_orange, (0.25 + (sin((yellowsiner / 3)) * 0.25)))
}
if (loop == true)
{
    if (y < loopy1)
        y = (loopy2 - (loopy1 - y))
    if (y > loopy2)
        y = (loopy1 + (y - loopy2))
}
y += falsevspeed
if (bighitbox == 1)
{
    hitshot = collision_rectangle(x, y, (x + sprite_width), (y + sprite_height), obj_yheart_shot, 1, 0)
    if (hitshot != -4)
        event_user(0)
}
