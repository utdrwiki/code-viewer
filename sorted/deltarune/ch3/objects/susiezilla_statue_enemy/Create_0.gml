event_inherited();
shake = 0;
polarity = 1;
flash = 0;
damage_cooldown = 0;
maxhp = 8;
hp = maxhp;
scr_darksize();

take_hit = function()
{
    shake += 10;
    shake = max(shake, 10);
    flash = 10;
    with (obj_susiezilla_gamecontroller)
        shake = 16;
    hp = scr_approach(hp, 0, 1);
    image_xscale = 2.5;
    image_yscale = 1.75;
    repeat (2 + irandom(4))
    {
        with (instance_create_depth(x + ((10 + random(70)) * choose(-1, 1)), y - 24 - random(135), depth + choose(-1, 1), obj_dozer_parts))
        {
            var facing = x - other.x;
            sprite_index = spr_susiezilla_statue_chip;
            image_angle = irandom(360);
            scr_lerpvar("image_angle", image_angle, image_angle + ((90 + irandom(270)) * choose(-1, 1)), 30 + irandom(60));
            image_speed = 0;
            image_index = irandom(image_number - 1);
            image_xscale = 1 + (random(1.5) * choose(1, -1));
            image_yscale = image_xscale;
            h_speed = (sign(facing) * 2) + (random(10) * sign(facing));
            v_speed = -4 - random(8);
            ground = other.y;
        }
    }
    if (!damage_cooldown)
        damage_cooldown = 20;
    if (hp == 0)
    {
        mask_index = spr_nomask;
        snd_play_pitch(snd_explosion, 0.5);
        with (obj_susiezilla_gamecontroller)
        {
            mode = -1;
            if (time_timer && obj_tenna_zoom.con != 2 && obj_tenna_zoom.minigameinsanity == false)
            {
                finished = true;
                with (obj_tenna_zoom)
                {
                    con = 2;
                    timer = -30;
                }
            }
        }
        with (obj_susiezilla_singlescreen_shadowguy_parent)
        {
            if (object_index != obj_susiezilla_singlescreen_shadowguy_in_dozer)
                instant_defeat();
            else
                instant_defeat_dozer();
        }
        with (obj_susiezilla_singlescreen_hazard)
            bounce_off();
        with (obj_susiezilla_gamecontroller)
        {
            with (obj_script_delayed)
            {
                if (target == other.id)
                    instance_destroy();
            }
        }
    }
    snd_stop(snd_damage);
    snd_stop(snd_metal_hit_reverb);
    snd_play(snd_damage);
    snd_play_x(snd_metal_hit_reverb, 1, 0.9);
    with (obj_susiezilla_player)
    {
        direction = point_direction(other.x, other.y, myxcenter, y + 84);
        speed = max(32, speed);
    }
};
