if (frozen == true)
{
    if (frozemem == false)
    {
        frozemem = true;
        mem_speed = speed;
        mem_image_speed = image_speed;
        mem_sprite_index = sprite_index;
        mem_image_index = image_index;
        mem_direction = direction;
        mem_hspeed = hspeed;
        mem_vspeed = vspeed;
        mem_friction = friction;
        speed = 0;
        image_speed = 0;
        if (freezesprite != 0)
            sprite_index = freezesprite;
        direction = 0;
        hspeed = 0;
        vspeed = 0;
        friction = 0;
    }
}
else if (frozemem == true)
{
    frozemem = false;
    speed = mem_speed;
    image_speed = mem_image_speed;
    sprite_index = mem_sprite_index;
    direction = mem_direction;
    hspeed = mem_hspeed;
    vspeed = mem_vspeed;
    friction = mem_friction;
    image_index = mem_image_index;
}
