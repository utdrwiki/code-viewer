if (y > (cameray() + cameraheight()))
{
    timer++;
    if (timer == 180)
    {
        instance_destroy();
        instance_create(x, cameray() + 300, obj_tower_dog_stilts);
        with (obj_tower_dog_fx1)
        {
            if (x > 500)
                y = -10000;
        }
        with (obj_tower_dog_ladder_fake)
        {
            if (x > 500 && falling == 0)
                y = -10000;
        }
    }
}
