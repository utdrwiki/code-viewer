split_screen_timer++;
split_screen_offset = lerp(0, 340, split_screen_timer / 30);
if (split_screen_timer > 30)
{
    instance_destroy();
    exit;
}
var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
draw_set_color(c_red);
var off = clamp(split_screen_offset, 0, 340);
draw_sprite_ext(spr_pxwhite, 0, cx - off, cy, 320, 480, 0, c_black, 1);
draw_sprite_ext(spr_pxwhite, 0, cx + 320 + off, cy, 320, 480, 0, c_black, 1);
