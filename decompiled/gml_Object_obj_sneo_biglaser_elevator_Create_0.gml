scr_bullet_init()
element = 6
destroyonhit = false
active = false
image_yscale = 0.05
image_xscale = 2
firecon = 0
effecttimer = 0
siner = 0
orbsize = 0
instance_create(x, y, obj_sneo_biglaser_friendlyhitbox)
parent = self
if instance_exists(obj_spamton_neo_enemy)
    damage = (global.monsterat[obj_spamton_neo_enemy.myself] * 5)
if instance_exists(obj_sneo_bulletcontroller)
    target = obj_sneo_bulletcontroller.target
grazepoints = 8
