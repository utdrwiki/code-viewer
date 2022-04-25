scr_bullet_init()
grazepoints = 5
timepoints = 5
active = false
if (y < (__view_get((1 << 0), 0) + 20))
    y = (__view_get((1 << 0), 0) + 20)
if (y > (__view_get((1 << 0), 0) + 460))
    y = (__view_get((1 << 0), 0) + 460)
dont = 1
difficulty = 1
times = 0
activetimer = 0
image_alpha = 0
if (!instance_exists(obj_heart))
    instance_destroy()
type = 0
