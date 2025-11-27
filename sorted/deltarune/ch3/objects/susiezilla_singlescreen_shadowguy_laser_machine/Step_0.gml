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
shake *= 0.8;
if (shake < 0.5)
    shake = 0;
polarity *= -1;
image_xscale = scr_approach(image_xscale, 2, 0.05);
image_yscale = scr_approach(image_yscale, 2, 0.05);
if (state == states.dead)
{
    state_timer++;
    shake = 12 - (0.3 * state_timer);
    image_xscale = 2 + (state_timer * 0.05);
    image_yscale = 2 - (state_timer * 0.05);
    var spawny = offset_index[hurt_index] * 7;
    if ((state_timer % 5) == 0 && state_timer < 30)
    {
        repeat (2 + irandom(4))
        {
            with (instance_create_depth(x + 32 + ((10 + random(50)) * choose(-1, 1)), y - 24 - random(104 - spawny), depth + choose(-1, 1), obj_dozer_parts))
            {
                var facing = x - (other.x + 32);
                sprite_index = spr_susiezilla_spamcannon_chip;
                image_angle = irandom(360);
                scr_lerpvar("image_angle", image_angle, image_angle + ((90 + irandom(270)) * choose(-1, 1)), 30 + irandom(60));
                image_speed = 0;
                image_index = irandom(image_number - 1);
                image_xscale = 1 + (random(2) * choose(1, -1));
                image_yscale = image_xscale;
                h_speed = (sign(facing) * 2) + (random(10) * sign(facing));
                v_speed = -4 - random(8);
                ground = other.y;
            }
        }
    }
    if (state_timer == 40)
    {
        instance_destroy();
        exit;
    }
}
if (state == states.dead)
    exit;
laser_width = scr_approach(laser_width, laser_width_goal, abs(laser_width - laser_width_goal) * 0.35);
laser_wobble = laser_width - ((global.time % 3) * 0.1);
rxo = choose(-1, 0, 1);
ryo = choose(-1, 0, 1);
ra = clamp(ra + random_range(-2, 2), -10, 10);
if (hitstop <= 0)
{
    if (state == states.rope)
    {
        state_timer++;
        if (state_timer == 24)
        {
            state = states.charge;
            snd_play(snd_sneo_overpower);
            state_timer = 0;
            image_index = 2;
        }
    }
    if (state == states.charge)
    {
        var charge_val = 1;
        with (obj_susiezilla_gamecontroller)
        {
            if (loss_counter >= 9)
                charge_val *= (1 - (other.state_timer / other.max_charge));
        }
        if (hp == maxhp && state_timer >= (max_charge * 0.5))
            charge_val *= 0.5;
        state_timer += charge_val;
        with (obj_susiezilla_gamecontroller)
        {
            if (loss_counter >= 9)
            {
                if (other.state_timer > (other.max_charge - 0.2))
                    other.state_timer = other.max_charge - 0.2;
            }
        }
        sprite_index = charge_index[hurt_index];
        image_speed = 0.25 + (state_timer * 0.005);
        if ((global.time % 4) == 0)
        {
            with (instance_create_depth(x + 116 + 20 + random(20), (y - 44) + (laser_offset * 2) + random_range(-64, 64), depth - 1, obj_susiezilla_charge_ball))
            {
                goal_x = (other.x + 116) - 40;
                goal_y = (other.y - 44) + (other.laser_offset * 2);
            }
        }
        if (state_timer >= 210 && hp == maxhp && !tenna_panic)
        {
            tenna_panic = true;
            safe_delete(obj_ch3_tennashouter_alt);
            with (obj_script_delayed)
            {
                if (script == scr_tennashouter)
                    instance_destroy();
            }
            var tepanic = stringsetloc("* What the $*!? are you doing!? Kill him!!!!!", "obj_susiezilla_singlescreen_shadowguy_laser_machine_slash_Step_0_gml_150_0");
            scr_tennashouter(tepanic, 125);
        }
        if (state_timer == max_charge)
        {
            mask_index = spr_nomask;
            state = states.fire;
            state_timer = 0;
            image_index = 5;
            laser_width = 5;
            laser_width_goal = 2;
            with (obj_susiezilla_gamecontroller)
            {
                if (!spamton_hit)
                    resolve_this = true;
            }
            safe_delete(obj_ch3_tennashouter_alt);
            with (obj_script_delayed)
            {
                if (script == scr_tennashouter)
                    instance_destroy();
            }
            var tenooo = stringsetloc("* Nooooooo!!!!!!", "obj_susiezilla_singlescreen_shadowguy_laser_machine_slash_Step_0_gml_178_0");
            scr_tennashouter(tenooo, 125);
        }
    }
    if (state == states.fire)
    {
        state_timer++;
        image_index = 0;
        image_speed = 0;
        with (instance_create_depth(x + 116 + 20, (y - 44) + (laser_offset * 2), depth, obj_susiezilla_laser_segment))
        {
            direction = 0;
            var facing = other.facing;
            speed = 60;
            depth = other.depth;
            force_depth = other.depth;
        }
    }
    if (state == states.recharge)
    {
        state_timer++;
        if (state_timer == 32)
        {
            state = states.charge;
            state_timer = 0;
            image_index = 2;
        }
    }
    if (state == states.hurt)
    {
        hurt_timer++;
        if (hurt_timer == 20)
        {
            state = states.charge;
            snd_play(snd_sneo_overpower);
            state_timer = 0;
        }
    }
    hitdir = direction;
    hitspeed = speed;
    with (obj_susiezilla_laser_segment)
        image_yscale = other.laser_wobble;
}
