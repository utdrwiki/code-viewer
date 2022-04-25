bul = instance_create_ch1(x, y, obj_regularbullet_ch1)
if instance_exists(bul)
{
    bul.sprite_index = spr_clubsball_b_ch1
    bul.direction = direction
    bul.speed = (speed - 6)
    bul.image_angle = image_angle
    bul.damage = damage
    bul.target = target
    bul.grazepoints = 3
    bul.timepoints = 2
}
bul = instance_create_ch1(x, y, obj_regularbullet_ch1)
if instance_exists(bul)
{
    bul.sprite_index = spr_clubsball_c_ch1
    bul.direction = (direction - 25)
    bul.speed = (speed - 8)
    bul.image_angle = image_angle
    bul.damage = damage
    bul.target = target
    bul.grazepoints = 3
    bul.timepoints = 2
}
bul = instance_create_ch1(x, y, obj_regularbullet_ch1)
if instance_exists(bul)
{
    bul.sprite_index = spr_clubsball_a_ch1
    bul.direction = (direction + 25)
    bul.speed = (speed - 8)
    bul.image_angle = image_angle
    bul.damage = damage
    bul.target = target
    bul.grazepoints = 3
    bul.timepoints = 2
}
instance_destroy()
