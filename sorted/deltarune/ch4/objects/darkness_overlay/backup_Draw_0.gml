if (sunkus_kb_check_pressed(66))
    active = !active;
image_alpha = scr_movetowards(image_alpha, active ? max_darkness : min_darkness, 0.05);
if (image_alpha == 0)
    exit;
if (!surface_exists(darkness_surf))
    darkness_surf = surface_create(640, 480);
if (!surface_exists(upper_surf))
    upper_surf = surface_create(640, 480);
if (!surface_exists(lower_surf))
    lower_surf = surface_create(640, 480);
surface_set_target(darkness_surf);
draw_set_blend_mode(bm_normal);
draw_clear(c_black);
with (obj_lightsource_behind)
    event_user(6);
surface_reset_target();
surface_set_target(lower_surf);
draw_set_blend_mode(bm_normal);
draw_clear_alpha(c_black, 0);
var _arrayCount = 0;
var _upperArrayCount = 0;
var _upper_array;
with (obj_mainchara)
{
    if (floorheight >= 1)
    {
        _upper_array[_upperArrayCount] = self;
        _upperArrayCount++;
    }
    else
    {
        _char_array[_arrayCount] = self;
        _arrayCount++;
    }
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
}
var _char_array = scr_sort_by_depth(_char_array, false);
if (_upperArrayCount > 0)
    _upper_array = scr_sort_by_depth(_upper_array, false);
if (castShadow)
{
    for (i = 0; i < _arrayCount; i++)
    {
        target_object = _char_array[i];
        event_user(0);
    }
}
battlemode = false;
if (instance_exists(obj_battleLayerHighlight))
{
    battlemode = true;
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
    target_object = _char_array[i];
    event_user(1);
}
surface_reset_target();
if (_upperArrayCount > 0)
{
    surface_set_target(upper_surf);
    draw_clear_alpha(c_black, 0);
    for (i = 0; i < _upperArrayCount; i++)
    {
        target_object = _upper_array[i];
        event_user(0);
    }
    if (battlemode)
    {
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
    for (i = 0; i < _upperArrayCount; i++)
    {
        target_object = _upper_array[i];
        event_user(1);
    }
}
surface_reset_target();
surface_set_target(darkness_surf);
draw_surface(lower_surf, 0, 0);
if (_upperArrayCount > 0)
    draw_surface(upper_surf, 0, 0);
draw_set_blend_mode(bm_subtract);
with (obj_lightsource)
    event_user(6);
surface_reset_target();
draw_set_blend_mode(bm_normal);
draw_surface_ext(darkness_surf, camerax(), cameray(), 1, 1, 0, c_white, 0.5 * image_alpha);
