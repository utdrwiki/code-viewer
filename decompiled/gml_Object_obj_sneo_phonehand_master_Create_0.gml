event_inherited()
destroyonhit = false
image_speed = 0
image_xscale = 2
image_yscale = 2
siner = 0
element = 6
xdist = 70
phonehand_top = instance_create((x - xdist), (y - 70), obj_sneo_phonehand)
phonehand_top.orientation = "top"
phonehand_top.boss = id
phonehand_top.target = obj_sneo_bulletcontroller.target
phonehand_bottom = instance_create((x - xdist), (y + 60), obj_sneo_phonehand)
phonehand_bottom.orientation = "bottom"
phonehand_bottom.boss = id
phonehand_bottom.target = obj_sneo_bulletcontroller.target
movedx = 0
hp = 200
difficulty = 0
difficulty = obj_spamton_neo_enemy.difficulty
btimer = 0
init = false
visibiliytimer = 0
image_alpha = 0
bluesiner = 0
image_blend = merge_color(0xE8A200, c_aqua, (0.25 + (sin((bluesiner / 3)) * 0.25)))
