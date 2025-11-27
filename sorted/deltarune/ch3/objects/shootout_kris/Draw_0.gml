if (shootcon == 2)
{
    if (sprite_index == spr_kris_ride_shoot)
    {
        if (timer == 0)
            image_index = 0;
        if (timer == 1)
            image_index = 2;
        timer++;
        if (timer >= 6)
        {
            sprite_index = spr_kris_ride_1;
            image_index = 0;
            shootcon = 0;
        }
    }
}
if (obj_shootout_controller.shootout_type != 3)
    draw_self();
