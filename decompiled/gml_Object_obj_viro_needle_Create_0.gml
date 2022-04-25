scr_bullet_init()
if (!instance_exists(obj_heart))
    instance_destroy()
wall_destroy = 1
image_alpha = 0
updateimageangle = 1
popping = 0
spawnVirus = true
countdown = 0
infection = 0
targetsprite = sprite_index
targetimage = image_index
targetx = x
targety = y
spawning = true
poisoncolor = 14438399
flash = false
infectTimer = 0
sprite_index = spr_virovirokun_needle_spawn
image_speed = (1/3)
virus_timer = 0
active = false
