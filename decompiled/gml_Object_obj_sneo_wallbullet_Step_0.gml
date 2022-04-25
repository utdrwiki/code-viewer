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
    flashsiner++
    image_blend = merge_color(0xE8A200, c_aqua, (0.25 + (sin((flashsiner / 3)) * 0.25)))
}
sinespeed = obj_sneo_wall_controller.sinespeed
siner += sinespeed
x = (xx + (cos(((-siner) / 20)) * xdist))
var _falsedepth = sin((siner / 20))
active = _falsedepth >= false
var _depthblend = clamp((_falsedepth + 0.5), 0, 1)
if destroyable
    image_blend = merge_color(merge_color(c_black, image_blend, 0.5), image_blend, _depthblend)
else
    image_blend = merge_color(c_gray, c_white, _depthblend)
depth = (obj_growtangle.depth - (_falsedepth * startdepth))
if (destroyable == true)
{
    if (active == true)
        depth = (obj_heart.depth - 100)
    if (y < (cameray() + 110))
    {
        image_xscale = (((y - cameray()) - 90) / 20)
        image_yscale = (((y - cameray()) - 90) / 20)
        if (obj_sneo_wall_controller.introtimer > 24)
            image_alpha = (((y - cameray()) - 90) / 20)
    }
    else if (y > (cameray() + 233))
    {
        image_xscale = ((20 - ((y - cameray()) - 233)) / 20)
        image_yscale = ((20 - ((y - cameray()) - 233)) / 20)
        if (obj_sneo_wall_controller.introtimer > 24)
            image_alpha = ((20 - ((y - cameray()) - 233)) / 20)
    }
    else
    {
        image_xscale = 1
        image_yscale = 1
        if (obj_sneo_wall_controller.introtimer > 24)
            image_alpha = 1
    }
}
if (loop == true)
{
    if (y < loopy1)
        y = (loopy2 - (loopy1 - y))
    if (y > loopy2)
        y = (loopy1 + (y - loopy2))
}
y += (falsevspeed * sinespeed)
if (bighitbox == 1)
{
    hitshot = collision_rectangle(x, y, (x + sprite_width), (y + sprite_height), obj_yheart_shot, 1, 0)
    if (hitshot != -4)
        event_user(0)
}
