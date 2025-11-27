var _battlemode = battlemode;
with (target_object)
{
    if (object_index == obj_dw_church_pushableshelf_3x3)
    {
        draw_set_blend_mode(bm_subtract);
        draw_sprite_ext(sprite_index, image_index, screenx(), screeny(), image_xscale, image_yscale, 0, c_black, 1);
        draw_set_blend_mode(bm_normal);
    }
    if (object_index == obj_character_church_window_silhouette)
    {
        event_user(6);
    }
    else
    {
        if (object_index == obj_darkness_unlit_object || object_index == obj_darkness_illusion)
        {
            draw_sprite_ext(sprite_index, image_index, x - camerax(), y - cameray(), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
            continue;
        }
        else if (object_index == obj_darkness_bullet)
        {
            draw_sprite_ext(dark_sprite, image_index, x - camerax(), y - cameray(), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
            continue;
        }
        var _outlineColor = scr_get_outline_color(self);
        if (_battlemode && obj_battlealphaer.battlealpha > 0)
            _outlineColor = merge_color(_outlineColor, c_black, obj_battlealphaer.battlealpha);
        d3d_set_fog(true, _outlineColor, 0, 1);
        draw_sprite_ext(sprite_index, image_index, x - camerax(), y - cameray(), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
        d3d_set_fog(false, c_black, 0, 1);
        gpu_set_alphatestenable(true);
        gpu_set_blendmode_ext_sepalpha(bm_src_alpha, bm_inv_src_alpha, bm_dest_alpha, bm_zero);
        draw_sprite_ext(sprite_index, image_index, x - camerax(), (y - cameray()) + 2, image_xscale, image_yscale, image_angle, c_black, image_alpha);
        draw_set_blend_mode(bm_normal);
        gpu_set_alphatestenable(false);
        if (object_index == obj_mainchara && _battlemode && battlealpha > 0)
        {
            if (fun == 0)
            {
                if (global.facing == 0)
                    draw_sprite_ext(spr_krisd_heart_outline, image_index, screenx(), screeny(), image_xscale, image_yscale, 0, image_blend, battlealpha);
                if (global.facing == 1)
                    draw_sprite_ext(spr_krisr_heart_outline, image_index, screenx(), screeny(), image_xscale, image_yscale, 0, image_blend, battlealpha);
                if (global.facing == 2)
                    draw_sprite_ext(spr_krisu_heart_outline, image_index, screenx(), screeny(), image_xscale, image_yscale, 0, image_blend, battlealpha);
                if (global.facing == 3)
                    draw_sprite_ext(spr_krisl_heart_outline, image_index, screenx(), screeny(), image_xscale, image_yscale, 0, image_blend, battlealpha);
            }
            else if (sprite_index == spr_krisd_slide)
            {
                draw_sprite_ext(spr_krisd_slide_heart_outline, image_index, x, y, image_xscale, image_yscale, 0, image_blend, battlealpha);
            }
            draw_sprite_ext(spr_heart_outline2, 0, screenx() + 12, screeny() + 40, 1, 1, 0, c_white, battlealpha * 2);
        }
    }
}
