if (!i_ex(obj_heart))
{
    instance_destroy();
    exit;
}
if (redhammer)
{
    if (x < (camerax() - 30))
        instance_destroy();
    if (x > (camerax() + camerawidth() + 30))
        instance_destroy();
    if (y < (cameray() - 30))
        instance_destroy();
    if (y > (cameray() + cameraheight() + 30))
        instance_destroy();
}
if (!i_ex(obj_spearblocker))
    exit;
debug_message(string(id) + "is calling event user zero");
var shielddir = obj_spearblocker.image_angle + 180;
if (shielddir >= 360)
    shielddir -= 360;
var breakshield = false;
var shieldradius, shieldlength;
if (obj_spearblocker.diagonal_enabled == false)
{
    shieldlength = 50;
    shieldradius = 36;
}
if (obj_spearblocker.diagonal_enabled == true)
{
    shieldlength = 30;
    shieldradius = 46;
}
longnotebeingheld = false;
var parryradius = shieldradius;
if (bouncespear == 1 && hp == 1)
    shieldradius -= 30;
if (bouncespear == 2 && bouncespearcon == 2 && sprite_index == spr_bounce_shell_hit_center)
    shieldradius += 10;
if (longspear == 1 && obj_spearblocker.diagonal_enabled == false)
    shieldradius += 5;
if (redhammer)
    shieldradius += 15;
var dontblockshell = false;
if (bouncespear == 1 && (len > 36 || distance_to_point(obj_heart.x + 10, obj_heart.y + 10) > 36))
    dontblockshell = true;
if (bouncespear == 2 && (len > 46 || distance_to_point(obj_heart.x + 10, obj_heart.y + 10) > 46))
    dontblockshell = true;
if (bouncespear > 0 && (shakeduration > 0 || (bouncespearcon == 2 && fakespeed < 0)))
    dontblockshell = true;
if (len < shieldradius && dontblockshell == false && ((abs(angle_difference(image_angle, shielddir)) < shieldlength && bouncespear != 2) || (abs(angle_difference(direction, shielddir)) < shieldlength && bouncespear == 2)))
{
    if (redhammer == 1)
    {
        breakshield = true;
    }
    else if (longspear == 1)
    {
        longnotebeingheld = true;
        len = shieldradius;
        x = obj_spearblocker.x + lengthdir_x(len, direction + 180);
        y = obj_spearblocker.y + lengthdir_y(len, direction + 180);
        exit;
    }
    else
    {
        if (i_ex(obj_sound_of_justice_enemy))
        {
            if (image_angle == 0)
                snd_play(snd_soundbattle_leftblock);
            if (image_angle == 270)
                snd_play(snd_soundbattle_upblock);
            if (image_angle == 180)
                snd_play(snd_soundbattle_rightblock);
            if (image_angle == 90)
                snd_play(snd_soundbattle_downblock);
        }
        if (obj_spearblocker.just > 0)
        {
            if (i_ex(obj_sound_of_justice_enemy))
                scr_tensionheal(2.5);
            else
                scr_tensionheal(2.5);
            var xx = 0;
            var yy = 0;
            if (image_angle == 0)
            {
                xx = -68;
                yy -= 35;
            }
            if (image_angle == 90)
                yy = 32;
            if (image_angle == 180)
            {
                xx = 68;
                yy -= 35;
            }
            if (image_angle == 270)
                yy = -64;
            if (image_angle == 35 || image_angle == 45)
            {
                xx = -63;
                yy = 17;
            }
            if (image_angle == 135 || image_angle == 135)
            {
                xx = 53;
                yy = 24;
            }
            if (image_angle == 215 || image_angle == 225)
            {
                xx = 65;
                yy = -49;
            }
            if (image_angle == 305 || image_angle == 315)
            {
                xx = -56;
                yy = -56;
            }
            if (bouncespear > 0 && hp > 1)
            {
                if (i_ex(obj_sound_of_justice_enemy))
                    snd_play_x(snd_parry_fast_nodelay, 0.4, 1);
                else
                    snd_play(snd_parry_fast_nodelay);
                obj_spearblocker.parryflashtimer = 6;
                spinindex = 0;
            }
            else
            {
                snd_play(snd_bell_bounce_short);
            }
            obj_spearblocker.justflash = 1.8;
            with (obj_spearblocker)
                event_user(1);
        }
        else
        {
            scr_tensionheal(1.25);
            if (giant == 0)
            {
                if (i_ex(obj_sound_of_justice_enemy))
                    snd_play_x(snd_bell, 0.4, 1);
                else
                    snd_play(snd_bell);
            }
        }
        with (obj_spearblocker)
        {
            image_angle = idealdir;
            bullethitid = other;
            event_user(0);
        }
        if (bouncespear > 0 && hp > 1)
        {
            x3 = 0;
            if (shakeduration != 5)
                hp--;
            bouncespearcon = 1;
            savedir = direction;
            sprite_index = spr_bounce_shell_squish;
            if (bouncespear == 1)
                sprite_index = spr_bounce_shell_squish2;
            image_angle = direction;
            image_index = 1;
            len = parryradius - 5;
            if (bouncespear == 1)
                len = parryradius - 12;
            if (bouncespear == 2)
                len = parryradius - 12;
            x = obj_spearblocker.x + lengthdir_x(len, direction + 180);
            y = obj_spearblocker.y + lengthdir_y(len, direction + 180);
            bouncespeartimer = 0;
            shakeduration = 5;
            hitstopbounce = 1;
        }
        else
        {
            if (bouncespear == 2)
            {
                len = parryradius - 10;
                len = parryradius - 10;
                x = obj_spearblocker.x + lengthdir_x(len, direction + 180);
                y = obj_spearblocker.y + lengthdir_y(len, direction + 180);
                var scale = 0.75;
                if (gigashell == true)
                    scale = 1;
                anim = instance_create(x, y, obj_gerson_animation);
                anim.sprite_index = spr_bounce_shell_idle;
                anim.spinindex = spinindex - 0.5;
                anim.image_xscale = scale;
                anim.image_yscale = scale;
                anim.image_angle = point_direction(x, y, obj_heart.x + 10, obj_heart.y + 10);
                anim.image_speed = 60;
            }
            if (breakshield == 1)
                event_user(1);
            instance_destroy();
        }
        exit;
    }
}
var heartcollisionlen = 16;
if (bouncespear > 0)
    heartcollisionlen = 2;
if (bouncespearcon == 2 && sprite_index != spr_bounce_shell_hit_center)
    heartcollisionlen -= 10;
if (bouncespear == 2)
    heartcollisionlen += 14;
var hitheart = false;
if (len < heartcollisionlen)
{
    var a = (global.hp[2] - 30) / 250;
    if (a < 0)
        a = 0;
    damage = lerp(12, 90, a);
    if (i_ex(obj_sound_of_justice_enemy))
    {
        target = 4;
        damage = 67;
    }
    if (redhammer)
    {
        breakshield = true;
        hitheart = true;
        global.inv = -1;
        scr_damage();
    }
    else
    {
        scr_damage();
        if (bouncespear > 0)
        {
            x3 = 0;
            hp = 0;
            bouncespearcon = 1;
            savedir = direction;
            sprite_index = spr_bounce_shell_squish;
            if (bouncespear == 1)
                sprite_index = spr_bounce_shell_squish2;
            image_angle = direction;
            image_index = 1;
            len = parryradius - 5;
            if (bouncespear == 1)
                len = parryradius - 40;
            if (bouncespear == 2)
                len = parryradius - 40;
            if (i_ex(obj_spearblocker))
                x = obj_spearblocker.x + lengthdir_x(len, direction + 180);
            if (i_ex(obj_spearblocker))
                y = obj_spearblocker.y + lengthdir_y(len, direction + 180);
            bouncespeartimer = 0;
            shakeduration = 5;
            hitstopbounce = 1;
            hurtsquish = true;
        }
        if ((bouncespear > 0 && hp < 1) || bouncespear == 0)
        {
            if (breakshield == 1)
                event_user(1);
            instance_destroy();
        }
    }
}
if (breakshield == true)
{
    with (obj_heart)
    {
        anim = instance_create(x + 10, y + 10, obj_animation);
        anim.sprite_index = spr_finisher_explosion;
        anim.image_speed = 0.5;
        anim.image_index = 0;
        anim.image_xscale = 1;
        anim.image_yscale = 1;
        color = c_black;
        sprite_index = spr_heart;
        inst = instance_create(obj_heart.x, obj_heart.y, obj_gerson_fakeheart);
        if (other.image_angle == 0)
            inst.directionhit = 0;
        if (other.image_angle == 90)
            inst.directionhit = 90;
        if (other.image_angle == 180)
            inst.directionhit = 180;
        if (other.image_angle == 270)
            inst.directionhit = 270;
        inst.speed = 12;
        inst.friction = 0.6;
        if (hitheart == true)
        {
            with (obj_event_manager)
                trigger_event(UnknownEnum.Value_1);
        }
    }
    with (obj_spearblocker)
    {
        snd_play(snd_queen_punched_lower_heavy);
        piece1 = instance_create(x + lengthdir_x(32, image_angle - 35), y + lengthdir_y(32, image_angle - 35), obj_spearblocker_piece);
        piece1.image_angle = image_angle;
        piece1.image_index = 1;
        piece2 = instance_create(x + lengthdir_x(32, image_angle + 35), y + lengthdir_y(32, image_angle + 35), obj_spearblocker_piece);
        piece2.image_angle = image_angle;
        piece2.image_index = 0;
        piece3 = instance_create(x + lengthdir_x(30, 45), y + lengthdir_y(30, 45), obj_spearblocker_piece);
        piece3.sprite_index = spr_green_circle_piece;
        piece3.image_angle = 0;
        piece4 = instance_create(x + lengthdir_x(30, 135), y + lengthdir_y(30, 135), obj_spearblocker_piece);
        piece4.sprite_index = spr_green_circle_piece;
        piece4.image_angle = 90;
        piece5 = instance_create(x + lengthdir_x(30, 225), y + lengthdir_y(30, 225), obj_spearblocker_piece);
        piece5.sprite_index = spr_green_circle_piece;
        piece5.image_angle = 180;
        piece6 = instance_create(x + lengthdir_x(30, 315), y + lengthdir_y(30, 315), obj_spearblocker_piece);
        piece6.sprite_index = spr_green_circle_piece;
        piece6.image_angle = 270;
        if (other.image_angle == 0)
        {
            piece1.vspeed = -9 - random(6);
            piece1.hspeed = 4 + random(2);
            piece2.vspeed = 5 + random(6);
            piece2.hspeed = 4 + random(2);
            piece3.vspeed = -9 - random(6);
            piece3.hspeed = 4 + random(2);
            piece4.vspeed = -9 - random(6);
            piece4.hspeed = 4 + random(2);
            piece5.vspeed = 5 + random(6);
            piece5.hspeed = 4 + random(2);
            piece6.vspeed = 5 + random(6);
            piece6.hspeed = 4 + random(2);
        }
        if (other.image_angle == 180)
        {
            piece1.vspeed = -9 - random(6);
            piece1.hspeed = -4 - random(2);
            piece2.vspeed = 5 + random(6);
            piece2.hspeed = -4 - random(2);
            piece3.vspeed = -9 - random(6);
            piece3.hspeed = -4 - random(2);
            piece4.vspeed = -9 - random(6);
            piece4.hspeed = -4 - random(2);
            piece5.vspeed = 5 + random(6);
            piece5.hspeed = -4 - random(2);
            piece6.vspeed = 5 + random(6);
            piece6.hspeed = -4 - random(2);
        }
        if (other.image_angle == 270)
        {
            piece1.vspeed = 1 - random(6);
            piece1.hspeed = 7 + random(4);
            piece2.vspeed = 1 - random(6);
            piece2.hspeed = -7 - random(4);
            piece3.vspeed = 1 + random(6);
            piece3.hspeed = 7 + random(4);
            piece4.vspeed = 1 + random(6);
            piece4.hspeed = -7 - random(4);
            piece5.vspeed = 1 - random(6);
            piece5.hspeed = -7 - random(4);
            piece6.vspeed = 1 - random(6);
            piece6.hspeed = 7 + random(4);
        }
        if (other.image_angle == 90)
        {
            piece1.vspeed = -9 - random(3);
            piece1.hspeed = 7 + random(2);
            piece2.vspeed = -9 - random(3);
            piece2.hspeed = -7 + random(2);
            piece3.vspeed = -9 - random(3);
            piece3.hspeed = 7 + random(2);
            piece4.vspeed = -9 - random(3);
            piece4.hspeed = -7 + random(2);
            piece5.vspeed = -9 - random(3);
            piece5.hspeed = -7 + random(2);
            piece6.vspeed = -9 - random(3);
            piece6.hspeed = 7 + random(2);
        }
        with (obj_heart)
        {
            color = c_black;
            sprite_index = spr_heart;
        }
        instance_create(x, y, obj_shake);
        instance_destroy();
    }
}

enum UnknownEnum
{
    Value_1 = 1
}
