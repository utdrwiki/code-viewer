if (hurtCon == 0)
{
    if (attackcon == 0)
    {
        var a = 1;
        if (sprite_index == spr_susiezilla_zombie_giantsword)
            a = 2;
        repeat (a)
        {
            if (abs(obj_susiezilla.x - x) > 50)
            {
                if (obj_susiezilla.x < x)
                {
                    image_index = 0;
                    if (!collision_rectangle(x - 20 - 4, y, x + 20, y - 20, obj_interactable, false, true))
                        x -= 4;
                }
                else
                {
                    image_index = 1;
                    if (!collision_rectangle(x - 20, y, x + 20 + 4, y - 20, obj_interactable, false, true))
                        x += 4;
                }
            }
            if (abs(obj_susiezilla.y - y) > 25 && distance_to_object(obj_susiezilla) < 100)
            {
                if (obj_susiezilla.y < y)
                {
                    if (!collision_rectangle(x - 20, y, x + 20, y - 20 - 2, obj_interactable, false, true))
                        y -= 2;
                }
                else if (!collision_rectangle(x - 20 - 4, y + 2, x + 20, y - 20, obj_interactable, false, true))
                {
                    y += 2;
                }
            }
        }
        if (abs(obj_susiezilla.y - y) > 25 || abs(obj_susiezilla.x - x) > 50)
        {
        }
        else if (latched == 0)
        {
            var zombie_attacking = false;
            if (sprite_index == spr_susiezilla_zombie_giantsword)
            {
                for (var i = 0; i < instance_number(obj_susiezilla_zombie); i++)
                {
                    zombie[i] = instance_find(obj_susiezilla_zombie, i);
                    if (zombie[i].attackcon == 1)
                        zombie_attacking = true;
                }
                if (zombie_attacking == false)
                    attackcon = 1;
            }
            else if (zombie_attacking == false)
            {
                attackcon = 3;
            }
        }
    }
    if (attackcon == 3)
    {
        attacktimer++;
        if (attacktimer == 1)
            redflashtimer = 11;
        if (attacktimer == 11)
        {
            snd_stop(snd_hitcar_little);
            snd_play_pitch(snd_hitcar_little, 1.3);
            image_index = 11;
            vspeed = -8 - random(3);
            gravity = 0.8 + (random(5) / 10);
            if (obj_susiezilla.x < x)
                hspeed = -3 - random(2);
            else
                hspeed = 3 + random(2);
        }
        if (attacktimer > 26 && y > savey && vspeed > 0)
        {
            snd_play(snd_bump);
            hspeed = 0;
            vspeed = 0;
            gravity = 0;
            scr_shakeobj();
        }
        if (attacktimer == 56)
        {
            snd_play(snd_wing);
            scr_shakeobj();
        }
        if (attacktimer == 86)
        {
            snd_play(snd_wing);
            scr_shakeobj();
        }
        if (attacktimer >= 90)
        {
            image_index = 0;
            attackcon = 0;
            attacktimer = 0;
        }
        if (point_distance(x, y - 20, obj_susiezilla.x, obj_susiezilla.y - 50) < 36 && attackcon == 3 && vspeed != 0 && hp > 0)
        {
            instance_create(obj_susiezilla.x, obj_susiezilla.y - 20, obj_susiezilla_enemy_hitbox);
            event_user(0);
            anim = instance_create(x, y - 16, obj_animation);
            anim.sprite_index = spr_coaster_explosion;
            anim.image_speed = 0.5;
            anim.depth = -99999999;
        }
    }
    if (attackcon == 1)
    {
        attacktimer++;
        if (attacktimer == 1)
        {
            if (image_index == 0)
                image_index = 7;
            else
                image_index = 9;
            redflashtimer = 11;
        }
        if (attacktimer == 11)
        {
            snd_stop(snd_motor_upper_quick);
            snd_play_pitch(snd_motor_upper_quick, 1.3);
            if (image_index == 7)
            {
                image_index = 8;
                hspeed = -12;
                friction = 2;
            }
            else
            {
                image_index = 10;
                hspeed = 12;
                friction = 2;
            }
            hitbox = instance_create(x, y, obj_susiezilla_enemy_hitbox);
            hitbox.sprite_index = sprite_index;
            hitbox.image_xscale = image_xscale;
            hitbox.image_index = 0;
            hitbox.hit_direction = -1;
        }
        if (attacktimer > 11 && attacktimer < 13)
            hitbox.x = x;
        if (attacktimer > 11 && hspeed == 0)
        {
            hspeed = 0;
            friction = 0;
            if (image_index == 8)
                image_index = 0;
            else
                image_index = 1;
            attackcon = 0;
            attacktimer = 0;
        }
    }
    if (attackcon == 2)
    {
        attacktimer++;
        if (attacktimer == 1)
        {
            snd_stop(snd_hitcar_little);
            snd_play_pitch(snd_hitcar_little, 1.3);
            image_index = 11;
            vspeed = -11;
            gravity = 1;
            hspeed = random(2) * -1;
            savey = y - 18;
        }
        if (attacktimer > 1 && y > savey && vspeed > 0)
        {
            hspeed = 0;
            vspeed = 0;
            gravity = 0;
        }
        if (attacktimer > 30)
        {
            attacktimer = 2;
            obj_susiezilla.health_count -= 10;
            scr_shakeobj();
        }
    }
}
if (hurtCon == 1)
{
    recoil += (recoilSpeed * recoilDir);
    recoilSpeed -= 1;
    if (sign(recoil) != recoilDir)
    {
        recoil = 0;
        hurtCon = 0;
        recoilSpeed = 0;
        image_index = 0;
    }
}
if (fall_speed != 0 || height > 0)
{
    height -= fall_speed;
    fall_speed += 1;
    if (height <= 0)
    {
        height = 0;
        if (bounce_count < 1)
            fall_speed *= -0.5;
        else
            fall_speed = 0;
        bounce_count++;
        snd_stop(snd_bump);
        snd_play(snd_bump);
        vspeed = 0;
    }
}
if (hurtCon == 2)
{
    if (fall_speed > 0)
    {
        image_index = 5 + reverse_image;
        hurtCon = 3;
        shadow.image_xscale *= 1;
    }
}
if (hurtCon == 3 && height == 0 && fall_speed == 0)
{
    alarm[0] = 10;
    hurtCon = 4;
    hspeed = 0;
}
if (hurtCon == 5)
{
    fader++;
    if ((fader % 2) == 1)
        visible = false;
    else
        visible = true;
    if (fader == 15)
    {
        var fx = instance_create(x - 24, y - 50, obj_animation);
        fx.sprite_index = spr_explosion_round;
        fx.image_speed = 0.5;
        fx.depth = obj_susiezilla.depth - 20;
        audio_stop_sound(snd_explosion_firework);
        snd_play_pitch(snd_explosion_firework, 1.1 + random(0.4));
    }
    if (fader >= 20)
        instance_destroy();
}
