var enemy_count = 0;
enemy_count += instance_number(obj_susiezilla_zombie);
enemy_count += instance_number(obj_susiezilla_laser_building);
enemy_count += instance_number(obj_susiezilla_mansion);
enemy_count += instance_number(obj_susiezilla_gunzombie);
enemy_count += instance_number(obj_susiezilla_shadowguy);
if (wave == 1)
{
    if (wave_con == 1 && enemy_count == 0)
    {
        timer++;
        if (timer == 1)
        {
            instance_create(653, 266, obj_susiezilla_zombie);
            instance_create(668, 296, obj_susiezilla_zombie);
            instance_create(686, 259, obj_susiezilla_zombie);
            instance_create(699, 296, obj_susiezilla_zombie);
            timer = 0;
            wave_con = 2;
            enemy_count = 1;
        }
    }
    if (wave_con == 2 && enemy_count == 0)
    {
        timer++;
        if (timer == 1)
        {
            var _bomb = instance_create(camerax() - 50, 210, obj_susiezilla_roller);
            _bomb.px = 6;
            _bomb = instance_create(camerax() - 50, 330, obj_susiezilla_roller);
            _bomb.px = 6;
            instance_create(-30, 251, obj_susiezilla_gunzombie);
            instance_create(-60, 288, obj_susiezilla_gunzombie);
            instance_create(-30, 273, obj_susiezilla_gunzombie);
        }
        if (timer == 2)
            instance_create(531, 201, obj_susiezilla_laser_building);
        if (timer == 5)
        {
            timer = 0;
            wave_con = 3;
            enemy_count = 1;
            bld = instance_create(82, 245, obj_susiezilla_laser_building);
            bld.image_xscale = -2;
            instance_create(668, 229, obj_susiezilla_gunzombie);
            instance_create(668, 333, obj_susiezilla_gunzombie);
            instance_create(653, 266, obj_susiezilla_zombie);
            instance_create(668, 296, obj_susiezilla_zombie);
            instance_create(686, 259, obj_susiezilla_zombie);
            instance_create(699, 296, obj_susiezilla_zombie);
            instance_create(714, 259, obj_susiezilla_zombie);
        }
    }
    if (wave_con == 3 && enemy_count == 0)
    {
        timer++;
        if (timer == 1)
        {
            var _bomb = instance_create(camerax() + 700, 210, obj_susiezilla_roller);
            _bomb.px = -6;
            _bomb = instance_create(camerax() + 700, 320, obj_susiezilla_roller);
            _bomb.px = -6;
        }
        if (timer == 3)
        {
            var _bomb = instance_create(camerax() - 50, 210, obj_susiezilla_roller);
            _bomb.px = -6;
            _bomb = instance_create(camerax() - 50, 320, obj_susiezilla_roller);
            _bomb.px = -6;
            instance_create(653, 266, obj_susiezilla_zombie);
            instance_create(668, 296, obj_susiezilla_zombie);
            instance_create(686, 259, obj_susiezilla_zombie);
            instance_create(699, 296, obj_susiezilla_zombie);
            instance_create(714, 259, obj_susiezilla_zombie);
            camerax_target = 640;
            move_camera_con = 1;
        }
    }
}
if (wave == 2)
{
    if (wave_con == 1 && enemy_count == 0)
    {
        instance_create(camerax() + 700, irandom(150) + 200, obj_susiezilla_shadowguy);
        wave_con = 2;
        enemy_count = 1;
    }
    if (wave_con == 2 && enemy_count == 0)
    {
        instance_create(camerax() - 60, irandom(50) + 200, obj_susiezilla_shadowguy);
        instance_create(1308, 229, obj_susiezilla_gunzombie);
        instance_create(1308, 333, obj_susiezilla_gunzombie);
        wave_con = 3;
        enemy_count = 1;
    }
    if (wave_con == 3 && enemy_count == 0)
    {
        bld = instance_create(camerax() + 240, 245, obj_susiezilla_laser_building);
        bld.image_xscale = -2;
        instance_create(camerax() + 400, 201, obj_susiezilla_laser_building);
        instance_create(camerax() - 20, 266, obj_susiezilla_zombie);
        instance_create(camerax() - 70, 296, obj_susiezilla_zombie);
        instance_create(camerax() - 25, 259, obj_susiezilla_zombie);
        instance_create(camerax() - 70, 296, obj_susiezilla_zombie);
        wave_con = 4;
        enemy_count = 1;
    }
    if (wave_con == 4 && enemy_count == 0)
    {
        repeat (3)
            instance_create(choose(camerax() - 60, camerax() + 700), irandom(150) + 200, obj_susiezilla_shadowguy);
        wave_con = 5;
        enemy_count = 1;
    }
    if (wave_con == 5 && enemy_count == 0)
    {
        mansion = instance_create(1792, 274, obj_susiezilla_mansion);
        with (mansion)
            scr_depth_alt();
        camerax_target = 1280;
        move_camera_con = 1;
    }
}
if (wave == 3 && i_ex(obj_susiezilla_mansion))
{
    if ((obj_susiezilla_mansion.pattern == 1 && obj_susiezilla_mansion.patterntimer == 100) || (obj_susiezilla_mansion.pattern == 5 && obj_susiezilla_mansion.patterntimer == 120))
    {
        if (pattern == 0)
        {
            if (choose(0, 1) == 1)
            {
                instance_create(camerax() - 30, 251, obj_susiezilla_gunzombie);
                instance_create(camerax() - 60, 288, obj_susiezilla_gunzombie);
                instance_create(camerax() - 30, 273, obj_susiezilla_gunzombie);
            }
            else
            {
                instance_create(camerax() + camerawidth() + 30, 251, obj_susiezilla_gunzombie);
                instance_create(camerax() + camerawidth() + 30, 273, obj_susiezilla_gunzombie);
            }
        }
        if (pattern == 1)
        {
            if (choose(0, 1) == 1)
            {
                instance_create(camerax() - 20, 266, obj_susiezilla_zombie);
                instance_create(camerax() - 70, 296, obj_susiezilla_zombie);
                instance_create(camerax() - 25, 259, obj_susiezilla_zombie);
                instance_create(camerax() - 70, 296, obj_susiezilla_zombie);
                instance_create(camerax() - 50, 259, obj_susiezilla_zombie);
            }
            else
            {
                bld = instance_create(1392, 230, obj_susiezilla_laser_building);
                bld.image_xscale = -2;
                instance_create(1748, 286, obj_susiezilla_laser_building);
            }
        }
        if (pattern == 2)
        {
            instance_create(choose(camerax() - 60, camerax() + 700), irandom(150) + 200, obj_susiezilla_shadowguy);
            instance_create(choose(camerax() - 60, camerax() + 700), irandom(150) + 200, obj_susiezilla_shadowguy);
        }
        pattern++;
        if (pattern >= 3)
            pattern = 0;
    }
}
createcartimer++;
createcartimer2++;
if (createcartimer == 500 && obj_susiezilla.x < 1280)
{
    createcartimer = 0;
    createcartimermax = 70 + irandom(160);
    car = instance_create(-20, 212, obj_car_breakable);
    car.hspeed = 4;
    if (irandom(10) < 3)
    {
        car = instance_create(-60, 212, obj_car_breakable);
        car.hspeed = 4;
    }
}
if (createcartimer2 == 500 && obj_susiezilla.x < 1280)
{
    createcartimer2 = 0;
    createcartimer2max = 70 + irandom(160);
    car = instance_create(camerax() + 660, 294, obj_car_breakable);
    car.hspeed = -4;
    car.image_xscale = -1;
}
if (camerax_target == 640 && move_camera_con == 1)
{
    if (camerax() < (obj_susiezilla.x - 240))
    {
        if (abs(camerax() - obj_susiezilla.x - 240) < 7)
            camerax_set(obj_susiezilla.x - 240);
        else
            camerax_set(camerax() + 4);
    }
    if (camerax() > 640)
    {
        camerax_set(640);
        move_camera_con = 0;
        wave = 2;
        wave_con = 1;
    }
}
if (camerax_target == 1280 && move_camera_con == 1)
{
    if (camerax() < (obj_susiezilla.x - 240))
    {
        if (abs(camerax() - obj_susiezilla.x - 240) < 7)
            camerax_set(obj_susiezilla.x - 240);
        else
            camerax_set(camerax() + 4);
    }
    if (camerax() > 1280)
    {
        camerax_set(1280);
        move_camera_con = 0;
        wave = 3;
        wave_con = 1;
    }
}
