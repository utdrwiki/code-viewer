with (obj_susiezilla_gamecontroller)
{
    if (gameover)
        exit;
}
var temp_mask = -4;
if (i_ex(obj_susiezilla_player))
{
    temp_mask = obj_susiezilla_player.mask_index;
    obj_susiezilla_player.mask_index = spr_susiezilla_susie_dozer_mask;
}
var breakthrough = false;
if (facing && other.myxcenter < (x + 18))
    breakthrough = true;
if (!facing && other.myxcenter > (x - 18))
    breakthrough = true;
if (place_meeting(x, y, other.id))
{
    if (state != states.dead && ropeheight == 0 && breakthrough)
    {
        var _hit = other.id;
        if (_hit.hitactive)
        {
            snd_stop(snd_punchmed);
            snd_play(snd_punchmed);
            snd_play_x(snd_explosion_firework, 10, 1.25);
            snd_play_x(snd_metal_hit_reverb, 1, 0.5);
            with (_hit)
                event_user(0);
            sprite_index = spr_susiezilla_shadowguy_driver;
            image_index = 0;
            image_speed = 0;
            state = states.dead;
            state_timer = 0;
            blockable = false;
            flash = 0;
            scr_susiezilla_hiteffect(_hit);
            scr_lerpvar("ropeheight", 0, 16, 8, 1, "out");
            scr_script_delayed(scr_lerpvar, 8, "ropeheight", 16, -360, 24, 1, "in");
            scr_script_delayed(instance_destroy, 44);
            with (instance_create_depth(x - (34 * facing), y - 74, depth, obj_dozer_parts))
            {
                sprite_index = spr_susiezilla_dozer_pieces;
                image_index = 0;
                image_xscale *= other.facing;
                h_speed = -3 * other.facing;
                v_speed = -8;
                ground = other.y;
            }
            with (instance_create_depth(x + (34 * facing), y - 74, depth, obj_dozer_parts))
            {
                sprite_index = spr_susiezilla_dozer_pieces;
                image_index = 2;
                image_xscale *= other.facing;
                h_speed = 3 * other.facing;
                v_speed = -8;
                ground = other.y;
            }
            with (instance_create_depth(x - (34 * facing), y - 16, depth, obj_dozer_parts))
            {
                sprite_index = spr_susiezilla_dozer_pieces;
                image_index = 1;
                image_xscale *= other.facing;
                h_speed = -4 * other.facing;
                v_speed = -5;
                ground = other.y;
            }
            with (instance_create_depth(x + (34 * facing), y - 16, depth, obj_dozer_parts))
            {
                sprite_index = spr_susiezilla_dozer_pieces;
                image_index = 3;
                image_xscale *= other.facing;
                h_speed = 4 * other.facing;
                v_speed = -5;
                ground = other.y;
            }
            with (obj_susiezilla_gamecontroller)
                check_enemies();
            with (obj_susiezilla_singlescreen_hud_score)
                score_change(other.value);
        }
    }
}
myxcenter = x;
myycenter = y;
if (i_ex(obj_susiezilla_player))
    obj_susiezilla_player.mask_index = temp_mask;
