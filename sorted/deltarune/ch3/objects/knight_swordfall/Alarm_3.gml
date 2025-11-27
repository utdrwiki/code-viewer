if (next_up != -999)
{
    var knight = -4;
    switch (next_up)
    {
        case 1:
            knight = 366;
            break;
        case 2:
            knight = 670;
            break;
        case 3:
            knight = 803;
            break;
        case 5:
            knight = 1174;
            break;
    }
    var new_knight = instance_create(x, y, knight);
    scr_bullet_inherit(new_knight);
    new_knight.creatorid = creatorid;
    new_knight.creator = creator;
    with (new_knight)
    {
        turn_type = "end";
        if (other.turn_segment == 0)
        {
            turn_type = "short mid";
            turn_segment = 1;
            next_up = other.next_next_up;
        }
        if (other.turn_segment == 1)
        {
            turn_type = "short end";
            turn_segment = 2;
        }
        anchor_x = other.anchor_x;
        anchor_y = other.anchor_y;
        event_user(0);
        if (knight == 803)
        {
            timer = -8;
            fake_timer = -8;
        }
        if (knight == 1174)
        {
            with (instance_create_depth(x, y, depth, obj_knight_warp))
            {
                master = other.id;
                event_user(1);
            }
            knight.alarm[0] = 1;
        }
    }
}
instance_destroy();
