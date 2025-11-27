var doublecheck = collision_rectangle(bbox_left + boxmargin, bbox_top + boxmargin, bbox_right - boxmargin, bbox_bottom - boxmargin, obj_green_cat, false, true);
if (!instance_exists(doublecheck))
    exit;
if (x < 640)
{
    var _explosion = instance_create_depth(x, y, depth - 4, obj_animation);
    snd_play(snd_badexplosion, 0.25);
    _explosion.sprite_index = spr_realisticexplosion;
    scr_shakescreen(8, 8);
}
with (other)
    instance_destroy();
instance_destroy();
