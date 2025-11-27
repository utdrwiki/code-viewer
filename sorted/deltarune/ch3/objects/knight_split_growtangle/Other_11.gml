boxgone = true;
if (obj_growtangle.customBox)
    exit;
var _newyscale = 3.3333333333333335;
surface_set_target(source_surf);
draw_set_color(c_black);
ossafe_fill_rectangle(0, 169, 1, 170);
draw_set_color(c_white);
surface_reset_target();
with (obj_growtangle)
{
    visible = true;
    x = xstart;
    y = ystart;
    customBox = true;
    spr_custom_box = sprite_create_from_surface(other.source_surf, 0, 0, 170, 170, true, false, 85, 85);
    growscale = 1;
}
