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
if instance_exists(obj_heart_ch1)
    futuredir = point_direction(x, y, (obj_heart_ch1.x + 8), (obj_heart_ch1.y + 8))
else
    instance_destroy()
