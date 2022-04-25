event_inherited()
hp = 3
init = false
destroyable = false
state = 0
spin = 0
flydirection = (180 + (randomsign() * random(30)))
timer = 0
direction = 180
image_angle = 0
image_alpha = 0
flash = false
friction = 0.5
image_blend = 0xE8A200
if instance_exists(obj_spamton_neo_enemy)
    damage = (global.monsterat[obj_spamton_neo_enemy.myself] * 5)
if instance_exists(obj_sneo_bulletcontroller)
    target = obj_sneo_bulletcontroller.target
grazepoints = 4
