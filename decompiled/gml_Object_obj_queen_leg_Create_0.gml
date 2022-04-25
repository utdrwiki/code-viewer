scr_bullet_init()
destroyonhit = false
direction = 270
stompwait = 15
stomphold = 0
scr_getboxbounds()
active = false
stomplerp = 0
stompspeed = 0.1
shootbullets = 0
pos = 0
special = false
specialcon = 0
specialtimer = 0
hurttimer = 0
hittimer = 0
hurtx = x
hurty = y
if instance_exists(obj_queen_enemy)
    damage = (global.monsterat[obj_queen_enemy.myself] * 5)
if instance_exists(obj_queen_bulletcontroller)
    target = obj_queen_bulletcontroller.target
grazepoints = 4
