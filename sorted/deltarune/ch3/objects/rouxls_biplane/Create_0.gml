len = 38;
timer = 0;
fade = 0;
damage = 50;
target = 0;
speed = 1;
image_xscale = 0;
image_yscale = 0;
if (i_ex(obj_heart))
    depth = obj_heart.depth - 1;
if (i_ex(obj_heart))
    move_towards_point(obj_heart.x + 10, obj_heart.y + 10, 1);
else
    direction = 180;
flag = instance_create(x, y, obj_rouxls_biplane_flag);
flag.parentid = id;
flag.target = obj_dbulletcontroller.target;
flag.damage = 50;
hitbox = instance_create(x, y, obj_rouxls_helicopter_hitbox);
hitbox.parentid = id;
hitbox.target = obj_dbulletcontroller.target;
hitbox.damage = 50;
