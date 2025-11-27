with (obj_susiezilla_gamecontroller)
{
    if (gameover)
        exit;
}
if (state != states.dead && state != states.hurt && ropeheight == 0)
{
    var _hit = other.id;
    if (_hit.hitactive)
    {
        snd_stop(snd_punchmed);
        snd_play(snd_punchmed);
        hp--;
        with (obj_susiezilla_gamecontroller)
        {
            spamton_hit = true;
            ending_type = 1;
        }
        scr_susiezilla_hiteffect(_hit);
        var spawny = offset_index[hurt_index] * 7;
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
                h_speed = (sign(facing) * 2) + random(10);
                v_speed = -4 - random(8);
                ground = other.y;
            }
        }
        with (obj_susiezilla_laser_segment)
            instance_destroy();
        if (!hp)
        {
            image_index = 0;
            image_speed = 0;
            state = states.dead;
            state_timer = 0;
            mask_index = spr_nomask;
            with (obj_susiezilla_singlescreen_hud_score)
                score_change(other.value);
            with (obj_susiezilla_singlescreen_shadowguy_parent)
            {
                if (id != other.id)
                {
                    if (object_index != obj_susiezilla_singlescreen_shadowguy_in_dozer)
                        instant_defeat();
                    else
                        instant_defeat_dozer();
                }
            }
            with (obj_susiezilla_gamecontroller)
            {
                resolve_this = true;
                with (obj_script_delayed)
                {
                    if (target == other.id)
                        instance_destroy();
                }
                loss_counter = 0;
                enemy_count = 1;
            }
            snd_play(snd_splat);
            _hit.direction = 0;
            _hit.speed = 24;
            _hit.accel = 0;
            with (obj_susiezilla_gamecontroller)
            {
                check_enemies();
                mus_fade(global.currentsong[1], 60);
                var tetalk = stringsetloc("* PHEW!!! YOU GUYS SAVED TV!!! YOU HAVE WON!!!", "obj_susiezilla_singlescreen_shadowguy_laser_machine_slash_Collision_obj_susiezilla_player_gml_147_0");
                scr_script_delayed(scr_tennashouter, 60, tetalk, 90);
                with (obj_susiezilla_statue)
                {
                    if ((hp / maxhp) >= 0.95)
                    {
                        snd_play(snd_applause);
                        snd_play(snd_crowd_ooh);
                        instance_create_depth(clamp(obj_susiezilla_player.myxcenter, 160, room_width - 160), obj_susiezilla_player.y + 30, depth - 900000, obj_susiezilla_perfect_popularity);
                        with (obj_susiezilla_singlescreen_hud_score)
                            score_change(99);
                    }
                }
            }
        }
        else
        {
            state = states.hurt;
            hurt_timer = 0;
            shake = 4;
            flash = 10;
            with (obj_susiezilla_gamecontroller)
                shake = 8;
            snd_play(snd_screenshake);
            image_xscale = 2.5;
            image_yscale = 1.5;
            hurt_counter++;
            if (hurt_counter == 3)
            {
                hurt_index++;
                hurt_counter = 0;
            }
            laser_offset = offset_index[hurt_index];
            sprite_index = spr_susiezilla_spamcannon;
            image_index = hurt_index;
            image_speed = 0;
            _hit.direction = 0;
            _hit.speed = 32;
            _hit.accel = 0;
        }
    }
}
