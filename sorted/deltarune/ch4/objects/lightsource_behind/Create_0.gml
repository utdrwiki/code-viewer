smallerLight = 0;
biggerLight = 0;
siner = irandom(120);
radius = 160;
image_speed = 0.16666666666666666;
if (!instance_exists(obj_followinglight))
    instance_create(x, y, obj_followinglight);
