if (instance_exists(obj_heart))
{
    dir = (image_angle + 360) % 120;
    while (dir < 360)
    {
        with (scr_fire_bullet(x, y, obj_book_bullet, dir, 3.5, spr_no_mask))
        {
            with (other)
                scr_bullet_inherit(other.id);
            scr_lerpvar_instance(id, "speed", speed, 2, 20);
            x += hspeed;
            y += vspeed;
            sprite_index = spr_magic_book_bubble_smol;
            scr_lerpvar_instance(id, "image_speed", image_speed, 0.125, 30);
        }
        dir += 120;
    }
}
