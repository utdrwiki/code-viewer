function scr_at_player(arg0 = x, arg1 = y)
{
    return point_direction(arg0, arg1, obj_heart.x + (obj_heart.sprite_width / 2), obj_heart.y + (obj_heart.sprite_height / 2));
}
