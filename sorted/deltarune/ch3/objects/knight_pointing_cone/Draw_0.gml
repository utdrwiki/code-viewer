if (con >= 3)
{
    if (image_index == (image_number - 1))
        image_index--;
    else if (image_index > 0)
        image_index -= 0.25;
}
else if (image_index < (image_number - 1))
{
    image_index += 0.5;
}
if (con < 5)
    draw_self();
aetimer++;
if (con <= 4 && (aetimer % 4) == 0)
{
    var _after_image = scr_afterimage();
    _after_image.image_alpha = 0.6;
    _after_image.fadeSpeed = 0.02;
    _after_image.speed = 2 + (afterimage_spread / 30);
    _after_image.direction = (sin(aetimer) * angle) / 2;
    _after_image.depth = obj_knight_enemy.depth + 1;
    if (con == 4)
        afterimage_spread = scr_movetowards(afterimage_spread, 0, 20);
    if (con >= 1)
        afterimage_spread++;
}
if (con >= 4)
    exit;
if (!surface_exists(surf))
    surf = surface_create(640, 480);
if (!surface_exists(starsurf))
    starsurf = surface_create(640, 480);
if (con <= 1)
{
    if (con == 0)
        con = 1;
    if (timer < 28)
    {
        draw_set_blend_mode(bm_add);
        draw_sprite_part_ext(spr_knight_bullet_flow, 2, timer * 1, ((timer * 4) + yoff) - 2, screenx(x + 22) / 2, 1, camerax(), y + 54, 2, 2, c_gray, 1);
        if ((timer % 2) == 0)
            draw_sprite_part_ext(spr_knight_bullet_flow, 2, timer * 2, (timer * 4) + yoff, screenx(x + 22) / 2, 1, camerax(), y + 54, 2, 2, c_gray, 1);
        draw_set_blend_mode(bm_normal);
    }
    else
    {
        draw_set_color(c_white);
        ossafe_fill_rectangle(camerax(), y + 54, x + 22, y + 56, false);
    }
    timer++;
    if (timer >= 30)
    {
        snd_play_pitch(snd_rocket_long, 0.6);
        con = 2;
    }
    exit;
}
if (con == 3 && timer > 0)
{
    draw_set_blend_mode(bm_add);
    draw_sprite_part_ext(spr_knight_bullet_flow, 2, (10 - timer) * 2, yoff - ((10 - timer) * 4), screenx(x + 22) / 2, 1, camerax(), y + 54, 2, 2, c_gray, timer / 10);
    draw_sprite_part_ext(spr_knight_bullet_flow, 2, (10 - timer) * 2, yoff + ((10 - timer) * 4), screenx(x + 22) / 2, 1, camerax(), y + 54, 2, 2, c_gray, timer / 10);
    timer--;
    draw_set_blend_mode(bm_normal);
    if (timer == 0)
        con = 4;
    exit;
}
surface_set_target(surf);
draw_clear_alpha(c_black, 0);
draw_set_blend_mode(bm_normal);
draw_set_alpha(1);
draw_set_color(merge_color(c_white, c_black, angle / target_angle));
draw_primitive_begin(pr_trianglelist);
draw_angle = 1 - draw_angle;
var _angle = (angle > 0) ? (angle + draw_angle) : 0;
var _xleft = lengthdir_x(600, 180 + (_angle / 2));
var _ytop = lengthdir_y(600, 180 - (_angle / 2));
var _ybottom = lengthdir_y(600, 180 + (_angle / 2));
draw_vertex(screenx(x + 22) + _xleft, screeny(y + 56) + _ytop);
draw_vertex(screenx(x + 22), screeny(y + 56));
draw_vertex(screenx(x + 22) + _xleft, screeny(y + 58) + _ybottom);
draw_vertex(screenx(x + 22), screeny(y + 58));
draw_primitive_end();
gpu_set_alphatestenable(true);
gpu_set_blendmode_ext_sepalpha(bm_src_alpha, bm_one, bm_dest_alpha, bm_zero);
var _blend = 1;
draw_sprite_ext(spr_knight_bullet_flow, 0, bg_x, 0, 2, 2, 0, c_white, _blend);
draw_sprite_ext(spr_knight_bullet_flow, 0, bg_x + 640, 0, 2, 2, 0, c_white, _blend);
draw_sprite_ext(spr_knight_bullet_flow, 1, lines_x, 0, 2, 2, 0, c_white, _blend);
draw_sprite_ext(spr_knight_bullet_flow, 1, lines_x + 640, 0, 2, 2, 0, c_white, _blend);
lines_x -= 80;
bg_x -= 20;
if (lines_x < -640)
    lines_x += 640;
if (bg_x < -640)
    bg_x += 640;
draw_set_blend_mode(bm_subtract);
with (obj_heart)
    draw_sprite(sprite_index, image_index, screenx(), screeny());
if (instance_exists(obj_knight_pointing_star))
{
    surface_set_target(starsurf);
    draw_set_blend_mode(bm_normal);
    draw_clear_alpha(c_black, 0);
    with (obj_knight_pointing_star)
    {
        if (image_xscale > 0.5)
            event_user(0);
    }
    draw_set_blend_mode(bm_subtract);
    draw_sprite_ext(spr_knight_line_grate, 0, 0, star_flicker, 2, 2, 0, c_black, 1);
    star_flicker = 2 - star_flicker;
    draw_set_blend_mode(bm_normal);
    with (obj_knight_pointing_star)
    {
        if (image_xscale <= 0.5)
            event_user(0);
    }
    surface_reset_target();
    gpu_set_alphatestenable(true);
    gpu_set_blendmode_ext_sepalpha(bm_src_alpha, bm_inv_src_alpha, bm_dest_alpha, bm_zero);
    draw_surface(starsurf, 0, 0);
}
gpu_set_alphatestenable(false);
draw_set_blend_mode(bm_add);
surface_reset_target();
draw_surface(surf, camerax(), cameray());
draw_set_blend_mode(bm_normal);
