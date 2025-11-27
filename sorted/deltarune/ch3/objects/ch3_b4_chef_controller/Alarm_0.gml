if (!gamestart)
    gamestart = true;
if (gameover)
    exit;
timer--;
alarm[0] = 30;
if (timer <= 0)
{
    gameover = true;
    with (obj_ch3_b4_chef_kris)
    {
        image_speed = 0;
        vspeed = 0;
        hspeed = 0;
        gravity = 0;
    }
    with (obj_ch3_b4_chef_fire)
    {
        image_speed = 0;
        vspeed = 0;
        hspeed = 0;
        gravity = 0;
    }
}
