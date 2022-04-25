lifetimer++
if (image_index >= 1 && image_index <= 2)
    active = true
else
    active = false
if (image_index >= 4)
    instance_destroy()
if (lifetimer > (60 & (!(scr_onscreen_tolerance(id, 40)))))
    instance_destroy()
