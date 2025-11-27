draw_sprite_ext(spr_nondescript_room, 0, 0, 0, 2, 2, 0, c_white, normal_alpha);
var room_x_a, dark_color;
if (dark_alpha > 0)
{
    dark_color = merge_color(c_white, c_black, 0.4);
    room_x_x += 0.2;
    room_x_a = sin(room_x_x) * 0.025;
    draw_sprite_ext(spr_nondescript_room_dark, 0, room_x_a * 20, room_x_a * 20, 2, 2, 0, dark_color, (dark_alpha * 0.3) + room_x_a);
    draw_sprite_ext(spr_nondescript_room_dark, 0, 2 + (room_x_a * 15), 2 + (room_x_a * 15), 2, 2, 0, dark_color, (dark_alpha * 0.3) + room_x_a);
    draw_sprite_ext(spr_nondescript_room_chair_dark, 0, 272 + (room_x_a * 20), 218 + (room_x_a * 20), 2, 2, 0, dark_color, chair_alpha * ((dark_alpha * 0.3) + room_x_a));
    draw_sprite_ext(spr_nondescript_room_chair_dark, 0, 272 + (room_x_a * 15), 218 + (room_x_a * 15), 2, 2, 0, dark_color, chair_alpha * ((dark_alpha * 0.3) + room_x_a));
    draw_sprite_ext(spr_nondescript_room_poster_dark, 0, 162 + (room_x_a * 20), 90 + (room_x_a * 20), 2, 2, 0, dark_color, chair_alpha * ((dark_alpha * 0.3) + room_x_a));
    draw_sprite_ext(spr_nondescript_room_poster_dark, 0, 162 + (room_x_a * 15), 90 + (room_x_a * 15), 2, 2, 0, dark_color, chair_alpha * ((dark_alpha * 0.3) + room_x_a));
}
if (distort_alpha > 0)
{
    anim_timer++;
    if ((anim_timer % 8) == 1)
        distort_index = 0;
    if ((anim_timer % 16) == 1)
        distort_index = 1;
    draw_sprite_ext(spr_nondescript_room_chair_distort, distort_index, 267 + (room_x_a * 20), 212 + (room_x_a * 20), 2, 2, 0, dark_color, (distort_alpha * 0.3) + room_x_a);
    draw_sprite_ext(spr_nondescript_room_chair_distort, distort_index, 267 + (room_x_a * 15), 212 + (room_x_a * 15), 2, 2, 0, dark_color, (distort_alpha * 0.3) + room_x_a);
    draw_sprite_ext(spr_nondescript_room_poster_distort, distort_index, 162 + (room_x_a * 20), 90 + (room_x_a * 20), 2, 2, 0, dark_color, (distort_alpha * 0.3) + room_x_a);
    draw_sprite_ext(spr_nondescript_room_poster_distort, distort_index, 162 + (room_x_a * 15), 90 + (room_x_a * 15), 2, 2, 0, dark_color, (distort_alpha * 0.3) + room_x_a);
}
draw_sprite_ext(spr_pixel_white, 0, -10, -10, 999, 999, 0, c_black, overlay_alpha_a);
if (darker____alpha > 0)
{
    anim_timer++;
    draw_sprite_ext(spr_nondescript_room_darkworld, 0, 0, 0, 2, 2, 0, c_white, darker_alpha);
    draw_sprite_ext(spr_nondescript_room_river, anim_timer * 0.15, 136, 144, 2, 2, 0, c_white, darker_river_alpha);
    draw_sprite_ext(spr_nondescript_room_eye_small, anim_timer * 0.15, 240, 90, 2, 2, 0, #B5E61D, darker_door_alpha);
    draw_sprite_ext(spr_nondescript_room_eye_small, anim_timer * 0.15, 272, 102, 2, 2, 0, #B5E61D, darker_door_alpha);
    draw_sprite_ext(spr_nondescript_room_eye_small, anim_timer * 0.1, 350, 120, 2, 2, 0, #B5E61D, darker_door_alpha);
    draw_sprite_ext(spr_nondescript_room_eye, anim_timer * 0.15, 380, 80, 2, 2, 0, c_white, darker_eye_alpha);
    draw_sprite_ext(spr_nondescript_room_hands, anim_timer * 0.15, 136, 80, 2, 2, 0, c_white, darker_hands_alpha);
    if (darker_zoom_timer < 2)
    {
        draw_sprite_ext(spr_nondescript_room___, anim_timer * 0.15, 320, 240, 2, 2, 0, c_white, darker____alpha);
        draw_sprite_ext(spr_nondescript_room____face, anim_timer * 0.15, 320, 240, 2, 2, 0, c_white, darker____face_alpha);
    }
}
draw_sprite_ext(spr_pixel_white, 0, -10, -10, 999, 999, 0, c_black, overlay_alpha_b);
if (scr_debug())
{
    if (keyboard_check_pressed(ord("R")))
        room_restart();
}
