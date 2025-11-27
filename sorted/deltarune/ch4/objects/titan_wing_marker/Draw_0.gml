exit;
if (!i_ex(obj_titan_heal_orb))
    exit;
with (obj_titan_enemy)
{
    draw_sprite_ext(other.sprite_index, 6, x + other.xoff, y + other.yoff, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if (darktimer > 0)
    {
        d3d_set_fog(true, c_black, 0, 1);
        draw_sprite_ext(other.sprite_index, 6, x + other.xoff, y + other.yoff, image_xscale, image_yscale, image_angle, image_blend, other.fog_alpha);
        d3d_set_fog(false, c_black, 0, 0);
    }
    if (greenflashtimer > 0)
    {
        d3d_set_fog(true, c_lime, 0, 1);
        draw_sprite_ext(other.sprite_index, 6, x + other.xoff, y + other.yoff, image_xscale, image_yscale, image_angle, image_blend, greenflashtimer / 10);
        d3d_set_fog(false, c_black, 0, 0);
    }
}
