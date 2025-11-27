var _splid = vertical ? round(distance) : 0;
var _dist = vertical ? 0 : round(distance);
var _angle = angle + (vertical ? 90 : 0);
if (diagonal)
{
    _splid = sqrt(0.5) * distance;
    _dist = _splid;
    _angle += 45;
}
var _xx = (distance > 0) ? irandom_range(-1, 1) : 0;
var _yy = (distance > 0) ? irandom_range(-1, 1) : 0;
var _xx2 = (distance > 0) ? irandom_range(-1, 1) : 0;
var _yy2 = (distance > 0) ? irandom_range(-1, 1) : 0;
if (!surface_exists(source_surf))
{
    source_surf = surface_create(170, 170);
    surface_set_target(source_surf);
    draw_clear_alpha(c_black, 0);
    draw_sprite_ext(sprite_index, 1, 85, 85, 2, 2, 0, c_white, 1);
    draw_sprite_ext(sprite_index, 0, 85, 85, 2, 2, 0, c_white, 1);
    surface_reset_target();
    half_box_a = surface_create(170, 170);
    half_box_b = surface_create(170, 170);
}
if (distance == 0)
{
    draw_surface_ext(source_surf, x - 85, y - 85, 1, 1, 0, image_blend, 1);
    update_box = true;
}
if (distance != 0 && update_box)
{
    var _xmul = lengthdir_x(1, _angle);
    var _ymul = lengthdir_y(1, _angle);
    var _xchange = _xmul * 400;
    var _ychange = _ymul * 400;
    var _xend = vertical ? 400 : 0;
    var _yend = vertical ? 0 : 400;
    draw_set_color(c_white);
    surface_set_target(half_box_a);
    draw_clear_alpha(c_black, 0);
    draw_surface(source_surf, 0, 0);
    gpu_set_blendmode(bm_subtract);
    var _xnudge = 0;
    var _ynudge = 0;
    if (vertical)
        _xnudge = 1;
    else
        _ynudge = 1;
    draw_triangle((85 + xoffset) - _xchange, (85 + yoffset) - _ychange, 85 + xoffset + _xchange, 85 + yoffset + _ychange, 85 + xoffset + _xend, 85 + yoffset + _yend, false);
    gpu_set_blendmode(bm_normal);
    surface_reset_target();
    surface_set_target(half_box_b);
    draw_clear_alpha(c_black, 0);
    draw_surface(source_surf, 0, 0);
    gpu_set_blendmode(bm_subtract);
    draw_triangle((85 + xoffset) - _xchange - _xnudge, (85 + yoffset) - _ychange - _ynudge, (85 + xoffset + _xchange) - _xnudge, (85 + yoffset + _ychange) - _ynudge, (85 + xoffset) - _xend, (85 + yoffset) - _yend, false);
    gpu_set_blendmode(bm_normal);
    surface_reset_target();
    var _change = choose(-2, -1, 1, 2);
    var _deviation;
    if (vertical)
    {
        _deviation = _change - v_change;
        v_change = _change;
    }
    else
    {
        _deviation = _change - h_change;
        h_change = _change;
    }
    surface_set_target(source_surf);
    draw_clear_alpha(c_black, 0);
    draw_surface(half_box_a, -_xmul * _deviation, -_ymul * _deviation);
    draw_surface(half_box_b, _xmul * _deviation, _ymul * _deviation);
    draw_set_color(merge_color(c_black, c_white, 0.25));
    var _abs_deviation = 85 + abs(_deviation);
    gpu_set_blendmode_ext(bm_dest_alpha, bm_zero);
    draw_line((85 + xoffset) - (_xmul * _abs_deviation), (85 + yoffset) - (_ymul * _abs_deviation), 85 + xoffset + (_xmul * _abs_deviation), 85 + yoffset + (_ymul * _abs_deviation));
    gpu_set_blendmode(bm_normal);
    surface_reset_target();
    update_box = false;
}
if (distance > 0)
{
    if (diagonal && vertical)
    {
        draw_surface_ext(half_box_a, (x - _splid - 85) + _xx, ((y + _dist) - 85) + _yy, 1, 1, 0, image_blend, 1);
        draw_surface_ext(half_box_b, ((x + _splid) - 85) + _xx2, (y - _dist - 85) + _yy2, 1, 1, 0, image_blend, 1);
    }
    else
    {
        draw_surface_ext(half_box_a, (x - _splid - 85) + _xx, (y - _dist - 85) + _yy, 1, 1, 0, image_blend, 1);
        draw_surface_ext(half_box_b, ((x + _splid) - 85) + _xx2, ((y + _dist) - 85) + _yy2, 1, 1, 0, image_blend, 1);
    }
}
draw_set_color(c_white);
if (con > 0)
{
    if (round(distance) == 0)
    {
        if (vertical)
            draw_sprite_ext(spr_whitepixel, 0, x + xoffset, y - 74, _dist * 2, _splid * 2, angle, c_white, 1);
        else
            draw_sprite_ext(spr_whitepixel, 0, x - 74, y + yoffset, _splid * 2, _dist * 2, angle, c_white, 1);
    }
    else if (vertical)
    {
        draw_sprite_ext(spr_rk_split_flame_edge, flame_index, x - _dist - 1, y + 2, 2, 2, _angle, c_gray, 1);
        draw_sprite_ext(spr_rk_split_flame_edge, flame_index, x + _dist + 2, y, 2, 2, _angle, c_gray, 1);
    }
    else
    {
        draw_sprite_ext(spr_rk_split_flame_edge, flame_index, x + 2, y - _dist - 1, 2, 2, _angle + 185, c_gray, 1);
        draw_sprite_ext(spr_rk_split_flame_edge, flame_index, x, y + _dist + 2, 2, 2, _angle, c_gray, 1);
    }
}
flame_index += 0.5;
