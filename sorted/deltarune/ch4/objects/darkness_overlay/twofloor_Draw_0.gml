if (sunkus_kb_check_pressed(66))
    active = !active;
image_alpha = scr_movetowards(image_alpha, active ? max_darkness : min_darkness, 0.05);
if (image_alpha == 0)
    exit;
if (!surface_exists(darkness_surf))
    darkness_surf = surface_create(640, 480);
if (!surface_exists(dim_surf))
    dim_surf = surface_create(640, 480);
if (!surface_exists(object_surf))
    object_surf = surface_create(640, 480);
surface_set_target(dim_surf);
draw_set_blend_mode(bm_normal);
draw_clear(c_black);
with (obj_lightsource_behind)
    event_user(6);
surface_reset_target();
surface_set_target(object_surf);
draw_set_blend_mode(bm_normal);
draw_clear_alpha(c_black, 0);
var _arrayCount = 0;
var _upperFloor = false;
var _lowerObjCount = 0;
with (obj_mainchara)
{
    _char_array[_arrayCount] = self;
    _arrayCount++;
    if (floorheight >= 1)
        _upperFloor = true;
}
with (obj_caterpillarchara)
{
    _char_array[_arrayCount] = self;
    _arrayCount++;
}
with (obj_npc_room)
{
    _char_array[_arrayCount] = self;
    _arrayCount++;
}
with (obj_npc_room_animated)
{
    _char_array[_arrayCount] = self;
    _arrayCount++;
}
with (obj_darkness_unlit_object_interactable)
{
    _char_array[_arrayCount] = self;
    _arrayCount++;
}
with (obj_character_church_window_silhouette)
{
    _char_array[_arrayCount] = self;
    _arrayCount++;
}
with (obj_darkness_unlit_object)
{
    _char_array[_arrayCount] = self;
    _arrayCount++;
}
with (obj_darkness_bullet)
{
    _char_array[_arrayCount] = self;
    _arrayCount++;
}
with (obj_dw_church_pushableshelf_3x3)
{
    _char_array[_arrayCount] = self;
    _arrayCount++;
    if (_upperFloor)
        _lowerObjCount++;
}
var _char_array = scr_sort_by_depth(_char_array, false);
if (castShadow)
{
    for (i = 0; i < _arrayCount; i++)
    {
        with (_char_array[i])
        {
            if (object_index == obj_character_church_window_silhouette || object_index == obj_darkness_unlit_object || object_index == obj_darkness_illusion || object_index == obj_darkness_bullet || object_index == obj_dw_church_pushableshelf_darklight)
            {
                continue;
            }
            else
            {
                var _yoff = 4;
                if (object_index == obj_caterpillarchara)
                {
                    if (name == "susie")
                    {
                        _yoff = 0;
                    }
                    else if (name == "ralsei")
                    {
                        if (facing[target] == 0)
                            _yoff = 8;
                        else if (facing[target] == 2)
                            _yoff = 12;
                    }
                }
                draw_sprite_ext(sprite_index, image_index, screenx(), (screeny() + ((sprite_height - sprite_yoffset) * 2)) - _yoff, image_xscale, -image_yscale, image_angle, c_black, image_alpha);
            }
        }
    }
}
var _battlemode = false;
if (instance_exists(obj_battleLayerHighlight))
{
    _battlemode = true;
    with (obj_battleLayerHighlight)
    {
        show_border = 0;
        if (sprite_exists(spr_battleborder))
        {
            d3d_set_fog(true, #202020, 0, 1);
            draw_sprite_ext(spr_battleborder, 0, -camerax(), -cameray(), 1, 1, 0, c_white, 1);
            d3d_set_fog(false, c_white, 0, 0);
            draw_sprite_ext(spr_battleborder, 0, -camerax(), -cameray(), 1, 1, 0, c_white, myalpha);
        }
    }
}
for (i = 0; i < _arrayCount; i++)
{
    var _castShadow = castShadow;
    if (castShadow && _upperFloor && _lowerObjCount == 0)
    {
        _upperFloor = false;
        for (i2 = 0; i2 < _arrayCount; i2++)
        {
            with (_char_array[i2])
            {
                if (object_index != obj_caterpillarchara && object_index != obj_mainchara)
                {
                    continue;
                }
                else
                {
                    var _yoff = 4;
                    if (object_index == obj_caterpillarchara)
                    {
                        if (special[target] == 1)
                            continue;
                        if (name == "susie")
                        {
                            _yoff = 0;
                        }
                        else if (name == "ralsei")
                        {
                            if (facing[target] == 0)
                                _yoff = 8;
                            else if (facing[target] == 2)
                                _yoff = 12;
                        }
                    }
                    else if (object_index == obj_mainchara && climbing)
                    {
                        continue;
                    }
                    draw_sprite_ext(sprite_index, image_index, screenx(), (screeny() + ((sprite_height - sprite_yoffset) * 2)) - _yoff, image_xscale, -image_yscale, image_angle, c_black, image_alpha);
                }
            }
        }
    }
    with (_char_array[i])
    {
        if (object_index == obj_dw_church_pushableshelf_darklight)
        {
            draw_set_blend_mode(bm_subtract);
            draw_sprite_ext(sprite_index, image_index, screenx(), screeny(), image_xscale, image_yscale, 0, c_black, 1);
            draw_set_blend_mode(bm_normal);
            if (_upperFloor)
                _lowerObjCount--;
        }
        else if (object_index == obj_character_church_window_silhouette)
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
            var _xoff = 0;
            if (_battlemode && obj_battlealphaer.battlealpha > 0)
                _outlineColor = merge_color(_outlineColor, c_black, obj_battlealphaer.battlealpha);
            d3d_set_fog(true, _outlineColor, 0, 1);
            draw_sprite_ext(sprite_index, image_index, screenx(), screeny(), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
            d3d_set_fog(false, c_black, 0, 1);
            gpu_set_alphatestenable(true);
            gpu_set_blendmode_ext_sepalpha(bm_src_alpha, bm_inv_src_alpha, bm_dest_alpha, bm_zero);
            draw_sprite_ext(sprite_index, image_index, screenx(), screeny() + 2, image_xscale, image_yscale, image_angle, c_black, image_alpha);
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
}
surface_reset_target();
surface_set_target(dim_surf);
draw_surface(object_surf, 0, 0);
draw_set_blend_mode(bm_subtract);
with (obj_lightsource)
    event_user(6);
surface_reset_target();
draw_set_blend_mode(bm_normal);
surface_set_target(darkness_surf);
draw_clear_alpha(c_black, 0);
surface_reset_target();
surface_copy(darkness_surf, 0, 0, dim_surf);
surface_set_target(darkness_surf);
draw_set_blend_mode(bm_subtract);
with (obj_lightsource)
    event_user(7);
surface_reset_target();
draw_set_blend_mode(bm_normal);
draw_surface_ext(dim_surf, camerax(), cameray(), 1, 1, 0, c_white, 0.5 * image_alpha);
draw_surface_ext(darkness_surf, camerax(), cameray(), 1, 1, 0, c_white, image_alpha);
