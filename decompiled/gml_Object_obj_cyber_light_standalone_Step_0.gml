siner++
if (init == false)
{
    wd = (sprite_width / 2)
    if (bosscheck == false)
    {
        with (obj_cyber_light)
            bosscheck = true
        boss = true
        depth += 1
        total = instance_number(object_index)
        for (i = 0; i < total; i++)
        {
            which[i] = instance_find(object_index, i)
            which[i].siner = (i * 4)
            wx[i] = which[i].x
            wy[i] = which[i].y
        }
    }
    init = true
}
image_alpha = ((sin((siner / 12)) * 0.2) + 0.8)
