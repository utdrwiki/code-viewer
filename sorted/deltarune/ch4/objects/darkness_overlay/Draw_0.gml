if (scr_debug())
{
    if (sunkus_kb_check_pressed(86))
        faded = !faded;
    if (sunkus_kb_check_pressed(66))
        active = !active;
}
var drawoutline = draw_silhouettes;
var drawripples = false;
if (instance_exists(obj_dw_church_intro_gerson))
    drawoutline = false;
if (instance_exists(obj_dw_church_darkclimb))
    drawoutline = false;
if (instance_exists(obj_dw_churchc_darkswords))
    drawoutline = false;
if (instance_exists(obj_dw_churchc_dodge))
    drawoutline = false;
if (instance_exists(obj_dw_churchc_ripplesneak_poc))
    drawoutline = false;
if (instance_exists(obj_dw_churchc_ripplesneak_poc))
    drawripples = true;
if (i_ex(obj_overworld_darkness_bulletarea))
    obj_overworld_darkness_bulletarea.active = active;
if (!active)
    exit;
if (image_alpha == 0)
    exit;
if (!surface_exists(darkness_surf))
    darkness_surf = surface_create(640, 480);
if (!surface_exists(dim_surf))
    dim_surf = surface_create(640, 480);
surface_set_target(dim_surf);
draw_set_blend_mode(bm_normal);
draw_clear(c_black);
if (drawripples)
{
    var map_id = scr_layer_tilemap_get_id_fixed("TILES_BATTLEBORDER");
    draw_tilemap(map_id, -camerax(), -cameray());
    with (obj_church_ripple)
    {
        if (!dodraw)
        {
            x -= camerax();
            y -= cameray();
            event_user(10);
            x += camerax();
            y += cameray();
        }
    }
    with (obj_dw_church_waterfallchaser_churchc)
    {
        x -= camerax();
        y -= cameray();
        draw_self();
        x += camerax();
        y += cameray();
    }
}
with (obj_lightsource_behind)
    event_user(6);
var _arrayCount = 0;
var _char_array;
with (obj_mainchara)
{
    if (visible)
    {
        _char_array[_arrayCount] = self;
        _arrayCount++;
    }
}
if (drawoutline)
{
    var krcol = 15245824;
    var sucol = 13138410;
    var racol = 1959605;
    var gercol = 4580517;
    var nocol = 12320748;
    with (obj_actor)
    {
        if (visible)
        {
            _char_array[_arrayCount] = self;
            _arrayCount++;
        }
    }
    with (obj_dw_church_turtles)
    {
        with (gerson)
        {
            outlineColor = gercol;
            _char_array[_arrayCount] = id;
            _arrayCount++;
        }
    }
    with (obj_dw_church_intro_gerson)
    {
        if (i_ex(gerson))
        {
            if (gerson.visible)
            {
                _char_array[_arrayCount] = gerson;
                _arrayCount++;
            }
        }
    }
    with (obj_dw_church_bookshelfpuzzle)
    {
        if (i_ex(ranpc))
        {
            with (ranpc.marker)
            {
                outlineColor = racol;
                _char_array[_arrayCount] = id;
                _arrayCount++;
            }
        }
        if (i_ex(sunpc))
        {
            with (sunpc.marker)
            {
                outlineColor = sucol;
                _char_array[_arrayCount] = id;
                _arrayCount++;
            }
        }
    }
    with (obj_dw_church_pianopiece_right)
    {
        if (i_ex(ranpc))
        {
            with (ranpc.marker)
            {
                outlineColor = racol;
                _char_array[_arrayCount] = id;
                _arrayCount++;
            }
        }
        if (i_ex(sunpc))
        {
            with (sunpc.marker)
            {
                outlineColor = sucol;
                _char_array[_arrayCount] = id;
                _arrayCount++;
            }
        }
    }
    with (obj_caterpillarchara)
    {
        if (visible)
        {
            _char_array[_arrayCount] = self;
            _arrayCount++;
        }
    }
    with (obj_npc_room)
    {
        if (visible)
        {
            _char_array[_arrayCount] = self;
            _arrayCount++;
        }
    }
    with (obj_npc_room_animated)
    {
        if (visible)
        {
            _char_array[_arrayCount] = self;
            _arrayCount++;
        }
    }
    with (obj_dw_church_darkmaze)
    {
        if (i_ex(gerson))
        {
            if (gerson.visible)
            {
                _char_array[_arrayCount] = gerson;
                _arrayCount++;
            }
        }
        if (i_ex(germark))
        {
            if (germark.visible)
            {
                _char_array[_arrayCount] = germark;
                _arrayCount++;
            }
        }
        if (i_ex(sumark))
        {
            if (sumark.visible)
            {
                _char_array[_arrayCount] = sumark;
                _arrayCount++;
            }
        }
        if (i_ex(ramark))
        {
            if (ramark.visible)
            {
                _char_array[_arrayCount] = ramark;
                _arrayCount++;
            }
        }
    }
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
with (obj_marker_darkness_unlit)
{
    if (sprite_exists(sprite_index))
    {
        _char_array[_arrayCount] = self;
        _arrayCount++;
    }
}
with (obj_darkness_bullet)
{
    _char_array[_arrayCount] = self;
    _arrayCount++;
}
if (_arrayCount > 1)
    _char_array = scr_sort_by_depth(_char_array, false);
if (castShadow)
{
    for (var i = 0; i < _arrayCount; i++)
    {
        with (_char_array[i])
        {
            if (object_index == obj_character_church_window_silhouette || object_index == obj_darkness_unlit_object || object_index == obj_darkness_illusion || object_index == obj_darkness_bullet || object_index == obj_marker_darkness_unlit)
            {
                continue;
            }
            else
            {
                var _forceOff = false;
                var _yoff = 4;
                if (object_index == obj_caterpillarchara)
                {
                    if (shadow_force_off)
                    {
                        _forceOff = true;
                    }
                    else if (name == "susie")
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
                if (!_forceOff)
                    draw_sprite_ext(sprite_index, image_index, screenx(), (screeny() + ((sprite_height - sprite_yoffset) * 2)) - _yoff, image_xscale, -image_yscale, image_angle, c_black, image_alpha);
            }
        }
    }
}
var _battlemode = false;
with (obj_growtangle)
{
    with (obj_mainchara)
    {
        if (battlemode)
            _battlemode = true;
    }
}
if (instance_exists(obj_growtangle))
{
    with (obj_ghosthouse_lock)
    {
        _blend = merge_color(image_blend, c_black, other.fade_in);
        draw_sprite_ext(sprite_index, 0, x - camerax(), y - cameray(), image_xscale, image_yscale, image_angle, _blend, image_alpha);
    }
    with (obj_lightsource_lamp)
    {
        _blend = merge_color(image_blend, c_black, other.fade_in);
        draw_sprite_ext(sprite_index, 0, x - camerax(), y - cameray(), image_xscale, image_yscale, image_angle, _blend, image_alpha);
    }
    with (obj_battlesolid)
    {
        if (sprite_index == spr_ghost_house_the_chimney || other.draw_all_solids)
        {
            _blend = merge_color(image_blend, c_black, other.fade_in);
            draw_sprite_ext(sprite_index, 0, x - camerax(), y - cameray(), image_xscale, image_yscale, image_angle, _blend, image_alpha);
        }
    }
    with (obj_growtangle)
    {
        if (growcon != 3 && visible)
        {
            _blend = merge_color(image_blend, c_black, other.fade_in);
            draw_sprite_ext(sprite_index, 0, x - camerax(), y - cameray(), image_xscale, image_yscale, image_angle, _blend, image_alpha);
        }
    }
    with (obj_ghosthouse_jackolantern_merciful)
    {
        if (scare_con >= 1)
        {
            draw_sprite_ext(head_sprite, 0, screenx(), screeny(), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
            var _spimmer = scr_ease_out(face_timer / 40, -2) * 180;
            draw_sprite_ext(mouth_sprite, 0, screenx(), screeny() + 20, image_xscale, image_yscale, image_angle + _spimmer, image_blend, image_alpha);
        }
        else if (funny)
        {
            _blend = merge_color(image_blend, c_black, other.fade_in);
            draw_sprite_pos(sprite_index, image_index, screenx(sx[0]), screeny(sy[0]), screenx(sx[1]), screeny(sy[1]), screenx(sx[2]), screeny(sy[2]), screenx(sx[3]), screeny(sy[3]), brightness);
        }
        else if (ticks > 0)
        {
            _blend = merge_color(image_blend, c_black, other.fade_in);
            draw_sprite_ext(sprite_index, image_index, screenx() + shakex, screeny() + shakey, image_xscale, image_yscale, image_angle, _blend, image_alpha);
        }
        else
        {
            _blend = merge_color(image_blend, c_black, other.fade_in);
            draw_sprite_ext(sprite_index, image_index, screenx(), screeny(), image_xscale, image_yscale, image_angle, _blend, image_alpha);
        }
        if (total_ticks > 0 || screamcon == 2)
        {
            gpu_set_fog(true, c_white, 0, 1000);
            if (funny)
                draw_sprite_pos(sprite_index, image_index, screenx(sx[0]), screeny(sy[0]), screenx(sx[1]), screeny(sy[1]), screenx(sx[2]), screeny(sy[2]), screenx(sx[3]), screeny(sy[3]), brightness);
            else
                draw_sprite_ext(sprite_index, image_index, screenx() + shakex, screeny() + shakey, image_xscale, image_yscale, image_angle, image_blend, brightness);
        }
        gpu_set_fog(false, c_white, 0, 1000);
    }
    var _blend = merge_color(image_blend, c_black, fade_in);
    draw_sprite_ext(sprite_index, 0, x - camerax(), y - cameray(), image_xscale, image_yscale, image_angle, _blend, image_alpha);
}
for (var i = 0; i < _arrayCount; i++)
{
    with (_char_array[i])
    {
        if (object_index == obj_character_church_window_silhouette)
        {
            event_user(6);
        }
        else
        {
            if (object_index == obj_darkness_unlit_object || object_index == obj_darkness_illusion || object_index == obj_marker_darkness_unlit)
            {
                draw_sprite_ext(sprite_index, image_index, x - camerax(), y - cameray(), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
                continue;
            }
            else if (object_index == obj_darkness_bullet)
            {
                draw_sprite_ext(dark_sprite, image_index, x - camerax(), y - cameray(), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
                continue;
            }
            if (!iv_ex(_char_array[i], "outlineColor"))
            {
                if (other.outline_style == 0)
                    outlineColor = other.outline_default;
                else
                    outlineColor = scr_get_outline_color(_char_array[i], other.outline_default, other.outline_style);
            }
            var _outlineColor = merge_color(c_black, outlineColor, other.highlightalpha);
            if (i_ex(id) && image_alpha < 1 && visible)
            {
            }
            if (_battlemode && obj_battlealphaer.battlealpha > 0)
                _outlineColor = merge_color(_outlineColor, c_black, 1);
            if (drawoutline)
            {
                d3d_set_fog(true, _outlineColor, 0, 1);
                draw_sprite_ext(sprite_index, image_index, x - camerax(), y - cameray(), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
                d3d_set_fog(false, c_black, 0, 1);
                gpu_set_alphatestenable(true);
                gpu_set_blendmode_ext_sepalpha(bm_src_alpha, bm_inv_src_alpha, bm_dest_alpha, bm_zero);
                draw_sprite_ext(sprite_index, image_index, x - camerax(), (y - cameray()) + 2, image_xscale, image_yscale, image_angle, c_black, image_alpha);
                draw_set_blend_mode(bm_normal);
                gpu_set_alphatestenable(false);
            }
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
with (obj_marker)
{
    if (variable_instance_exists(id, "glow"))
    {
        if (glow == true)
            draw_self();
    }
    else
    {
        glow = false;
    }
}
