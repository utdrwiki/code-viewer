if (active == false)
    return;
if (other.object_index == obj_virovirokun_virus || (other.object_index == object_index && other.direction != 0))
    return;
if (direction == 0 || other.object_index == obj_omawaroid_vaccine)
{
    active = false
    spawnVirus = false
    image_speed = 1
    speed = 0
}
else if (other.object_index != obj_virovirokun_needle || abs(angle_difference(other.direction, direction) > 90))
{
    if (spawning == true)
    {
        spawning = false
        sprite_index = spr_virovirokun_needle
        image_index = 0
    }
    image_speed = 1
    active = false
    spawnVirus = true
    image_speed = 1
    speed = 0
    infection = 1
    if (other.object_index != obj_viro_needle)
    {
        targetx = other.x
        targety = other.y
        targetsprite = other.sprite_index
        targetimage = other.image_index
    }
    else
    {
        targetx = lerp(x, other.x, 0.5)
        targety = lerp(y, other.y, 0.5)
        poisoncolor = 16777215
    }
    instance_destroy(other)
}
