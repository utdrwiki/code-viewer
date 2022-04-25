if (image_alpha < 1)
    image_alpha += 0.04
if (init == false)
{
    startdepth = (obj_growtangle.depth + depth)
    init = true
}
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
sinespeed = obj_sneo_wall_controller.sinespeed
siner += sinespeed
x = (xx + (cos(((-siner) / 20)) * xdist))
var _falsedepth = sin((siner / 20))
active = _falsedepth >= false
var _depthblend = clamp((_falsedepth + 0.5), 0, 1)
image_blend = merge_color(c_gray, c_white, _depthblend)
depth = ((obj_growtangle.depth - (_falsedepth * startdepth)) - 3)
if (bighitbox == 1)
{
    hitshot = collision_rectangle(x, y, (x + sprite_width), (y + sprite_height), obj_yheart_shot, 1, 0)
    if (hitshot != -4)
        event_user(0)
}
