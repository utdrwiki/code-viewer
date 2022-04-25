if (timer > 0)
    return;
timer = 1
destroyable = false
depth -= 40
d = instance_create(x, y, obj_fadeout)
d.image_blend = c_white
