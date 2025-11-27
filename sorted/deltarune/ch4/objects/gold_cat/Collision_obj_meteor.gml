var doublecheck = collision_rectangle(bbox_left + boxmargin, bbox_top + boxmargin + 10, bbox_right - boxmargin, bbox_bottom - boxmargin - 4, obj_meteor, false, true);
if (!instance_exists(doublecheck))
    exit;
with (instance_create(x, y, obj_gold_cat_aura))
    level = other.level;
scr_sparkle_colour(8, 65535);
with (obj_blue_cat)
{
}
snd_play(snd_boost);
instance_destroy();
