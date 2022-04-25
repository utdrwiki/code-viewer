event_inherited()
active = false
destroyonhit = false
initialspeed = 0
eyetimer = 0
init = false
big = 0
stuck = false
if instance_exists(obj_mauswheel_enemy)
{
    damage = (global.monsterat[obj_mauswheel_enemy.myself] * 5)
    grazepoints = 3
}
