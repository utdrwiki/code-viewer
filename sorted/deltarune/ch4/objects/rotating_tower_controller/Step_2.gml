obj_darkcontroller.depth = obj_mainchara.depth - 100;
depth = obj_mainchara.depth + 200000;
with (obj_mainchara)
{
    var aa = false;
    if (i_ex(obj_tower_dog_controller) && obj_tower_dog_controller.con > 6)
        aa = true;
    if (aa == false && (obj_mainchara.y <= 220 || (other.yoffset > 484 && room == room_dw_church_statueroom) || (other.yoffset > 484 && room == room_dw_church_dogclimb) || (other.yoffset > 484 && room == room_dw_titan_tower_test)))
    {
        if (obj_rotating_tower_controller.xstart_init == 0 && (room == room_dw_church_statueroom || room == room_dw_church_dogclimb || room == room_dw_titan_tower_test))
        {
            obj_rotating_tower_controller.xstart_init = 1;
            xstart = x;
        }
        y = 220;
        x = xstart;
        if (other.endclimb == true)
            y = 220 + (other.endclimbtimer * 2);
    }
}
if (room == room_dw_church_statueroom)
{
    if (yoffset > 800 && yoffset < 1730)
    {
        var rand = 20;
        var aa = 0;
        timer++;
        if (timer > 96)
        {
            timer = 0;
            repeat (8)
            {
                if (aa == 3 || aa == 7)
                {
                }
                else
                {
                    bullet = instance_create(320, cameray() - 1800 - (aa * 50), obj_rotating_bullet);
                    bullet.angle_position = rand;
                    bullet.bullet_speed = 4;
                    bullet.mode = 1;
                }
                aa++;
            }
        }
    }
    if (yoffset > 3200 && yoffset < 3900)
    {
        var rand = random(90);
        var aa = 0;
        var bb = irandom(8);
        var cc = bb + 9;
        timer++;
        if (timer > 36)
        {
            timer = 0;
            repeat (4)
            {
                if (aa == bb || aa == cc)
                {
                }
                else
                {
                    bullet = instance_create(320, cameray() - 4000, obj_rotating_bullet);
                    bullet.angle_position = rand + (aa * 90);
                    bullet.mode = 2;
                }
                aa++;
            }
        }
    }
    if (yoffset > 4200 && yoffset < 4900)
    {
        var rand = random(90);
        var aa = 0;
        var bb = irandom(8);
        var cc = bb + 9;
        timer++;
        if (timer > 8)
        {
            timer = 0;
            repeat (4)
            {
                if (aa == bb || aa == cc)
                {
                }
                else
                {
                    bullet = instance_create(320, cameray() - 4900, obj_rotating_bullet);
                    bullet.angle_position = angle_extra + (aa * 90);
                    bullet.mode = 2;
                }
                aa++;
            }
            angle_extra += 20;
        }
    }
    if (yoffset > 5100 && yoffset < 5900)
    {
        var rand = random(90);
        var aa = 0;
        var bb = irandom(8);
        var cc = bb + 9;
        timer++;
        if (timer > 4)
        {
            timer = 0;
            repeat (4)
            {
                if (aa == bb)
                {
                }
                else
                {
                    bullet = instance_create(320, cameray() - 5900, obj_rotating_bullet);
                    bullet.angle_position = angle_extra + (aa * 90);
                    bullet.mode = 2;
                }
                aa++;
            }
            angle_extra += 10;
        }
    }
    if (yoffset > 6100 && yoffset < 7000)
    {
        var rand = random(90);
        var aa = 0;
        var bb = irandom(8);
        var cc = bb + 9;
        timer++;
        if (timer > 30)
        {
            timer = 0;
            repeat (5)
            {
                bullet = instance_create(320, cameray() - 7100, obj_rotating_bullet);
                bullet.angle_position = 300 + random(136);
                bullet.bullet_speed = 12;
                bullet.mode = 1;
            }
            angle_extra += 10;
        }
    }
    if (yoffset > 7300 && yoffset < 8300)
    {
        var rand = random(360);
        var aa = 0;
        timer++;
        if (timer > 20)
        {
            timer = 0;
            repeat (4)
            {
                bullet = instance_create(320, cameray() - yoffset - 50, obj_rotating_bullet);
                bullet.angle_position = rand;
                bullet.bullet_speed = 0;
                bullet.mode = 3;
                bullet.grav = (6 + random(5)) / 20;
            }
        }
    }
}
