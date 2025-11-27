if (!surface_exists(__mysurface))
    __mysurface = surface_create(320, 240);
var thisstring = string_hash_to_newline(mystring);
var yloc = y + (sin(siner / 28) * 6);
mode = 0;
if (mode == 0.5)
{
    if (view_current == 0)
    {
        siner++;
        if (active)
            actind = lerp(actind, 1.05, lerpstrength);
        else
            actind = lerp(actind, -0.05, lerpstrength);
        actind = clamp(actind, 0, 1);
        alpha = actind;
    }
    surface_set_target(__mysurface);
    var col = 16777215;
    var col2 = 16764363;
    var darkercol = 10116630;
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(font);
    draw_surface(__mysurface, x - 160, y);
    draw_clear_alpha(c_white, 0);
    draw_set_blend_mode(bm_add);
    draw_text_transformed_color(159, yloc - 1, thisstring, 2, 2, angle, darkercol, darkercol, darkercol, darkercol, ((abs(sin((siner / 48) + 18)) * 0.3) + 0.5) * alpha);
    draw_text_transformed_color(161, yloc + 1, thisstring, 2, 2, angle, darkercol, darkercol, darkercol, darkercol, ((sin((siner / 48) + 36) * 0.3) + 0.2) * alpha);
    draw_text_transformed_color(162, yloc - 2, thisstring, 2, 2, angle, darkercol, darkercol, darkercol, darkercol, ((sin((siner / 48) + 18) * 0.3) + 0.2) * alpha);
    draw_text_transformed_color(158, yloc + 2, thisstring, 2, 2, angle, darkercol, darkercol, darkercol, darkercol, ((abs(sin((siner / 48) + 36)) * 0.1) + 0.2) * alpha);
    draw_text_transformed_color(160, yloc, thisstring, 2, 2, angle, col, col, col, col, ((abs(sin(siner / 48)) * 0.3) + 0.5) * alpha);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    surface_reset_target();
    draw_set_alpha(1);
    draw_set_blend_mode(bm_normal);
    draw_surface(__mysurface, x - 160, y);
}
if (mode == 1)
{
    if (view_current == 0)
    {
        siner++;
        if (active)
            actind = lerp(actind, 1.05, lerpstrength);
        else
            actind = lerp(actind, -0.05, lerpstrength);
        actind = clamp(actind, 0, 1);
        alpha = actind;
        if (alpha)
        {
            if ((siner % 8) == 0)
            {
                with (instance_create_depth(x, yloc, depth + 1, obj_prophecytext_afterimage))
                {
                    mystring = thisstring;
                    font = other.font;
                    angle = other.angle;
                    color = #A3F8FF;
                    color2 = 14593300;
                    daddy = other.id;
                }
            }
        }
    }
    var col = 16777215;
    var col2 = 16764363;
    var darkercol = 10116630;
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(font);
    draw_text_transformed_color(x - 2, yloc - 2, thisstring, 2, 2, angle, darkercol, darkercol, darkercol, darkercol, alpha * 0.2);
    draw_text_transformed_color(x + 2, yloc + 2, thisstring, 2, 2, angle, darkercol, darkercol, darkercol, darkercol, alpha * 0.8);
    draw_text_transformed_color(x, yloc, thisstring, 2, 2, angle, col, col, col, col, alpha);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
