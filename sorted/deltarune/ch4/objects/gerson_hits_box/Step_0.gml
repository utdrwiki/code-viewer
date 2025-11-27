image_index += 0.5;
if (image_index == 4)
{
    snd_play_x(snd_stardrop, 1, 1 + (irandom(4) / 10));
    var a = 1;
    var b = 1;
    var yoffset = 20;
    repeat (2)
    {
        if (image_xscale == -2)
        {
            anim = instance_create(obj_growtangle.x + 75, obj_growtangle.y + yoffset, obj_gerson_growtangle_hit_fx);
            anim.dir = 1;
            anim.image_xscale = a * -1;
            anim.image_yscale = b;
        }
        else
        {
            anim = instance_create(obj_growtangle.x - 75, obj_growtangle.y + yoffset, obj_gerson_growtangle_hit_fx);
            anim.dir = -1;
            anim.image_xscale = a;
            anim.image_yscale = b;
        }
        anim.sprite_index = spr_gerson_box_hit_fx1;
        anim.image_speed = 1.5;
        yoffset = -20;
        b = -1;
    }
    if (image_xscale == -2)
    {
        obj_hammer_of_justice_enemy.hitbox_con = 1;
        var slowbullet1 = irandom(8);
        var slowbullet2 = slowbullet1 + 1;
        var slowbullet3 = slowbullet1 + 5;
        if (slowbullet3 > 8)
            slowbullet3 -= 10;
        var slowbullet4 = slowbullet3 + 1;
        var side_x = -80;
        var dir = 0;
        if (global.turntimer > 1 && i_ex(obj_growtangle))
        {
            for (i = 0; i < 7; i++)
            {
                bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (23 * i), obj_box_hit_bullet);
                with (bulletshot)
                    scr_bullet_init();
                bulletshot.direction = dir;
                bulletshot.speed = 11.5;
                bulletshot.friction = 0.14;
                bulletshot.depth = depth - 1;
                bulletshot.timermax = 43;
                if (i == slowbullet1 || i == slowbullet2 || i == slowbullet3 || i == slowbullet4)
                {
                    bulletshot.speed = 7.3 + choose(1, 2);
                    bulletshot.friction = 0.08;
                }
            }
        }
    }
    else
    {
        obj_hammer_of_justice_enemy.hitbox_con = 2;
        var slowbullet1 = irandom(8);
        var slowbullet2 = slowbullet1 + 1;
        var slowbullet3 = slowbullet1 + 5;
        if (slowbullet3 > 8)
            slowbullet3 -= 10;
        var slowbullet4 = slowbullet3 + 1;
        var side_x = 80;
        var dir = 180;
        if (global.turntimer > 1 && i_ex(obj_growtangle))
        {
            for (i = 0; i < 7; i++)
            {
                bulletshot = instance_create(obj_growtangle.x + side_x, (obj_growtangle.y - 70) + (23 * i), obj_box_hit_bullet);
                with (bulletshot)
                    scr_bullet_init();
                bulletshot.direction = dir;
                bulletshot.speed = 11.5;
                bulletshot.friction = 0.14;
                bulletshot.depth = depth - 1;
                bulletshot.timermax = 43;
                if (i == slowbullet1 || i == slowbullet2 || i == slowbullet3 || i == slowbullet4)
                {
                    bulletshot.speed = 7.3 + choose(1, 2);
                    bulletshot.friction = 0.08;
                }
            }
        }
    }
    snd_play(snd_impact);
}
if (image_index > 6.5)
{
    instance_destroy();
    if (image_xscale == -2)
        instance_create(x - 60, y + 40, obj_gerson_teleport);
    else
        instance_create(x + 60, y + 40, obj_gerson_teleport);
}
