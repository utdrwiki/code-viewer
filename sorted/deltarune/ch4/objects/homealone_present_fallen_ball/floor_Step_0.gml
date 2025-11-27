if (!i_ex(obj_homealone_dess_closet_kris))
    exit;
if (!push)
{
    var push_type = 0;
    if ((x - (sprite_width / 2)) < (obj_homealone_dess_closet_kris.x + 5))
    {
        if (collision_rectangle(x - (sprite_width / 2) - 20, y - (sprite_height / 2), x - (sprite_width / 2) - 20, y + (sprite_height / 2), obj_homealone_dess_closet_kris, false, true))
            push_type = 1;
    }
    if ((x + (sprite_width / 2)) > (obj_homealone_dess_closet_kris.x + 18))
    {
        if (collision_rectangle(x - (sprite_width / 2), y - (sprite_height / 2), x - (sprite_width / 2), y + (sprite_height / 2), obj_homealone_dess_closet_kris, false, true))
            push_type = 2;
    }
    if (push_type > 0)
    {
        push = true;
        var random_offset = irandom(8);
        target_x = (push_type == 1) ? (x - 20 - random_offset) : (x + 20 + random_offset);
    }
}
else
{
    x = scr_movetowards(x, target_x, 0.8);
    if (abs(x - target_x) < 0.1 || x >= 300 || x <= 115)
        push = false;
}
