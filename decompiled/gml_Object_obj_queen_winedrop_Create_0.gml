scr_bullet_init()
destroyonhit = false
image_angle = 90
gravity = 0.3
image_yscale = 2
image_xscale = 4
fillamount = 0
acidColor = 16777215
if (scr_debug() && (!obj_queen_enemy.whiteAcid))
    acidColor = 1959605
createdroplets = 0
if instance_exists(obj_queen_enemy)
    damage = (global.monsterat[obj_queen_enemy.myself] * 5)
if instance_exists(obj_queen_bulletcontroller)
    target = obj_queen_bulletcontroller.target
grazepoints = 4
