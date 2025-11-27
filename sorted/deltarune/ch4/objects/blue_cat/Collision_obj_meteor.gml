var doublecheck = collision_rectangle(bbox_left + boxmargin, bbox_top + boxmargin + 10, bbox_right - boxmargin, bbox_bottom - boxmargin - 4, obj_meteor, false, true);
if (!instance_exists(doublecheck))
    exit;
if (x < 640)
{
    var _explosion = instance_create_depth(x, y, depth - 4, obj_animation);
    snd_play(snd_badexplosion, 0.25);
    _explosion.sprite_index = spr_realisticexplosion;
    scr_shakescreen(8, 8);
    with (instance_create(x, y, obj_green_cat))
    {
        direction = other.direction;
        speed = other.speed;
        friction = 0.2;
        image_angle = other.image_angle;
    }
    with (other)
        instance_destroy();
    instance_destroy();
}
else
{
    with (other)
        instance_destroy();
}
