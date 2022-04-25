scr_bullet_init()
destroyonhit = true
timer = 0
image_xscale = 0
image_yscale = 1
active = true
if instance_exists(obj_queen_enemy)
    damage = (global.monsterat[obj_queen_enemy.myself] * 5)
if instance_exists(obj_queen_bulletcontroller)
    target = obj_queen_bulletcontroller.target
grazepoints = 4
