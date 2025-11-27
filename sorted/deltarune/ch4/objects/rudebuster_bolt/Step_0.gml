if (image_alpha < 1)
    image_alpha += 0.25;
else
    image_alpha = 1;
if (t == 0)
{
    if (battlemode == 1)
    {
        targetx = global.monsterx[target.myself];
        targety = global.monstery[target.myself];
    }
    else if (instance_exists(target))
    {
        targetx = target.x + (target.sprite_width / 2);
        targety = target.y + (target.sprite_height / 2);
    }
    if (global.chapter == 4 && i_ex(obj_hammer_of_justice_enemy))
    {
        targetx = 200 + target.x + (target.sprite_width / 2);
        targety = target.y + (target.sprite_height / 2);
    }
    if (global.chapter == 4 && i_ex(obj_jackenstein_enemy))
    {
        targetx = 200 + target.x + (target.sprite_width / 2);
        targety = target.y + (target.sprite_height / 2);
    }
    cx = targetx;
    cy = targety;
    direction = (point_direction(x, y, cx, cy) - 20) + gersonoffset;
    speed = speedmax;
    friction = -1.5;
    if (global.chapter == 4 && i_ex(obj_hammer_of_justice_enemy) && obj_hammer_of_justice_enemy.rudebusterhitcount == obj_hammer_of_justice_enemy.rudebusterhitcountmax)
    {
        friction = -5;
        direction += 0;
        targety = (target.y - 60) + (target.sprite_height / 2);
    }
    if (global.chapter == 4 && i_ex(obj_jackenstein_enemy))
    {
        friction = -5;
        direction += 0;
        targety = (target.y - 60) + (target.sprite_height / 2);
    }
    image_angle = direction;
    if (red == 1)
    {
        sprite_index = spr_rudebuster_beam_red;
        image_xscale = 2.5;
        image_yscale = 2.5;
    }
}
if (instance_exists(obj_hammer_of_justice_enemy) && obj_hammer_of_justice_enemy.rudebusterhitcount < obj_hammer_of_justice_enemy.rudebusterhitcountmax && explode == 0)
{
    gersonswingtimer++;
    if (gersonswingtimer == 10)
    {
        sprite_set_offset(spr_gerson_smash_stop, 25, 40);
        obj_hammer_of_justice_enemy.sprite_index = spr_gerson_smash_stop;
        obj_hammer_of_justice_enemy.image_index = 0;
        obj_hammer_of_justice_enemy.state = 10;
        global.spelldelay += 40;
    }
    if (gersonswingtimer == 17)
    {
        with (obj_afterimage)
            instance_destroy();
        speedmax = 0;
        hurtflashalpha = 1;
        speed = 0;
        image_alpha = 1;
        scr_shakeobj();
        instance_create(x, y, obj_shake);
        snd_play(snd_rudebuster_hit);
    }
}
if (t >= 1 && explode == 0)
{
    bolt_timer += 1;
    if (button1_p() && bolt_timer >= 4 && chosen_bolt == 0 && lockdamage == false)
    {
        chosen_bolt = bolt_timer;
        lockdamage = true;
    }
    dir = point_direction(x, y, cx, cy);
    direction += (angle_difference(dir, direction) / 4);
    if (i_ex(obj_hammer_of_justice_enemy))
    {
        if (obj_hammer_of_justice_enemy.rudebusterhitcount < obj_hammer_of_justice_enemy.rudebusterhitcountmax)
        {
            direction += 4;
        }
        else
        {
            direction += 8;
            if (direction < 10)
                direction = 0;
        }
    }
    image_angle = direction;
    if (i_ex(obj_hammer_of_justice_enemy) && obj_hammer_of_justice_enemy.state != 14 && obj_hammer_of_justice_enemy.rudebusterhitcount >= obj_hammer_of_justice_enemy.rudebusterhitcountmax)
    {
        if (x > (camerax() + 500))
        {
            with (obj_hammer_of_justice_enemy)
            {
                saverudebusterstarcount = round((other.damage / global.monstermaxhp[0]) * 100);
                state = 14;
                spinxscale = 1;
                spinspeed = 3.05;
                snd_play_pitch(snd_wallclaw, 0.7);
                global.spelldelay += 33;
                if (instance_exists(obj_hammer_of_justice_enemy) && obj_hammer_of_justice_enemy.rudebusterhitcount == obj_hammer_of_justice_enemy.rudebusterhitcountmax && obj_hammer_of_justice_enemy.rudebusterhitcountmax < 3)
                    obj_hammer_of_justice_enemy.rudebusterhitcountmax++;
            }
        }
    }
    if (x > (camerax() + 640))
        instance_destroy();
    if (point_distance(x, y, cx, cy) <= 200 && i_ex(obj_jackenstein_enemy) && misswritercreated == false)
    {
        dmgwriter = instance_create(obj_jackenstein_enemy.x + 40, obj_jackenstein_enemy.y + 40, obj_dmgwriter);
        dmgwriter.damage = 0;
        dmgwriter.type = 1;
        misswritercreated = true;
    }
    if (point_distance(x, y, cx, cy) <= 40 && !i_ex(obj_hammer_of_justice_enemy) && !i_ex(obj_jackenstein_enemy))
    {
        final_bolt = bolt_timer;
        visible = 0;
        explode = 1;
        t = 1;
        with (obj_hammer_of_justice_enemy)
        {
            swingtimer = 0;
            shakex = 9;
            state = 3;
            hurttimer = 30;
        }
        if (i_ex(obj_titan_enemy) && obj_titan_enemy.drawstate == "crack")
        {
            with (obj_titan_enemy)
                redflashtimer = 10;
            snd_stop(snd_damage);
            snd_stop(snd_queen_punched_lower_heavy);
            snd_play(snd_damage);
            snd_play(snd_queen_punched_lower_heavy);
            scr_shakescreen();
            with (obj_shake)
            {
                shakex = 4;
                shakey = 4;
            }
        }
        if (sprite_index == spr_rudebuster_beam_green)
        {
            with (obj_titan_enemy)
            {
                if (drawstate != "crack")
                {
                    var delaytime = 2;
                    var snd = snd_play_complex(0, 0, undefined);
                    snd_add_complex(snd, 0, 236, 0.6, 0.4, (delaytime - 1) + 2, -1, 0);
                    snd_add_complex(snd, 1, 390, 0.8, 0.5, (delaytime - 1) + 0, -1, 0);
                    snd_add_complex(snd, 2, 390, 0.71, 0.5, (delaytime - 1) + 0, -1, 0);
                    snd_add_complex(snd, 3, 269, 0.7, 0.95, (delaytime - 1) + 0, -1, 0);
                    drawstate = "crack";
                    redflashtimer = 10;
                    var _x = camerax() + 500;
                    var _y = cameray() + 300;
                    var __x = (camerastartx + camerawidth()) - 494;
                    var __y = camerastarty - 88;
                    var _a = 0;
                    repeat (6)
                    {
                        mark = instance_create(__x, __y, obj_marker);
                        mark.sprite_index = spr_titan_star_break;
                        mark.image_blend = c_white;
                        mark.image_speed = 0;
                        mark.image_index = 1 + _a;
                        mark.image_xscale = 2;
                        mark.image_yscale = 2;
                        mark.gravity = 1;
                        mark.gravity_direction = 270;
                        mark.vspeed = -4 - random(18);
                        mark.hspeed = -6 + random(12);
                        mark.depth = 10;
                        _a++;
                    }
                    repeat (30)
                    {
                        mark = instance_create((_x - 40) + random(80), (_y - 40) + random(80), obj_marker);
                        mark.sprite_index = spr_gerson_item_throw;
                        mark.image_blend = merge_color(c_white, c_black, 0.3);
                        mark.image_speed = 0;
                        mark.image_index = 3;
                        mark.gravity = 1;
                        mark.gravity_direction = 270;
                        mark.vspeed = -4 - random(18);
                        mark.hspeed = -6 + random(12);
                        mark.depth = 10;
                    }
                }
            }
        }
    }
}
if (explode == 1)
{
    if (t == 1)
    {
        bonus_anim = 0;
        if (chosen_bolt > 0)
        {
            if (chosen_bolt == final_bolt)
                damage += 30;
            if (chosen_bolt == (final_bolt - 1))
                damage += 28;
            if (chosen_bolt == (final_bolt - 2))
                damage += 22;
            if (chosen_bolt == (final_bolt - 3))
                damage += 20;
            if (chosen_bolt == (final_bolt - 4))
                damage += 13;
            if (chosen_bolt == (final_bolt - 5))
                damage += 11;
            if (chosen_bolt == (final_bolt - 6))
                damage += 10;
            if (abs(chosen_bolt - final_bolt) <= 2)
            {
                bonus_anim = 1;
                snd_play(snd_scytheburst);
            }
        }
        if (red == 1)
            damage += 90;
        if (battlemode == 1)
        {
            global.hittarget[star] = 0;
            if (i_ex(obj_titan_enemy))
            {
            }
            scr_damage_enemy(star, damage);
            if (sprite_index == spr_rudebuster_beam_green)
            {
                dm.type = 1.5;
                dm.ystart -= 30;
            }
            if (global.monstertype[0] != 20 && !i_ex(obj_hammer_of_justice_enemy))
            {
                with (target)
                    __of = scr_oflash();
                if (red == 1)
                {
                    with (target)
                        __of.flashcolor = c_red;
                }
            }
        }
        else
        {
            with (target)
                __of = scr_oflash();
            if (red == 1)
            {
                with (target)
                    __of.flashcolor = c_red;
            }
        }
        snd_stop(snd_rudebuster_hit);
        snd_play(snd_rudebuster_hit);
        for (i = 0; i < 4; i += 1)
        {
            burst[i] = scr_afterimage();
            burst[i].image_speed = 0.5;
            burst[i].x = cx;
            burst[i].y = cy;
            burst[i].image_angle = 45 + (i * 90);
            burst[i].direction = burst[i].image_angle;
            burst[i].speed = 25;
            if (bonus_anim == 1)
                burst[i].speed = 40;
            burst[i].depth = depth - 10;
        }
        for (i = 4; i < 8; i += 1)
        {
            burst[i] = scr_afterimage();
            burst[i].image_speed = 0.5;
            burst[i].x = cx;
            burst[i].y = cy;
            burst[i].image_angle = 45 + (i * 90);
            burst[i].direction = burst[i].image_angle;
            burst[i].speed = 25;
            if (bonus_anim == 1)
                burst[i].speed = 40;
            burst[i].depth = depth - 10;
        }
    }
    if (t >= 2)
    {
        for (i = 0; i < 4; i += 1)
        {
            with (burst[i])
            {
                speed *= 0.75;
                image_xscale *= 0.8;
            }
        }
        for (i = 4; i < 8; i += 1)
        {
            with (burst[i])
            {
                speed *= 0.8;
                image_xscale *= 0.8;
            }
        }
    }
    if (t >= 18)
        instance_destroy();
}
if (explode == 0 && speed != 0)
{
    aft[maxaft] = scr_afterimage();
    aft[maxaft].image_yscale = 1.8;
    aft[maxaft].image_angle = image_angle;
    aft[maxaft].image_index = 4;
    aft[maxaft].image_speed = 0.5;
    aft[maxaft].image_alpha = image_alpha - 0.2;
    if (i_ex(obj_hammer_of_justice_enemy) && obj_hammer_of_justice_enemy.rudebusterhitcount == obj_hammer_of_justice_enemy.rudebusterhitcountmax)
        aft[maxaft].fadeSpeed = 0.08;
    maxaft += 1;
}
for (i = 0; i < maxaft; i += 1)
{
    with (aft[i])
    {
        image_yscale -= 0.1;
        if (image_yscale <= 0.1)
            instance_destroy();
    }
    if (explode == 1)
    {
        with (aft[i])
        {
            image_alpha -= 0.07;
            image_yscale *= 0.9;
            if (image_yscale <= 0.1)
                instance_destroy();
        }
    }
}
a += 1;
t += 1;
