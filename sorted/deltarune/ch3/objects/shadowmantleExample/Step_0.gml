timer++;
if (move != 0)
    mantle.x = round((320 + (sin(timer / 15) * 48)) / 2) * 2;
else
    mantle.x = 320;
fireballtimer++;
if (scr_debug())
{
    if (keyboard_check_pressed(ord("R")))
        room_restart();
}
if (keyboard_check_pressed(vk_subtract))
{
    type--;
    fireballtimer = 0;
}
if (keyboard_check_pressed(vk_add))
{
    type++;
    fireballtimer = 0;
}
if (keyboard_check_pressed(ord("M")))
{
    move = 1 - move;
    timer = 0;
}
if (keyboard_check_pressed(ord("B")))
    layer_set_visible("TILES", 1 - layer_get_visible("TILES"));
if (type == 0)
{
    if (fireballtimer > 30)
    {
        if (fireballcount < 8)
        {
            snd_stop(snd_board_torch);
            snd_play(snd_board_torch);
            for (var i = 0; i < 6; i++)
            {
                var fireball = instance_create(mantle.x + centerx(mantle), mantle.y + centery(mantle), obj_shadowmantleFireball_example);
                fireball.speed = 7;
                fireball.direction = i * 60;
                fireball.gravity_direction = fireball.direction + 180;
                fireball.gravity = 0.7;
                fireball.depth = mantle.depth - 10;
                fireball.image_speed = 0.25;
                scr_darksize(fireball);
            }
            fireballcount++;
            fireballtimer -= 2;
        }
    }
    if (fireballtimer >= 90)
    {
        fireballcount = 0;
        fireballtimer = 0;
    }
}
if (type == 1)
{
    if (fireballtimer > 30)
    {
        if (fireballcount < 8)
        {
            snd_stop(snd_board_torch);
            snd_play(snd_board_torch);
            for (var i = 0; i < 6; i++)
            {
                var fireball = instance_create(mantle.x + centerx(mantle), mantle.y + centery(mantle), obj_shadowmantleFireball_example);
                fireball.speed = 6;
                fireball.direction = (i * 60) + (fireballcount * 4);
                fireball.gravity_direction = fireball.direction + 180;
                fireball.gravity = 0.7;
                fireball.depth = mantle.depth - 10;
                fireball.image_speed = 0.25;
                scr_darksize(fireball);
            }
            fireballcount++;
            fireballtimer -= 2;
        }
    }
    if (fireballtimer >= 90)
    {
        fireballcount = 0;
        fireballtimer = 0;
    }
}
if (type == 2)
{
    if (fireballtimer > 30)
    {
        if (fireballcount < 6)
        {
            snd_stop(snd_board_torch);
            snd_play(snd_board_torch);
            for (var i = 0; i < 6; i++)
            {
                var fireball = instance_create(mantle.x + centerx(mantle), mantle.y + centery(mantle), obj_shadowmantleFireball_example);
                fireball.speed = 2;
                fireball.direction = (i * 60) + (fireballcount * 8);
                fireball.gravity_direction = fireball.direction + 180;
                fireball.gravity = 0.2333333333333333;
                fireball.depth = mantle.depth - 10;
                fireball.image_speed = 0.25;
                scr_darksize(fireball);
            }
            fireballcount++;
            fireballtimer -= 2;
        }
    }
    if (fireballtimer >= 90)
    {
        fireballcount = 0;
        fireballtimer = 0;
    }
}
if (type == 3)
{
    if (fireballtimer > 30)
    {
        if (fireballcount < 3)
        {
            snd_stop(snd_board_torch);
            snd_play(snd_board_torch);
            for (var i = 0; i < 6; i++)
            {
                var fireball = instance_create(mantle.x + centerx(mantle), mantle.y + centery(mantle), obj_shadowmantleFireball_example);
                fireball.speed = 2;
                fireball.direction = (i * 60) + (totalcount * 8);
                fireball.gravity_direction = fireball.direction + 180;
                fireball.gravity = 0.2333333333333333;
                fireball.depth = mantle.depth - 10;
                fireball.image_speed = 0.25;
                scr_darksize(fireball);
            }
            fireballcount++;
            totalcount++;
            fireballtimer -= 2;
        }
    }
    if (fireballtimer >= 40)
    {
        fireballcount = 0;
        fireballtimer = 10;
    }
}
if (type == 4)
{
    if (fireballtimer > 30)
    {
        if (fireballcount < 90)
        {
            snd_stop(snd_board_torch);
            snd_play(snd_board_torch);
            for (var i = 0; i < 5; i++)
            {
                var fireball = instance_create(mantle.x + centerx(mantle), mantle.y + centery(mantle), obj_shadowmantleFireball_example);
                fireball.speed = 6;
                fireball.direction = (i * 72) + (fireballcount * 6);
                fireball.gravity_direction = fireball.direction + 180;
                fireball.gravity = 0.7;
                fireball.depth = mantle.depth - 10;
                fireball.image_speed = 0.25;
                scr_darksize(fireball);
            }
            fireballcount++;
            fireballtimer -= 3;
        }
    }
    if (fireballtimer >= 90)
    {
        fireballcount = 0;
        fireballtimer = 0;
    }
}
if (type == 5)
{
    if (fireballtimer == 30)
    {
        for (var i = 0; i < 5; i++)
        {
            var fireball = instance_create(mantle.x + centerx(mantle), mantle.y + centery(mantle), obj_shadowmantleFireball_example);
            fireball.image_speed = 0.25;
            scr_darksize(fireball);
            scr_lerp_var_instance(fireball, "x", fireball.x, 176 + (i * 64), 30, -1, "in");
            scr_lerp_var_instance(fireball, "y", fireball.y, 80, 30, 2, "out");
            scr_script_delayed(scr_lerp_var_instance, 45, fireball, "gravity", 0, 1, 15);
        }
    }
    if (fireballtimer == 60)
    {
        for (var i = 0; i < 5; i++)
        {
            var fireball = instance_create(mantle.x + centerx(mantle), mantle.y + centery(mantle), obj_shadowmantleFireball_example);
            fireball.image_speed = 0.25;
            scr_darksize(fireball);
            scr_lerp_var_instance(fireball, "x", fireball.x, 208 + (i * 64), 30, -1, "in");
            scr_lerp_var_instance(fireball, "y", fireball.y, 304, 30, 2, "out");
            scr_script_delayed(scr_lerp_var_instance, 45, fireball, "gravity", 0, -1, 15);
        }
    }
    if (fireballtimer == 90)
    {
        for (var i = 0; i < 3; i++)
        {
            var fireball = instance_create(mantle.x + centerx(mantle), mantle.y + centery(mantle), obj_shadowmantleFireball_example);
            fireball.image_speed = 0.25;
            scr_darksize(fireball);
            scr_lerp_var_instance(fireball, "x", fireball.x, 144, 30, -1, "in");
            scr_lerp_var_instance(fireball, "y", fireball.y, 112 + (i * 64), 30, 2, "out");
            scr_script_delayed(scr_lerp_var_instance, 45, fireball, "gravity", 0, -1, 15);
            fireball.gravity_direction = 180;
        }
    }
    if (fireballtimer == 120)
    {
        for (var i = 0; i < 3; i++)
        {
            var fireball = instance_create(mantle.x + centerx(mantle), mantle.y + centery(mantle), obj_shadowmantleFireball_example);
            fireball.image_speed = 0.25;
            scr_darksize(fireball);
            scr_lerp_var_instance(fireball, "x", fireball.x, 496, 30, -1, "in");
            scr_lerp_var_instance(fireball, "y", fireball.y, 144 + (i * 64), 30, 2, "out");
            scr_script_delayed(scr_lerp_var_instance, 45, fireball, "gravity", 0, -1, 15);
            fireball.gravity_direction = 0;
        }
    }
    if (fireballtimer >= 180)
        fireballtimer = 0;
}
