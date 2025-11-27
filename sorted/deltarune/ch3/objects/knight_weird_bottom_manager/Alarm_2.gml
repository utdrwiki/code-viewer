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
        case 4:
            knight = 631;
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
        if (knight == 366)
            knight.timer = knight.spawn_speed;
        anchor_x = other.anchor_x;
        anchor_y = other.anchor_y;
        event_user(0);
        if (knight == 631)
            knight.countdowner = 10;
        with (instance_create_depth(x, y, depth, obj_knight_warp))
        {
            master = other.id;
            event_user(0);
        }
    }
}
instance_destroy();
