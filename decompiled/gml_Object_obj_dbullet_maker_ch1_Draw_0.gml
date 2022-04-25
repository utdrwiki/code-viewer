if (dont == 0)
{
    if (active == false)
    {
        futuredir = point_direction(x, y, (obj_heart_ch1.x + 8), (obj_heart_ch1.y + 8))
        draw_sprite_ext(spr_diamondbullet_form_ch1, 0, x, y, (3 - (image_alpha * 2)), (3 - (image_alpha * 2)), futuredir, c_white, (1 - image_alpha))
        if (image_alpha < 1)
            image_alpha += 0.1
        else
        {
            move_towards_point((obj_heart_ch1.x + 8), (obj_heart_ch1.y + 8), 2)
            futuredir = direction
            active = true
            speed = 0
        }
    }
    draw_sprite_ext(sprite_index, 0, x, y, (2 - image_alpha), (2 - image_alpha), futuredir, c_white, image_alpha)
    if (active == true)
    {
        activetimer += 1
        if (activetimer >= 5 && times < difficulty)
        {
            mybul = instance_create_ch1(x, y, obj_regularbullet_ch1)
            if instance_exists(mybul)
            {
                mybul.damage = damage
                mybul.target = target
                mybul.sprite_index = spr_diamondbullet_ch1
                mybul.direction = futuredir
                with (mybul)
                {
                    speed = 6
                    image_angle = direction
                }
            }
            times += 1
            activetimer = 0
        }
        if (activetimer >= 5 && times >= difficulty)
        {
            image_alpha -= 0.2
            if (image_alpha <= 0)
                instance_destroy()
        }
    }
}
dont = 0
