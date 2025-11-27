x = 200;
y = 80;
if (con == 0)
{
    pingponglerp += 0.02;
    if (pingponglerp >= 1)
    {
        pingponglerp = 1;
        con = 1;
    }
}
if (con == 1)
{
    marker = instance_create(x, y, obj_marker);
    marker.sprite_index = spr_kris_chef;
    scr_lerp_var_instance(marker, "x", 5, 640, 80, 2, "out");
    pingponglerp -= 0.02;
    if (pingponglerp <= 0)
    {
        pingponglerp = 0;
        con = 0;
    }
}
var xspace = 55;
for (var i = -3; i < 8; i++)
{
    draw_set_color(c_white);
    draw_sprite_ext(spr_spadebullet, 0, x + (i * xspace), y + lerp_ease_out(0, 90, pingponglerp, i), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    draw_sprite_ext(spr_spadebullet, 0, x + (i * xspace), y + 190, image_xscale, image_yscale, image_angle + lerp_ease_out(0, 180, pingponglerp, i), image_blend, image_alpha);
    draw_sprite_ext(spr_spadebullet, 0, x + (i * xspace), y + 274, lerp_ease_out(0, 1, pingponglerp, i), lerp_ease_out(0, 1, pingponglerp, i), image_angle, image_blend, image_alpha);
    draw_text(x + (i * xspace), 25, string(i));
    draw_text(x + (i * xspace), 420, string(i));
}
draw_set_font(fnt_ja_dotumche);
draw_set_color(c_white);
draw_line_width(0, 220, 640, 220, 2);
draw_text(5, 222, "y + lerp_ease_out()");
draw_line_width(0, 240, 640, 240, 2);
var space = 80;
draw_set_color(c_white);
draw_line_width(0, 220 + space, 640, 220 + space, 2);
draw_text(5, 222 + space, "image_angle+lerp_ease_out()");
draw_line_width(0, 240 + space, 640, 240 + space, 2);
space = 170;
draw_set_color(c_white);
draw_line_width(0, 220 + space, 640, 220 + space, 2);
draw_text(5, 222 + space, "image_xscale=lerp_ease_out()");
draw_line_width(0, 240 + space, 640, 240 + space, 2);
draw_line_width(0, 410, 640, 410, 2);
draw_line_width(0, 48, 640, 48, 2);
