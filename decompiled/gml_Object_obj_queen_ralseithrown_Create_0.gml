con = 0
yy = __view_get((1 << 0), 0)
xx = __view_get((0 << 0), 0)
timer = 0
collided = 0
mypower = 10
bonk = 0
if instance_exists(obj_queenshield_enemy)
    depth = (obj_queenshield_enemy.depth - 1)
