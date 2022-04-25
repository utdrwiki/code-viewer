if (state == 0 && ydrop >= 1)
    state = 1
if (state == 1)
{
    btimer++
    if (btimer > 5)
    {
        for (i = 0; i < 3; i++)
        {
            d = instance_create(x, y, obj_sneo_phonebullet)
            d.destroyable = true
            d.image_blend = 0xE8A200
            d.direction = ((random_range(-20, 20) + 180) + image_angle)
            d.speed = 5
        }
        btimer = 0
    }
}
