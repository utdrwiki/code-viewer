if (!init)
{
    if (lightBullet)
    {
        image_blend = c_orange;
        var _sprite_index = sprite_index;
        sprite_index = dark_sprite;
        dark_sprite = _sprite_index;
    }
    else
    {
        image_blend = c_fuchsia;
    }
    init = true;
    active = true;
    if (special == 1)
    {
        gravity = 0.15;
        gravity_direction = direction - 180;
        destroytimer = scr_gettime_fromvelocity(0.15, speed) * 2;
    }
}
if (collision_ellipse(bbox_left - 20, bbox_top - 20, bbox_right + 20, bbox_bottom + 20, obj_dw_church_pushableshelf_3x3, false, true))
    instance_destroy();
if (despawning)
{
    image_alpha -= 0.1;
    if (image_alpha <= 0)
        instance_destroy();
}
if (image_alpha < 1)
    image_alpha += 0.1;
