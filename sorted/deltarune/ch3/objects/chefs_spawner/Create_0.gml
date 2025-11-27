alarm[0] = 30 + irandom(30);
mode = 0;
firedie = false;
no_fire = false;
freq = 45;
side = 0;
if (i_ex(obj_tenna_enemy) && obj_tenna_enemy.completedchefwithouttakingdamage && i_ex(obj_tenna_zoom) && obj_tenna_zoom.minigameinsanity == false)
{
    food = instance_create(x, 200, obj_chefs_fire);
    with (food)
    {
        side = choose(1, -1);
        fallspeed = 8;
        minigameinsanity = true;
        extrafar = true;
    }
}
if (i_ex(obj_tenna_zoom) && obj_tenna_zoom.minigameinsanity == true)
{
    food = instance_create(camerax() + 120 + irandom(440), cameray() + 30 + irandom(120), obj_chefs_fire);
    with (food)
    {
        falling = 1;
        speed = 0;
        gravity = 0.125;
        gravity_direction = 270;
        minigameinsanity = true;
        forcefall = true;
    }
    food = instance_create(x, 200, obj_chefs_fire);
    with (food)
    {
        side = choose(1, -1);
        fallspeed = 8;
        minigameinsanity = true;
    }
    if (i_ex(obj_tenna_enemy))
    {
        obj_tenna_enemy.insanitychefcount++;
        if (obj_tenna_enemy.insanitychefcount > 2)
        {
            food = instance_create(x, 200, obj_chefs_fire);
            with (food)
            {
                side = choose(1, -1);
                fallspeed = 8;
                minigameinsanity = true;
                extrafar = true;
            }
        }
    }
}
