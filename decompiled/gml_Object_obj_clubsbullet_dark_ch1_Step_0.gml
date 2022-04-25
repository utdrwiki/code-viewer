dtimer += 1
if (type == 0)
{
    if (dtimer == 15 || dtimer == 19 || dtimer == 23)
    {
        move_towards_point((obj_heart_ch1.x + 8), (obj_heart_ch1.y + 8), 0.1)
        bul = instance_create_ch1(x, y, obj_regularbullet_ch1)
        if instance_exists(bul)
        {
            bul.sprite_index = spr_clubsball_b_ch1
            bul.direction = direction
            bul.speed = 4
            bul.image_angle = direction
            bul.damage = damage
            bul.target = target
            bul.grazepoints = 2
            bul.timepoints = 1
        }
        bul = instance_create_ch1(x, y, obj_regularbullet_ch1)
        if instance_exists(bul)
        {
            bul.sprite_index = spr_clubsball_c_ch1
            bul.direction = (direction - 17)
            bul.speed = 4
            bul.image_angle = direction
            bul.damage = damage
            bul.target = target
            bul.grazepoints = 2
            bul.timepoints = 1
        }
        bul = instance_create_ch1(x, y, obj_regularbullet_ch1)
        if instance_exists(bul)
        {
            bul.sprite_index = spr_clubsball_a_ch1
            bul.direction = (direction + 17)
            bul.speed = 4
            bul.image_angle = direction
            bul.damage = damage
            bul.target = target
            bul.grazepoints = 2
            bul.timepoints = 1
        }
    }
    if (dtimer == 25)
    {
        a = instance_create_ch1(x, y, obj_afterimage_ch1)
        a.sprite_index = sprite_index
        a.image_angle = image_angle
        instance_destroy()
    }
}
if (type == 2)
{
    if (dtimer == 20 || dtimer == 22 || dtimer == 24)
    {
        move_towards_point((obj_heart_ch1.x + 8), (obj_heart_ch1.y + 8), 0.1)
        bul = instance_create_ch1(x, y, obj_regularbullet_ch1)
        if instance_exists(bul)
        {
            bul.sprite_index = spr_clubsball_b_ch1
            bul.direction = ((direction - 2) + initangle)
            bul.speed = 2
            if (type == 2)
                bul.speed = 5
            bul.image_angle = direction
            scr_bullet_inherit_ch1(bul)
        }
        bul = instance_create_ch1(x, y, obj_regularbullet_ch1)
        if instance_exists(bul)
        {
            bul.sprite_index = spr_clubsball_c_ch1
            bul.direction = (((direction - 19) - 2) + initangle)
            bul.speed = 2
            if (type == 2)
                bul.speed = 5
            bul.image_angle = direction
            scr_bullet_inherit_ch1(bul)
        }
        bul = instance_create_ch1(x, y, obj_regularbullet_ch1)
        if instance_exists(bul)
        {
            bul.sprite_index = spr_clubsball_a_ch1
            bul.direction = (((direction + 19) - 2) + initangle)
            bul.speed = 2
            if (type == 2)
                bul.speed = 5
            bul.image_angle = direction
            scr_bullet_inherit_ch1(bul)
        }
        initangle += 2
    }
    if (dtimer == 26)
    {
        a = instance_create_ch1(x, y, obj_afterimage_ch1)
        a.sprite_index = sprite_index
        a.image_angle = image_angle
        instance_destroy()
    }
}
