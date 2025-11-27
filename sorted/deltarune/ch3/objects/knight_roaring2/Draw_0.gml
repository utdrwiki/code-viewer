if (!surface_exists(my_surface))
    my_surface = surface_create(camerawidth(), cameraheight());
if (!surface_exists(ball_surface))
    ball_surface = surface_create(camerawidth(), cameraheight());
if (!surface_exists(star_surface))
    star_surface = surface_create(camerawidth(), cameraheight());
if (!surface_exists(terrible_surface))
    terrible_surface = surface_create(camerawidth(), cameraheight());
draw_self();
if (stop)
    exit;
surface_set_target(ball_surface);
draw_clear_alpha(c_black, 0);
draw_sprite_tiled(spr_knight_bullet_flow, 0, fake_x + (global.time * 2), fake_y);
gpu_set_blendmode(bm_add);
repeat (4)
    draw_sprite_tiled(spr_knight_bullet_flow, 0, fake_x + (global.time * 2), fake_y);
gpu_set_blendmode(bm_normal);
ball_counter += ball_speed;
if (ball_counter < 0)
    ball_counter += 1800;
if (ball_counter > 1800)
    ball_counter -= 1800;
gpu_set_blendmode_ext(bm_zero, bm_src_color);
for (a = 0; a < 6; a++)
    draw_circle_color(fake_x, fake_y + 57, 1800 - ((ball_counter + (300 * a)) % 1800), c_white, #595959, false);
draw_circle_color(fake_x, fake_y + 57, 640, c_white, c_black, false);
gpu_set_blendmode(bm_normal);
surface_reset_target();
surface_set_target(star_surface);
draw_clear_alpha(c_black, 0);
with (obj_knight_circle)
    event_user(1);
with (obj_particle_generic)
    draw_sprite_ext(sprite_index, image_index, screenx(), screeny(), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
with (obj_knight_roaring_star)
{
    if (image_blend == c_white)
        continue;
    if (con == 0)
        event_user(0);
    else
        event_user(1);
}
with (obj_knight_roaring_star)
{
    if (image_blend == c_dkgray)
        continue;
    if (con == 0)
        event_user(0);
    else
        event_user(1);
}
gpu_set_colorwriteenable(true, true, true, false);
draw_sprite_ext(spr_knight_line_grate, 0, 0, star_flicker, 2, 2, 0, c_black, 1);
star_flicker = 2 - star_flicker;
gpu_set_colorwriteenable(true, true, true, true);
with (obj_knight_roaring_star)
{
    if ((image_blend == c_dkgray || image_xscale > 1) && con < 1)
        continue;
    if (con == 0)
        event_user(0);
    else
        event_user(1);
}
with (obj_knight_pointing_starchild)
{
    draw_set_blend_mode(bm_add);
    var _glow = scr_pingpong(timer, 2) / 4;
    scr_draw_outline_ext(sprite_index, image_index, screenx(), screeny(), image_xscale, image_yscale, image_angle, c_white, _glow * image_alpha, image_xscale);
    draw_sprite_ext(sprite_index, image_index, screenx(), screeny(), image_xscale, image_yscale, image_angle, c_white, image_alpha);
    draw_set_blend_mode(bm_normal);
    image_alpha = clamp01(remap(45, 60, 1, 0, timer));
    if (image_alpha < 1)
        active = false;
    if (image_alpha == 0)
        instance_destroy();
}
with (obj_afterimage)
    draw_sprite_ext(sprite_index, image_index, screenx(), screeny(), image_xscale, image_yscale, image_angle, c_white, image_alpha);
surface_reset_target();
surface_set_target(my_surface);
draw_clear_alpha(c_black, 0);
ossafe_fill_rectangle_color(0, 0, camerawidth(), cameraheight(), c_black, c_black, c_black, c_black, false);
if (!hsv_switch)
    hsv++;
else
    hsv--;
if (hsv >= 288)
    hsv_switch = true;
if (hsv <= 128)
    hsv_switch = false;
gpu_set_blendmode(bm_add);
for (a = 0; a < surface_get_height(ball_surface); a++)
{
    var color = make_color_hsv(hsv % 255, 255, 255);
    draw_surface_part_ext(ball_surface, 0, a, surface_get_width(ball_surface), 1, (sin((a + global.time) * 0.1) * 4 * intensity) + (sin((a + global.time) * 0.35) * 0.5 * intensity), a, 1, 1, color, ball_darkness);
}
draw_surface(star_surface, 0, 0);
gpu_set_blendmode(bm_normal);
with (obj_afterimage_grow)
    draw_sprite_ext(sprite_index, image_index, screenx(), screeny(), image_xscale, image_yscale, image_angle, c_white, image_alpha);
if (line_timer > -1)
{
    gpu_set_colorwriteenable(true, true, true, false);
    var dir = -63;
    var color = make_color_rgb(r, g, b);
    draw_sprite_ext(spr_rk_quickslash_marker_gradient, 0, (camerawidth() * 0.5) - lengthdir_x(280, -63), (cameraheight() * 0.5) - lengthdir_y(280, -63), line_timer * 1, 4 + (8 * (1 - (min(line_timer, 16) / 16))), dir, color, 1);
    draw_sprite_ext(spr_rk_quickslash_marker, 0, (camerawidth() * 0.5) - lengthdir_x(280, -63), (cameraheight() * 0.5) - lengthdir_y(280, -63), line_timer * 1, 4 + (8 * (1 - (min(line_timer, 16) / 16))), dir, c_black, 1);
    gpu_set_colorwriteenable(true, true, true, true);
}
knight_sprite_image += knight_sprite_speed;
if (intensity < 3.75)
    intensify = intensity;
else
    intensify = scr_approach(intensify, 0, 0.1);
var bl = sprite_get_bbox_left(knight_sprite);
var bt = sprite_get_bbox_top(knight_sprite);
if (!do_fake_screen)
{
    if (intensify > 1.5)
    {
        for (a = 0; a < sprite_get_height(knight_sprite); a += 1)
        {
            if ((a % 2) == 0)
                draw_sprite_part_ext(knight_sprite, knight_sprite_image, bl, a, 70, 1, (fake_x - 70) + (sin((a + (global.time * 4)) * 0.15) * (intensify - 1.5) * 8), (fake_y + (a * 2) + (sin(bobble_count * 0.1) * bobble_amp)) - 10 - (bt * 2), 2, 2, image_blend, fake_alpha * 0.75);
            else
                draw_sprite_part_ext(knight_sprite, knight_sprite_image, bl, a, 70, 1, fake_x - 70 - (sin((a + (global.time * 4)) * 0.15) * (intensify - 1.5) * 8), (fake_y + (a * 2) + (sin(bobble_count * 0.1) * bobble_amp)) - 10 - (bt * 2), 2, 2, image_blend, fake_alpha * 0.75);
        }
    }
    for (a = 0; a < sprite_get_height(knight_sprite); a += 1)
        draw_sprite_part_ext(knight_sprite, knight_sprite_image, bl, a, 70, 1, (fake_x - 70) + (sin((a + (global.time * 4)) * 0.2) * intensify * 0.3), (fake_y + (a * 2) + (sin(bobble_count * 0.1) * bobble_amp)) - 10 - (bt * 2), 2, 2, image_blend, fake_alpha);
}
surface_reset_target();
draw_surface_ext(my_surface, camerax(), cameray(), 1, 1, 0, c_white, darkness);
with (obj_heart)
    draw_self();
if (do_fake_screen)
{
    var midway = camerawidth() * 0.5;
    var midwayy = cameraheight() * 0.5;
    with (obj_knight_pointing_starchild)
        instance_destroy();
    bl = sprite_get_bbox_left(knight_sprite);
    bt = sprite_get_bbox_top(knight_sprite);
    if (intensify > 1.5)
    {
        for (a = 0; a < sprite_get_height(knight_sprite); a += 1)
        {
            if ((a % 2) == 0)
                draw_sprite_part_ext(knight_sprite, knight_sprite_image, bl, a, 70, 1, ((camerax() + fake_x) - 70) + (sin((a + (global.time * 4)) * 0.15) * (intensify - 1.5) * 8), (cameray() + fake_y + (a * 2) + (sin(bobble_count * 0.1) * bobble_amp)) - 10 - (bt * 2), 2, 2, image_blend, fake_alpha * 0.75);
            else
                draw_sprite_part_ext(knight_sprite, knight_sprite_image, bl, a, 70, 1, (camerax() + fake_x) - 70 - (sin((a + (global.time * 4)) * 0.15) * (intensify - 1.5) * 8), (cameray() + fake_y + (a * 2) + (sin(bobble_count * 0.1) * bobble_amp)) - 10 - (bt * 2), 2, 2, image_blend, fake_alpha * 0.75);
        }
    }
    for (a = 0; a < sprite_get_height(knight_sprite); a += 1)
        draw_sprite_part_ext(knight_sprite, knight_sprite_image, bl, a, 70, 1, ((camerax() + fake_x) - 70) + (sin((a + (global.time * 4)) * 0.2) * intensify * 0.3), (cameray() + fake_y + (a * 2) + (sin(bobble_count * 0.1) * bobble_amp)) - 10 - (bt * 2), 2, 2, image_blend, fake_alpha);
    surface_set_target(terrible_surface);
    draw_clear_alpha(c_black, 0);
    draw_surface_ext(my_surface, 0, 0, 1, 1, 0, c_white, darkness);
    with (obj_heart)
        draw_sprite_ext(sprite_index, image_index, screenx(), screeny(), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    gpu_set_blendenable(false);
    draw_set_alpha(0);
    ossafe_fill_rectangle_color(midway + 120, -1, camerawidth(), cameraheight(), c_black, c_black, c_black, c_black, false);
    draw_triangle_color(midway - 120, -1, midway + 120, cameraheight(), midway + 120, -1, c_black, 0, 0, false);
    draw_set_alpha(1);
    gpu_set_blendenable(true);
    fakey_screen = sprite_create_from_surface(terrible_surface, 0, 0, camerawidth(), cameraheight(), false, false, camerawidth() * 0.25, cameraheight() * 0.5);
    draw_clear_alpha(c_black, 0);
    draw_surface_ext(my_surface, 0, 0, 1, 1, 0, c_white, darkness);
    with (obj_heart)
        draw_sprite_ext(sprite_index, image_index, screenx(), screeny(), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    gpu_set_blendenable(false);
    draw_set_alpha(0);
    ossafe_fill_rectangle_color(midway - 119, 0, -1, cameraheight(), c_black, c_black, c_black, c_black, false);
    draw_triangle_color(midway - 120, 0, midway - 120, cameraheight(), midway + 120, cameraheight(), c_black, 0, 0, false);
    draw_set_alpha(1);
    gpu_set_blendenable(true);
    surface_reset_target();
    fakey_screen_2 = sprite_create_from_surface(terrible_surface, 0, 0, camerawidth(), cameraheight(), false, false, camerawidth() * 0.75, cameraheight() * 0.5);
    stop = true;
    with (obj_heart)
        instance_destroy();
    with (scr_marker(camerax() + (camerawidth() * 0.25), cameray() + (cameraheight() * 0.5), fakey_screen))
    {
        direction = 180;
        scr_lerpvar("speed", 15, 0.5, 12, 1, "out");
        scr_script_delayed(scr_var, 12, "gravity", 1);
        gravity_direction = 180;
    }
    with (scr_marker(camerax() + (camerawidth() * 0.75), cameray() + (cameraheight() * 0.5), fakey_screen_2))
    {
        direction = 0;
        scr_lerpvar("speed", 14, 0.5, 12, 1, "out");
        scr_script_delayed(scr_var, 12, "gravity", 1);
        gravity_direction = 0;
    }
}
