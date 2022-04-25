if (wobbled == 0)
{
    if instance_exists(obj_mainchara_ch1)
    {
        if (obj_mainchara_ch1.y > (y - 10) && obj_mainchara_ch1.y < (y + 50))
        {
            image_speed = 0.334
            if (global.flag[8] == 1)
                image_speed = 0.2
            wobbled = 1
        }
    }
}
if (y < (__view_get((1 << 0), 0) - 60))
{
    wobbled = 0
    image_speed = 0
    image_index = 0
    y += 960
}
