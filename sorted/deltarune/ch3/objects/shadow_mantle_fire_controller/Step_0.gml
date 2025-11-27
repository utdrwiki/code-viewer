if (!instance_exists(obj_shadow_mantle_enemy))
{
    debug_print("saved crash");
    exit;
}
if (_type == 0)
{
    timer++;
    if (timer == 3)
    {
        if (count < 6)
        {
            fire = instance_create(x, y, obj_shadow_mantle_fire);
            fire.rotator_target = obj_shadow_mantle_enemy.id;
            fire.place = 0 + (count * 60) + (6 * count);
            fire._type = _type;
            timer = 0;
            count++;
        }
        else
        {
            instance_destroy();
        }
    }
}
if (_type == 1)
{
    timer++;
    if (timer == 3)
    {
        if (count < 6)
        {
            fire = instance_create(x, y, obj_shadow_mantle_fire);
            fire.rotator_target = obj_shadow_mantle_enemy.id;
            fire.place = 0 + (count * 60) + (6 * count);
            fire._type = _type;
            timer = 0;
            count++;
        }
        else
        {
            with (obj_shadow_mantle_fire)
                len_speed = 10;
            instance_destroy();
        }
    }
}
if (_type == 2)
{
    timer++;
    if (timer == 3)
    {
        if (count < 6)
        {
            fire = instance_create(x, y, obj_shadow_mantle_fire);
            fire.rotator_target = obj_shadow_mantle_enemy.id;
            fire.place = 0 + (count * 60) + (6 * count) + offset;
            fire._type = _type;
            fire.len = 40;
            if (dir == -1)
                fire.place_speed = -2;
            timer = 0;
            count++;
        }
        else
        {
            with (obj_shadow_mantle_fire)
                con = 1;
            instance_destroy();
        }
    }
}
if (_type == 3)
{
    timer++;
    if (timer == 3)
    {
        if (count < 6)
        {
            fire = instance_create(x, y, obj_shadow_mantle_fire);
            fire.rotator_target = obj_shadow_mantle_enemy.id;
            fire.place = 0 + (count * 60) + (6 * count) + offset;
            fire._type = _type;
            fire.len = 40;
            if (dir == -1)
                fire.place_speed = -2;
            timer = 0;
            count++;
        }
        else
        {
            with (obj_shadow_mantle_fire)
                con = 1;
            instance_destroy();
        }
    }
}
if (_type == 4)
{
    with (obj_shadow_mantle_fire)
    {
        if (image_alpha == 1)
            image_alpha = 0;
        else
            image_alpha = 1;
    }
    timer++;
    if (timer == 1 && con2 == 0)
    {
        if (count < 6)
        {
            fire = instance_create(x, y, obj_shadow_mantle_fire);
            fire.rotator_target = obj_shadow_mantle_enemy.id;
            fire.place = offset + (count * 60);
            fire._type = _type;
            fire.len = 50;
            fire.place_speed = 0;
            timer = 0;
            count++;
        }
        else
        {
            with (obj_shadow_mantle_fire)
                con = 1;
            con2 = 1;
        }
    }
    if (timer == 16)
    {
        with (obj_shadow_mantle_fire)
            image_alpha = 1;
        instance_destroy();
    }
}
if (_type == 4.5)
{
    with (obj_shadow_mantle_fire)
    {
        if (image_alpha == 1)
            image_alpha = 0;
        else
            image_alpha = 1;
    }
    timer++;
    if (timer == 1 && con2 == 0)
    {
        if (count < 6)
        {
            fire = instance_create(x, y, obj_shadow_mantle_fire);
            fire.rotator_target = obj_shadow_mantle_enemy.id;
            fire.place = offset + (count * 60);
            fire._type = _type;
            fire.len = 50;
            fire.place_speed = 0;
            timer = 0;
            count++;
        }
        else
        {
            with (obj_shadow_mantle_fire)
                con = 1;
            con2 = 1;
        }
    }
    if (timer == 21)
    {
        with (obj_shadow_mantle_fire)
            image_alpha = 1;
        instance_destroy();
    }
}
if (_type == 5)
{
    with (obj_shadow_mantle_fire)
    {
        if (image_alpha == 1)
            image_alpha = 0;
        else
            image_alpha = 1;
    }
    timer++;
    if (timer == 2 && con2 == 0)
    {
        if (count < 6)
        {
            fire = instance_create(x, y, obj_shadow_mantle_fire);
            fire.rotator_target = obj_shadow_mantle_enemy.id;
            fire.place = offset + (count * 60);
            fire._type = _type;
            fire.len = 50;
            fire.place_speed = 0;
            timer = 0;
            count++;
        }
        else
        {
            with (obj_shadow_mantle_fire)
                con = 1;
            con2 = 1;
        }
    }
    if (timer == 10)
    {
        with (obj_shadow_mantle_fire)
            image_alpha = 1;
        instance_destroy();
    }
}
if (_type == 6)
{
    fireballtimer++;
    if (fireballtimer > 30)
    {
        if (fireballcount < 3)
        {
            snd_stop(snd_board_torch);
            snd_play(snd_board_torch);
            for (var i = 0; i < 6; i++)
            {
                var fireball = instance_create(obj_shadow_mantle_enemy.x + 16, obj_shadow_mantle_enemy.y + 16, obj_shadow_mantle_fire3);
                fireball.speed = 2;
                fireball.direction = (i * 60) + (totalcount * 5);
                fireball.gravity_direction = fireball.direction + 180;
                fireball.gravity = 0.2333333333333333;
                fireball.depth = obj_shadow_mantle_enemy.depth - 10;
                fireball.image_speed = 0.25;
            }
            fireballcount++;
            totalcount++;
            fireballtimer -= 2;
        }
    }
    if (fireballtimer >= 40)
        instance_destroy();
}
if (_type == 7)
{
    fireballtimer++;
    if (fireballtimer > 30)
    {
        if (fireballcount < 3)
        {
            snd_stop(snd_board_torch);
            snd_play(snd_board_torch);
            for (var i = 0; i < 6; i++)
            {
                var fireball = instance_create(obj_shadow_mantle_enemy.x + 16, obj_shadow_mantle_enemy.y + 16, obj_shadow_mantle_fire3);
                fireball.speed = 2;
                fireball.direction = (i * 60) + (totalcount * 5);
                fireball.gravity_direction = fireball.direction + 180;
                fireball.gravity = 0.3666666666666667;
                fireball.depth = obj_mainchara_board.depth - 10;
                fireball.image_speed = 0.25;
                fireball.activetimer = 18;
            }
            fireballcount++;
            totalcount++;
            fireballtimer -= 2;
        }
    }
    if (fireballtimer >= 40)
        instance_destroy();
}
if (_type == 8)
{
    spin_a += 0.5;
    spin_speed = 1.6 + (sin(spin_a / 6) * 1.2);
    if (spin_speed < 1.5)
        spin_speed = 1.5;
    angle += spin_speed;
    if (spin_a == 40 || spin_a == 100)
        instance_create(x, y, obj_shadow_mantle_bomb_spawn);
    if (spin_a == 70)
    {
        bullet = instance_create(x + 16, y + 29, obj_shadow_mantle_bomb);
        bullet.depth = depth - 5;
        bullet.targetx = 464;
        bullet.targety = 160 + (irandom(2) * 32) + 29;
    }
    fireballtimer++;
    if (fireballtimer > 30 && i_ex(obj_shadow_mantle_enemy))
    {
        if (fireballcount < 50)
        {
            snd_stop(snd_board_torch);
            snd_play(snd_board_torch);
            for (var i = 0; i < 3; i++)
            {
                var dir = (i * 120) + angle;
                var fireball = instance_create(obj_shadow_mantle_enemy.x + 16 + lengthdir_x(24, dir), obj_shadow_mantle_enemy.y + 16 + lengthdir_y(24, dir), obj_shadow_mantle_fire3);
                fireball.speed = 0;
                fireball.direction = dir;
                fireball.gravity_direction = fireball.direction;
                fireball.gravity = 0.7;
                fireball.depth = obj_mainchara_board.depth - 10;
                fireball.image_speed = 0.25;
                fireball.activetimer = 10;
                fireball._type = 1;
            }
            fireballcount++;
            fireballtimer -= 4;
        }
    }
    if (fireballtimer >= 32)
        instance_destroy();
}
