scr_bullet_init()
if (x < obj_growtangle.x)
{
    side = -1
    image_angle = -90
}
else
{
    side = 1
    image_angle = 90
}
platterLid = instance_create(x, y, obj_regularbullet)
platterLid.sprite_index = spr_swatchling_platter_lid
platterLid.image_angle = image_angle
platterPlate = instance_create(x, y, obj_regularbullet)
platterPlate.sprite_index = spr_swatchling_platter_plate
platterPlate.image_angle = image_angle
timer = -10
loopTimer = 40
lidOffset = 0
colorTimer = 25
firstOpen = 1
targetColor = c_yellow
platterPlate.image_blend = targetColor
platterLid.image_blend = targetColor
platterPlate.damage = 5
platterLid.damage = 5
platterPlate.destroyonhit = false
platterLid.destroyonhit = false
platterPlate.wall_destroy = 0
platterLid.wall_destroy = 0
active = false
destroyonhit = false
opened = 0
hasCandy = false
startColor = 65535
init = false
swatchbc = obj_swatchling_battle_controller
ychange = 0
lidOff = 0
lidSpeed = 0
birds = 0
plateSpeed = 0
yy = y
image_alpha = 0
