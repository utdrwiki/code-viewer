if (y < (__view_get((1 << 0), 0) + 20))
    y = (__view_get((1 << 0), 0) + 20)
if (y > (__view_get((1 << 0), 0) + 460))
    y = (__view_get((1 << 0), 0) + 460)
difficulty = 1
times = 0
activetimer = 0
grazed = false
grazepoints = 5
timepoints = 5
target = 0
dont = 1
inv = 120
damage = 124
active = false
image_alpha = 0
if (!instance_exists(obj_heart_ch1))
    instance_destroy()
type = 0
