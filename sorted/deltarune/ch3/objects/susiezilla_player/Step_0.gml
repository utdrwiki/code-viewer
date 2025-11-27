controlmode = 0;
if (i_ex(obj_tenna_enemy) && tennainit == false)
{
    visible = true;
    tennainit = true;
}
depth = 10000 - (y + 84);
if (i_ex(obj_tenna_enemy))
    depth = 1000 - (y + 84);
with (obj_susiezilla_gamecontroller)
{
    var sourcedude = other.id;
    if (gameover)
    {
        other.speed = 0;
        other.image_speed = 0;
        other.accel = 0;
        lx = 0;
        rx = 1280;
        shakeval = 0;
        with (obj_susiezilla_gamecontroller)
        {
            lx = xorig;
            rx = xorig + width;
            shakeval = shake;
        }
        camerax_set(clamp(scr_approach(camerax(), obj_susiezilla_statue.x - 320, abs(camerax() - (obj_susiezilla_statue.x - 320)) * 0.1), lx, rx - 640) + random_range(-shakeval, shakeval));
        cameray_set(random_range(-shakeval, shakeval));
        exit;
    }
}
accel = 0.8;
maxspeed = lerp(maxspeed, 16, 0.25);
attack1thresh = 4;
attack2thresh = 10;
if (hitstop <= 0)
{
    friction = 0.2;
    if (dashcon <= 0 && canmove >= 0)
    {
        if (facing == 0)
        {
            if (hspeed > 2)
                sprite_index = s_forward;
            else if (hspeed < -2)
                sprite_index = s_backward;
            else
                sprite_index = s_idle;
        }
        else if (hspeed > 2)
        {
            sprite_index = s_backward;
        }
        else if (hspeed < -2)
        {
            sprite_index = s_forward;
        }
        else
        {
            sprite_index = s_idle;
        }
    }
    if (dashcon == 1)
    {
        if (controlmode == 0)
        {
            var slowdownVersion = false;
            if (slowdownVersion == true)
            {
                accel *= 0.7;
                maxspeed *= 0.7;
            }
            dashtimer++;
            sprite_index = s_prepare;
            image_index = 0;
            if (dashtimer == 1)
                snd_play_x(snd_motor_swing_down, 0.8, 1.2);
            if (dashtimer == 9)
                snd_stop(snd_motor_swing_down);
            if (dashtimer >= 10)
            {
                hitactive = true;
                dashcon = 2;
                dashtimer = 0;
            }
        }
    }
    if (dashcon == 2)
    {
        if (controlmode == 0)
        {
            dashtimer++;
            accel = 4 - (dashtimer / 5);
            maxspeed = 32 - dashtimer;
            image_speed = 0.5;
            sprite_index = s_attack;
            if (i_ex(obj_tenna_enemy) && obj_tenna_enemy.con > 1)
            {
            }
            if ((dashtimer % 3) == 1)
            {
                i = 0;
                dust = scr_dark_marker(x + (sprite_width / 2), y + sprite_height, spr_dust1);
                dust.depth = depth + 10;
                dust.vspeed = -4 - irandom(2) - (abs(hspeed) / 4);
                dust.gravity = 0.5;
                dust.image_speed = 0.5;
                dust.image_xscale = 2 + random_range(-0.2, 0);
                dust.image_xscale = dust.image_yscale;
                scr_doom(dust, 10);
                dust.hspeed = -4 + (i * 2) + (hspeed / 8);
                dust.friction = 0.85;
                snd_stop(snd_motor_upper_2);
                snd_play_x(snd_motor_upper_2, 1, 1 + (dashtimer / 45) + random(0.1));
            }
            if (dashtimer >= 14)
                sprite_index = s_postattack;
            if (dashtimer >= 15)
            {
                hitactive = false;
                dashtimer = 0;
                dashcon = 3;
            }
        }
    }
    if (dashcon == 3)
    {
        dashtimer++;
        sprite_index = s_postattack;
        image_speed = 0;
        if (dashtimer >= recoverytime)
        {
            dashtimer = 0;
            dashcon = 0;
        }
    }
    canmove++;
    invuln = scr_approach(invuln, 0, 1);
    if (canmove == 0)
    {
        image_speed = 0;
        invuln = 40;
    }
    if (visible && !alarm[1])
    {
        if (canmove)
        {
            if (left_h())
            {
                hspeed -= accel;
                facing = 1;
                if (hspeed > 0)
                    hspeed -= 0.2;
            }
            if (right_h())
            {
                hspeed += accel;
                facing = 0;
                if (hspeed < 0)
                    hspeed += 0.2;
            }
            if (up_h())
            {
                vspeed -= (accel / 1.5);
                if (vspeed > 0)
                    vspeed -= 0.1;
            }
            if (down_h())
            {
                vspeed += (accel / 1.5);
                if (vspeed < 0)
                    vspeed += 0.1;
            }
            button1buffer--;
            if (button1_p())
                button1buffer = 10;
            if (controlmode == 0)
            {
                if (button1buffer && dashcon == 0)
                {
                    dashcon = 1;
                    dashtimer = 0;
                }
            }
        }
    }
    var clampmode = 1;
    if (clampmode == 0)
    {
        vspeed = clamp(vspeed, -maxspeed / 2, maxspeed / 2);
        hspeed = clamp(hspeed, -maxspeed, maxspeed);
    }
    if (clampmode == 1)
    {
        vspeed = clamp(vspeed, -maxspeed / 2, maxspeed / 2);
        hspeed = clamp(hspeed, -maxspeed, maxspeed);
        speed = clamp(speed, -maxspeed, maxspeed);
    }
    lx = 0;
    rx = 1280;
    with (obj_susiezilla_gamecontroller)
    {
        lx = xorig;
        rx = xorig + width;
    }
    if ((hspeed > 0 && x > (rx - 80)) || (hspeed < 0 && x < (lx + 20)))
        hspeed = -(hspeed * 0.75);
    if ((vspeed > 0 && y > 270) || (vspeed < 0 && y < 108))
        vspeed = -(vspeed * 0.65);
}
if (canmove < 0)
{
    dashcon = 0;
    if (alarm[0])
    {
        image_speed = 0.5;
        sprite_index = s_attack;
    }
    else
    {
        image_speed = 0.25;
        sprite_index = s_hurt;
    }
}
hitstop--;
if (hitstop == 0)
{
    hitstop = -1;
    direction = memdir;
    image_blend = c_white;
    hspeed = memhspeed;
    vspeed = memvspeed;
    speed = memspeed;
    maxspeed = memmaxspeed;
    accel = memaccel;
    image_speed = memimagespeed;
}
myxcenter = x + 32;
myycenter = y + 40;
oldxcenter = xprevious + 32;
oldycenter = yprevious + 40;
var lx = 0;
var rx = 1280;
var shakeval = 0;
with (obj_susiezilla_gamecontroller)
{
    lx = xorig;
    rx = xorig + width;
    shakeval = shake;
}
if (!instance_exists(obj_susiezilla_pan_object))
{
    camerax_set(clamp(myxcenter - 320, lx, rx - 640) + random_range(-shakeval, shakeval));
    cameray_set(random_range(-shakeval, shakeval));
}
with (obj_susiezilla_singlescreen_hud_element)
{
    var myx = camerax() + xoff;
    timer++;
    cur_movespeed = scr_approach(cur_movespeed, movespeed, 0.0075);
    if (abs(x - myx) > 0.1)
        x = scr_approach(x, myx, clamp(abs(x - myx) * cur_movespeed, 0, 64));
}
with (obj_susiezilla_singlescreen_hud_tenna)
{
    with (obj_writer)
        depth = -99;
    var jump = abs(x - xprevious) * 0.125;
    var oof = x - (camerax() + xoff);
    var ooof = -abs(sin(timer * 0.5) * jump * 2);
    with (obj_ch3_tennashouter_alt)
    {
        txoff = 33 + oof;
        tyoff = -5 + ooof;
        textxoff = 18 + oof;
        textyoff = -10 + ooof;
    }
}
