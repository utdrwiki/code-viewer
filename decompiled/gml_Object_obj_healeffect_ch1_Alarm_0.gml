times += 1
instance_create_ch1(((x + 30) + random(20)), ((y + 30) + random(20)), obj_healsparkle_ch1)
alarm[0] = 3
if (times > 2)
    instance_destroy()
