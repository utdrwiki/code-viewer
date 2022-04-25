if (!instance_exists(obj_heart))
{
    instance_destroy()
    return;
}
if (!i_ex(target))
{
    move_towards_point((x + 150), y, 22)
    image_angle = direction
    return;
}
if (target == obj_spamton_neo_enemy)
{
    move_towards_point((x + 150), y, 22)
    image_angle = direction
    return;
}
move_towards_point(target.x, target.y, 22)
image_angle = direction
target = 694
var dist = 9999
if instance_exists(obj_pipis_bullet)
{
    if (distance_to_object(instance_nearest(x, y, obj_pipis_bullet)) < dist)
        target = instance_nearest(x, y, obj_pipis_bullet)
}
if instance_exists(obj_pipis_egg_bullet)
{
    if (distance_to_object(instance_nearest(x, y, obj_pipis_egg_bullet)) < dist)
        target = instance_nearest(x, y, obj_pipis_egg_bullet)
}
if instance_exists(obj_sneo_heartattack)
{
    if (distance_to_object(instance_nearest(x, y, obj_sneo_heartattack)) < dist)
        target = instance_nearest(x, y, obj_sneo_heartattack)
}
if instance_exists(obj_sneo_heatattack_bullet)
{
    if (distance_to_object(instance_nearest(x, y, obj_sneo_heatattack_bullet)) < dist)
        target = instance_nearest(x, y, obj_sneo_heatattack_bullet)
}
if instance_exists(obj_sneo_lilguy)
{
    if (distance_to_object(instance_nearest(x, y, obj_sneo_lilguy)) < dist)
        target = instance_nearest(x, y, obj_sneo_lilguy)
}
if instance_exists(obj_sneo_lilguy_bullet)
{
    if (distance_to_object(instance_nearest(x, y, obj_sneo_lilguy_bullet)) < dist)
        target = instance_nearest(x, y, obj_sneo_lilguy_bullet)
}
if instance_exists(obj_sneo_wireheart)
{
    if (distance_to_object(instance_nearest(x, y, obj_sneo_wireheart)) < dist)
        target = instance_nearest(x, y, obj_sneo_wireheart)
}
if instance_exists(obj_sneo_faceattack_target)
{
    if (distance_to_object(instance_nearest(x, y, obj_sneo_faceattack_target)) < dist)
        target = instance_nearest(x, y, obj_sneo_faceattack_target)
}
if (x >= (camerax() + 500) && x < (camerax() + 530) && instance_exists(obj_sneo_faceattack) && obj_sneo_faceattack.init == true)
    instance_destroy()
