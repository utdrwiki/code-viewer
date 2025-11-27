if (!immune)
{
    with (obj_susiezilla_gamecontroller)
    {
        if (gameover)
            exit;
    }
}
timer++;
v_speed += personal_gravity;
h_speed *= 0.99;
y += v_speed;
x += h_speed;
if (y >= ground)
{
    v_speed *= -0.5;
    y = ground;
}
if (timer > flash_start)
    flash = true;
if (timer > endme)
    instance_destroy();
