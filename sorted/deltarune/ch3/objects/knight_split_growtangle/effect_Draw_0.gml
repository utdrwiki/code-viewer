if (!surface_exists(surf))
{
    surf = surface_create(640, 480);
    surface_copy(surf, 0, 0, application_surface);
    xmul = lengthdir_x(1, angle);
    ymul = lengthdir_y(1, angle);
}
timer++;
var _fade = (10 - timer) / 10;
var _htimer = (vertical ? 0 : timer) * xmul;
var _vtimer = (vertical ? timer : 0) * ymul;
var _splitwidth = sprite_width;
var _splitheight = sprite_height;
var _splitleft = 0;
var _splittop = 0;
if (vertical)
{
    _splitleft = sprite_width / 2;
    _splitwidth /= 2;
}
else
{
    _splittop = sprite_height / 2;
    _splitheight /= 2;
}
draw_sprite_part_ext_rot(sprite_index, 0, 0, 0, _splitwidth, _splitheight, x - (_htimer * 8), y - (_vtimer * 8), image_xscale, image_yscale, 0, image_blend, clamp01(_fade));
draw_sprite_part_ext_rot(sprite_index, 0, 0, 0, _splitwidth, _splitheight, x - (_htimer * 6), y - (_vtimer * 6), image_xscale, image_yscale, 0, image_blend, clamp01(_fade));
draw_sprite_part_ext_rot(sprite_index, 0, 0, 0, _splitwidth, _splitheight, x - (_htimer * 4), y - (_vtimer * 4), image_xscale, image_yscale, 0, image_blend, _fade);
draw_sprite_part_ext_rot(sprite_index, 0, _splitleft, _splittop, _splitwidth, _splitheight, x + (_htimer * 8), y + (_vtimer * 8), image_xscale, image_yscale, 0, image_blend, clamp01(_fade));
draw_sprite_part_ext_rot(sprite_index, 0, _splitleft, _splittop, _splitwidth, _splitheight, x + (_htimer * 6), y + (_vtimer * 6), image_xscale, image_yscale, 0, image_blend, clamp01(_fade));
draw_sprite_part_ext_rot(sprite_index, 0, _splitleft, _splittop, _splitwidth, _splitheight, x + (_htimer * 4), y + (_vtimer * 4), image_xscale, image_yscale, 0, image_blend, _fade);
var _sx = screenx();
var _sy = screeny();
if (vertical)
{
    draw_surface_part_ext(surf, 0, 0, _sx, 480, camerax(), cameray() - (timer * 8), 1, 1, 16777215, _fade / 2);
    draw_surface_part_ext(surf, 0, 0, 640 - _sx, 480, x, cameray() + (timer * 8), 1, 1, 16777215, _fade / 2);
}
else
{
    draw_surface_part_ext(surf, 0, 0, 640, _sy, camerax() - (timer * 8), cameray(), 1, 1, 16777215, _fade / 2);
    draw_surface_part_ext(surf, 0, _sy, 640, 480 - _sy, camerax() + (timer * 8), y, 1, 1, 16777215, _fade / 2);
}
draw_set_color(c_white);
var _angle = angle;
if (vertical)
    _angle += 90;
if (diagonal)
    _angle += 45;
draw_sprite_ext(spr_pxwhite10_center, 0, x + xoffset, y + yoffset, 50, _fade, _angle, c_white, 1);
draw_sprite_ext(spr_pxwhite10_center, 0, x + xoffset, y + yoffset, 50, _fade * 1.4, _angle, c_white, 0.5);
if (timer == 10)
    instance_destroy();
