if (!slide)
{
    px = 0;
    py = 0;
}
if (scr_debug() && keyboard_check_pressed(ord("P")) && height == 0)
    event_user(2);
if ((fall_speed != 0 || height > 0) && suplexCon == 0)
{
    height -= fall_speed;
    fall_speed += 1;
    if (height <= 0)
    {
        height = 0;
        if (bounce_count < 1)
        {
            fall_speed *= -0.5;
        }
        else
        {
            event_user(1);
            fall_speed = 0;
        }
        var _shake = instance_create(x, y, obj_shake);
        _shake.shakex = 0;
        if (bounce_count > 0)
            _shake.shakey = 2;
        bounce_count++;
        snd_play(snd_screenshake);
    }
}
if (hitstun > 0)
{
    hitstun--;
    exit;
}
var zombie_latched = false;
for (var i = 0; i < instance_number(obj_susiezilla_zombie); i++)
{
    zombie[i] = instance_find(obj_susiezilla_zombie, i);
    if (zombie[i].attackcon == 2 && zombie[i].hurtCon == 0)
        zombie_latched = true;
}
if (dashCon == 2)
{
    dashdusttimer++;
    if (dashdusttimer >= 5)
    {
        dashdusttimer = 0;
        repeat (2)
        {
            if (image_xscale > 0)
            {
                effect = instance_create(x - 5 - 14, y - 16, obj_house_placed_effect);
                effect.image_xscale = 1;
                effect.image_yscale = 1;
                effect.index_speed = 0.15;
            }
            else
            {
                effect = instance_create((x + 25) - 14, y - 16, obj_house_placed_effect);
                effect.image_xscale = 1;
                effect.image_yscale = 1;
                effect.index_speed = 0.15;
            }
        }
    }
}
allowinput = cancontrol == 1 && hurtcon == 0 && tailattackcon == 0 && hitstun == 0 && suplexCon != 1;
if (allowinput && init == 1)
{
    if (!slide)
    {
        if (down_h() && zombie_latched == false)
            py = wspeed / 2;
        if (right_h() && zombie_latched == false)
        {
            px = wspeed;
            if (suplexCon == 0)
                image_xscale = 2;
        }
        if (left_h() && zombie_latched == false)
        {
            px = -wspeed;
            if (suplexCon == 0)
                image_xscale = -2;
        }
        if (up_h() && zombie_latched == false)
            py = -wspeed / 2;
    }
    if (suplexCon > 0)
    {
        py *= (2/3);
        px *= (2/3);
    }
    else
    {
        if (button1_p())
            buffer_z = 2;
        if (!xcancel && button2_h())
            buffer_x = 2;
        else if (xcancel && !button2_h())
            xcancel = false;
        if (px != 0 && buffer_x > 0)
        {
            if (dashCon == 0 && dashTimer == 0)
            {
                dashCon = 1;
                dashDir = sign(px);
            }
            if (dashCon < 2)
            {
                dashTimer++;
                if (dashTimer == 4)
                {
                    dashTimer = 0;
                    dashCon = 2;
                    var _dash = instance_create(x, y, obj_animation);
                    _dash.sprite_index = spr_susiezilla_dashdust;
                    _dash.depth = depth - 1;
                    _dash.image_xscale = -image_xscale;
                    _dash.image_yscale = 2;
                    snd_play_pitch(snd_smallswing, 1.3);
                }
            }
            if (dashDir != 0 && sign(px) != dashDir)
            {
                dashCon = 1;
                dashTimer = 0;
            }
            dashDir = sign(px);
            if (dashCon == 2)
                px *= 1.5;
            else if (dashCon == 1)
                px *= 0.5;
        }
        if (px == 0 && (dashCon > 0 || dashTimer > 0))
        {
            dashDir = 0;
            dashTimer = 0;
            dashCon = 0;
        }
    }
}
if (px != 0 || py != 0)
{
    xmeet = 0;
    ymeet = 0;
    xymeet = 0;
    x += px;
    y += py;
    if (suplexCon == 0)
    {
        if (x < camerax())
            x = camerax();
        if (x > (camerax() + 640))
            x = camerax() + 640;
        if (y < 210)
            y = 210;
        if (y > 350)
            y = 350;
    }
}
if (allowinput && !slide && suplexCon == 0)
{
    if (abs(px) > 0 || abs(py) > 0)
    {
        if (sprite_index != spr_susiezilla_walk)
            image_index = 0;
        sprite_index = spr_susiezilla_walk;
        if (dashCon == 2)
            image_index += 0.495;
        else if (dashCon == 1)
            image_index += 0.11;
        else
            image_index += 0.33;
    }
    else if (sprite_index == spr_susiezilla_walk)
    {
        sprite_index = spr_susiezilla_idle;
    }
}
if (buffer_z > 0 && hurtcon == 0 && tailattackcon == 0 && suplexCon == 0)
{
    var _inst = -4;
    var _faceDirection = sign(image_xscale);
    if (py < 0)
        _inst = collision_rectangle(x, y - 20, x + (_faceDirection * 40), y + 2, obj_susiezilla_shadowguy, false, true);
    if (dashCon == 2)
    {
        tailattackcon = 11;
        slide = true;
        dashCon = 0;
        xcancel = true;
    }
    else if (_inst != -4 && _inst.hp > 0)
    {
        with (_inst)
            event_user(2);
        suplexCon = 1;
        snd_play(snd_grab);
    }
    else
    {
        tailattackcon = 1;
    }
}
if (suplexCon > 0)
{
    invinciblecon = 1;
    timer++;
    if (suplexCon == 1)
    {
        sprite_index = spr_susiezilla_suplex;
        image_speed = 0;
        image_index = 0;
        if (timer >= 10)
        {
            timer = 0;
            suplexCon++;
            snd_play(snd_jump);
        }
    }
    else if (suplexCon == 2)
    {
        image_index = 1;
        height = scr_ease_out(timer / 15, 3) * 140;
        if (timer >= 15)
        {
            timer = 0;
            suplexCon++;
        }
    }
    else if (suplexCon == 3)
    {
        image_index = 2;
        height = scr_ease_out(1 - (timer / 15), 3) * 140;
        if (timer >= 15)
        {
            invincibilitytimer = -20;
            event_user(1);
            px = sign(image_xscale) * -2;
            slide = true;
            fall_speed = -6;
            bounce_count = 1;
            scr_bounce_land(2);
            var _shake = instance_create(x, y, obj_shake);
            _shake.shakex = 0;
            _shake.shakey = 6;
            snd_play(snd_screenshake);
        }
    }
}
if (tailattackcon > 0)
{
    if (tailattackcon == 1)
    {
        snd_play_pitch(snd_motor_upper_quick, 1 + random(0.3));
        sprite_index = spr_susiezilla_tail;
        image_index = 0;
        slide = false;
        tail_hitbox = instance_create(x, y, obj_susiezilla_player_hitbox);
        tail_hitbox.image_xscale = image_xscale;
        tail_hitbox.image_yscale = image_yscale;
        tail_hitbox.sprite_index = spr_susiezilla_tail_hitbox;
        tail_hitbox.image_index = 0;
        tail_hitbox.image_speed = 0.5;
        tail_hitbox.image_blend = c_red;
        tail_hitbox.depth = depth - 1;
        tail_hitbox.visible = false;
        tail_hitbox.timer = 4;
        tailattackcon = 2;
    }
    if (tailattackcon == 2)
    {
        tailattacktimer++;
        if (tailattacktimer == 3)
            image_index = 1;
        if (tailattacktimer >= 8)
            event_user(1);
    }
    if (tailattackcon == 11)
    {
        snd_play_pitch(snd_motor_upper_quick, 0.8 - random(0.3));
        sprite_index = spr_susiezilla_tail;
        image_index = 0;
        tail_hitbox = instance_create(x, y, obj_susiezilla_player_hitbox);
        tail_hitbox.image_xscale = image_xscale;
        tail_hitbox.image_yscale = image_yscale + 1;
        tail_hitbox.sprite_index = spr_susiezilla_tail_hitbox;
        tail_hitbox.image_index = 0;
        tail_hitbox.image_speed = 0.5;
        tail_hitbox.image_blend = c_red;
        tail_hitbox.depth = depth - 1;
        tail_hitbox.visible = false;
        tail_hitbox.timer = 14;
        tail_hitbox.slideAttack = true;
        tailattackcon = 12;
    }
}
if (tailattackcon == 12 && hitstun == 0)
{
    tailattacktimer++;
    if (tailattacktimer == 3)
        image_index = 1;
    if (tailattacktimer == 6)
    {
        px = scr_movetowards(px, 0, 3);
        py = scr_movetowards(py, 0, 1.5);
    }
    if (tailattacktimer == 12)
    {
        px = scr_movetowards(px, 0, 3);
        py = scr_movetowards(py, 0, 1.5);
        xcancel = true;
    }
    if (tailattacktimer >= 18)
        event_user(1);
}
if (hurtcon > 0)
{
    hurttimer += 1;
    if (hurttimer >= hurt_length && fall_speed == 0 && height <= 0)
    {
        px = 0;
        event_user(1);
    }
}
if (turncon > 0 && hurtcon == 0 && tailattackcon == 0)
{
    turntimer += 1;
    if (turntimer >= 4)
    {
        sprite_index = spr_susiezilla_idle;
        if (image_xscale > 0)
            image_xscale = -2;
        else
            image_xscale = 2;
        event_user(1);
    }
}
invincibilitytimer += 1;
if (invincibilitytimer >= 0 && invinciblecon == 1)
    invinciblecon = 0;
if (invinciblecon == 1 && visible == true)
    visible = false;
else
    visible = true;
buffer_z -= 1;
buffer_x -= 1;
buffer_u -= 1;
buffer_d -= 1;
buffer_r -= 1;
buffer_l -= 1;
if (stumbler > 0)
    stumbler--;
init = 1;
