var _yoffset = ease_out_back(clamp(image_alpha, 0, 1), 0, 20, 1);
x = camerax() + 460;
y = (cameray() + 252) - (index * 12) - _yoffset;
if (con == 0)
{
    timer--;
    if (timer <= 0)
    {
        timer = 0;
        con = 1;
    }
}
else if (con == 1)
{
    image_alpha += 0.1;
    if (image_alpha >= 2)
        con = 2;
}
else if (!i_ex(obj_shutta_photo_controller) || (i_ex(obj_shutta_photo_controller) && obj_shutta_photo_controller.state == "outro"))
{
    instance_destroy();
}
scr_84_set_draw_font("main");
draw_set_halign(fa_right);
draw_set_valign(fa_top);
draw_set_alpha(image_alpha);
draw_set_color(c_black);
draw_text_transformed(x - 1, y, text, image_xscale, image_yscale, image_angle);
draw_text_transformed(x + 1, y, text, image_xscale, image_yscale, image_angle);
draw_text_transformed(x, y - 1, text, image_xscale, image_yscale, image_angle);
draw_text_transformed(x, y + 1, text, image_xscale, image_yscale, image_angle);
draw_set_color(color);
draw_text_transformed(x, y, text, image_xscale, image_yscale, image_angle);
draw_set_alpha(1);
draw_set_halign(fa_left);
