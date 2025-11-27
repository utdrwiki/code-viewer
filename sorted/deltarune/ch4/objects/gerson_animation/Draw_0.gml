timer++;
if (timer == 2)
{
    instance_destroy();
    exit;
}
draw_sprite_ext(spr_bounce_shell_idle, spinindex, x, y, image_xscale, image_xscale, image_angle, image_blend, image_alpha);
draw_sprite_ext(spr_bounce_shell_idle_color, spinindex, x, y, image_xscale, image_xscale, image_angle, c_yellow, image_alpha);
