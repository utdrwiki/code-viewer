if (init == false && image_alpha < 1)
{
    image_alpha += 0.1
    if (image_alpha >= 1)
    {
        init = true
        active = true
    }
}
if (tracking == true)
{
    if instance_exists(obj_heart_ch1)
    {
        if (side == 1 || side == 3)
        {
            if (((obj_heart_ch1.x + 10) - x) >= 10)
                x += 3
            if (((obj_heart_ch1.x + 10) - x) <= -10)
                x -= 3
        }
        if (side == 0 || side == 2)
        {
            if (((obj_heart_ch1.y + 10) - y) >= 10)
                y += 3
            if (((obj_heart_ch1.y + 10) - y) <= -10)
                y -= 3
        }
    }
}
timer += 1
if (timer >= 30 && con == 0)
{
    tracking = false
    direction = ((side * 90) + 180)
    speed = 4
    gravity_direction = (side * 90)
    gravity = 1.2
    if (joker == 1)
    {
        gravity = 1.6
        speed = 6
    }
    con = 1
}
if (timer >= 40)
    gravity = 0
if (locked == true)
{
    ltimer += 1
    if (ltimer >= 12)
    {
        image_alpha -= 0.2
        active = false
    }
    if (ltimer >= 17)
        instance_destroy()
}
