var rep = 1;
if (turn_type == "short start" || turn_type == "short mid")
    rep = 6;
repeat (6)
{
    if (circle_val < 5)
    {
        circle_val++;
        with (instance_create(x, y, obj_knight_weird_circle))
        {
            angle = (360 / other.circle_goal) * ds_list_size(other.circle_list);
            distance = other.circle_distance;
            spin = other.spin;
            master = other.id;
            alarm[0] = 6;
            ds_list_add(other.circle_list, id);
            if (other.turn_type == "short start" || other.turn_type == "short mid")
                hellzone = true;
        }
        alarm[0] = init_start;
    }
    else
    {
        alarm[1] = init;
        if (turn_type == "short start" || turn_type == "short mid")
            alarm[1] = 1;
    }
}
