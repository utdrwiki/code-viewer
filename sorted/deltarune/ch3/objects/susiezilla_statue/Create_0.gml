event_inherited();
tennainit = false;
if (i_ex(obj_tenna_enemy))
    visible = false;
shake = 0;
polarity = 1;
flash = 0;
healflash = 0;
damage_cooldown = 0;
tv_is_forever = false;
maxhp = 200;
hp = maxhp;
target = 0;
damage = 0;
scr_darksize();

take_hit = function(arg0, arg1, arg2)
{
    if (i_ex(obj_tenna_enemy) && obj_tenna_enemy.con > 1)
        exit;
    shake += 1;
    shake = max(shake, 3);
    flash = 10;
    if (damage_cooldown)
        arg1 *= 0.5;
    if (i_ex(obj_tenna_enemy) && !damage_cooldown)
    {
        global.inv = -1;
        obj_tenna_enemy.minigamefailcount++;
        if (obj_tenna_enemy.minigamefailcount > 2 && obj_tenna_zoom.con != 2 && obj_tenna_zoom.minigameinsanity == false)
        {
            with (obj_tenna_zoom)
            {
                con = 2;
                timer = -30;
            }
        }
    }
    var timeout = false;
    with (obj_susiezilla_gamecontroller)
    {
        if (!time_timer)
            timeout = true;
    }
    if (!damage_cooldown)
        damage_cooldown = 40;
    snd_stop(snd_damage);
    snd_play(snd_damage);
    if (hp == 0)
        exit;
    var godmode = false;
    with (obj_susiezilla_gamecontroller)
    {
        if (loss_counter >= 9)
            godmode = true;
    }
    if (tv_is_forever)
        godmode = true;
    if (!timeout)
    {
        if (!godmode)
        {
            hp = scr_approach(hp, 0, max(1, floor(arg1 * 0.5), floor(arg1 * (hp / maxhp))));
        }
        else
        {
        }
    }
    if (hp == 0)
    {
        if (obj_susiezilla_gamecontroller.mode == 0)
        {
            snd_play_pitch(snd_explosion, 0.5);
            with (obj_susiezilla_gamecontroller)
                gameover = true;
            with (obj_susiezilla_singlescreen_hazard)
                speed = 0;
            with (obj_susiezilla_gamecontroller)
            {
                with (obj_script_delayed)
                {
                    if (target == other.id)
                        instance_destroy();
                }
            }
            safe_delete(obj_ch3_tennashouter_alt);
            with (obj_script_delayed)
            {
                if (script == scr_tennashouter)
                    instance_destroy();
            }
        }
        else
        {
            mask_index = spr_nomask;
            snd_play_pitch(snd_explosion, 0.5);
            with (obj_susiezilla_gamecontroller)
            {
                if (time_timer)
                {
                    mode = -1;
                    finished = true;
                    other.alarm[0] = 20;
                }
            }
            with (obj_susiezilla_singlescreen_shadowguy_parent)
            {
                if (object_index != obj_susiezilla_singlescreen_kickboxin_tenna)
                    instant_defeat();
            }
            with (obj_susiezilla_singlescreen_hazard)
                bounce_off();
            if (obj_tenna_zoom.con != 2 && obj_tenna_zoom.minigameinsanity == false)
            {
                with (obj_tenna_zoom)
                {
                    con = 2;
                    timer = -30;
                }
            }
            with (instance_create_depth(x, y - 48, depth - 2, obj_dozer_parts))
            {
                var facing = x - other.x;
                immune = true;
                personal_gravity = 0.25;
                flash_start = 999;
                endme = 999;
                sprite_index = spr_susiezilla_ralsei_yeet;
                image_angle = 180;
                scr_lerpvar("image_angle", image_angle, image_angle - 480, 60);
                image_speed = 0;
                image_index = 0;
                image_xscale = 2;
                image_yscale = 2;
                h_speed = 6;
                v_speed = -10;
                ground = other.y;
            }
        }
    }
};
