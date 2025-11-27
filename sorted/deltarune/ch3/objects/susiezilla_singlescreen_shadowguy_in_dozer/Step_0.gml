depth = 10000 - y;
with (obj_susiezilla_gamecontroller)
{
    var sourcedude = other.id;
    if (gameover)
    {
        other.speed = 0;
        other.image_speed = 0;
        with (obj_script_delayed)
        {
            if (target == sourcedude)
                instance_destroy();
        }
        with (obj_lerpvar)
        {
            if (target == sourcedude)
                instance_destroy();
        }
        other.gameover = true;
        exit;
    }
}
if (state == states.dead)
    exit;
if (hitstop <= 0)
{
    if (state == states.approach)
    {
        dozing_speed = scr_approach(dozing_speed, 3, 0.1);
        if (abs(x - obj_susiezilla_statue.x) > 64)
        {
            x = scr_approach(x, obj_susiezilla_statue.x, dozing_speed);
        }
        else
        {
            x -= (40 * facing);
            with (obj_susiezilla_statue)
                take_hit(other.facing, other.damage, other.knockback);
        }
    }
    if (state == states.ram)
    {
        state_timer++;
        if (state_timer == 1)
            xanchor = x;
        if (state_timer)
        {
            if (state_timer == 1)
            {
                speed = -facing * 4;
                pushalong = 15;
            }
            if (state_timer <= 16)
                speed = scr_approach(speed, 0, 0.25);
            if (state_timer > 16 && state_timer < 24)
            {
                pushalong = 30;
                x += (facing * 10);
                knockback = 30;
            }
            if (state_timer < 24)
            {
                var explosion = instance_create(x - (17 * facing), y - 85, obj_marker_animateOnce);
                explosion.image_speed = 0.5;
                explosion.depth = depth + 5;
                explosion.sprite_index = spr_susiezilla_houseexplosion;
                explosion.speed = 3;
                explosion.direction = 90 + irandom_range(-15, 15);
                explosion.image_angle = irandom(360);
                explosion.image_xscale = 1;
                explosion.image_yscale = 1;
                scr_darksize(explosion);
            }
            if (state_timer == 24)
            {
                snd_play_pitch(snd_damage, 0.5);
                with (obj_susiezilla_statue)
                    take_hit(other.facing, other.damage, other.knockback);
                knockback = 10;
                pushalong = 15;
            }
            if (state_timer > 28)
            {
                x = scr_approach(x, xanchor, 1);
                if (abs(x - xanchor) == 0)
                    state_timer = -16;
            }
        }
    }
    if (blockable)
    {
        if (i_ex(obj_susiezilla_player))
        {
            temp_mask = obj_susiezilla_player.mask_index;
            obj_susiezilla_player.mask_index = spr_susiezilla_susie_dozer_mask;
        }
        if (!obj_susiezilla_player.invuln && obj_susiezilla_player.canmove)
        {
            if ((facing == 1 && (obj_susiezilla_player.x + 32) > (x + (28 * facing))) || (facing != 1 && (obj_susiezilla_player.x + 32) < (x + (28 * facing))))
            {
                if (collision_rectangle(x + (26 * facing), y - 32, x + (38 * facing), y + 12, obj_susiezilla_player, true, true))
                {
                    flash = 10;
                    snd_stop(snd_board_door_close);
                    snd_stop(snd_metal_hit);
                    snd_play_x(snd_board_door_close, 1, 1);
                    snd_play_x(snd_metal_hit, 1, 1);
                    with (obj_susiezilla_player)
                    {
                        if (dashcon != 2)
                        {
                            take_hit(max(other.facing, 0), other.damage, other.knockback);
                        }
                        else
                        {
                            if (other.facing == 1)
                            {
                                x += 10;
                                hspeed = max(-hspeed * 0.75, other.pushalong);
                            }
                            if (other.facing == -1)
                            {
                                x -= 10;
                                hspeed = min(-hspeed * 0.75, -other.pushalong);
                            }
                        }
                    }
                }
            }
        }
        if (i_ex(obj_susiezilla_player))
            obj_susiezilla_player.mask_index = temp_mask;
    }
    hitdir = direction;
    hitspeed = speed;
    myxcenter = x;
    myycenter = y;
}
