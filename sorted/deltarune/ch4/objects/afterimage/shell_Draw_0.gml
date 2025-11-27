var scale = image_xscale;
if (sprite_index == spr_bounce_shell_idle)
    draw_sprite_ext(spr_bounce_shell_idle_color, image_index, x + lengthdir_x(shakelen, shakedir), y + lengthdir_y(shakelen, shakedir), scale, scale, image_angle, shellcolor, image_alpha);
if (sprite_index == spr_bounce_shell_hit_center)
    draw_sprite_ext(spr_bounce_shell_hit_center_color, image_index, x + lengthdir_x(shakelen, shakedir), y + lengthdir_y(shakelen, shakedir), scale, scale, image_angle, shellcolor, image_alpha);
if (sprite_index == spr_bounce_shell_squish)
    draw_sprite_ext(spr_bounce_shell_squish_color, image_index, x + lengthdir_x(shakelen, shakedir), y + lengthdir_y(shakelen, shakedir), scale, scale, image_angle, shellcolor, image_alpha);
if (sprite_index == spr_bounce_shell_squish2)
    draw_sprite_ext(spr_bounce_shell_squish2_color, image_index, x + lengthdir_x(shakelen, shakedir), y + lengthdir_y(shakelen, shakedir), scale, scale, image_angle, shellcolor, image_alpha);
draw_sprite_ext(sprite_index, image_index, x + lengthdir_x(shakelen, shakedir), y + lengthdir_y(shakelen, shakedir), scale, scale, image_angle, image_blend, image_alpha);
