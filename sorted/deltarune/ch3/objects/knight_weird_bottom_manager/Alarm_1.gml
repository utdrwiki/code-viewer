if (local_turntimer < 80)
{
    with (obj_knight_weird_circle)
    {
        scr_lerpvar("image_alpha", image_alpha, 0, 32);
        scr_script_delayed(instance_destroy, 32);
    }
    x = anchor_x;
    y = anchor_y;
    if (turn_type == "full")
    {
        alarm[2] = 40;
        scr_script_delayed(scr_lerpvar, 20, "image_index", 5, 8, 8);
        scr_script_delayed(scr_var, 20, "image_alpha", 1);
    }
    else
    {
        alarm[2] = 32;
        if (turn_type == "short start" || turn_type == "short mid" || turn_type == "start")
        {
            switch (next_up)
            {
                case 1:
                    alarm[2] = 1;
                    break;
                case 2:
                    alarm[2] = 12;
                    break;
                case 3:
                    alarm[2] = 18;
                    break;
                case 4:
                    alarm[2] = 1;
                    break;
            }
        }
        if (turn_type == "end" || turn_type == "short end")
        {
            scr_lerpvar("image_index", image_index, 8, 8);
            image_alpha = 1;
        }
    }
    exit;
}
with (ds_list_find_value(circle_list, 0))
{
    alarm[1] = (18 * other.amount) - (4 * max(other.amount - 1, 0));
    rgb_rate = alarm[1];
}
if (amount > 1)
{
    with (ds_list_find_value(circle_list, 1))
    {
        alarm[1] = (18 * other.amount) - (4 * max(other.amount - 1, 0));
        rgb_rate = alarm[1];
    }
}
if (amount > 2)
{
    with (ds_list_find_value(circle_list, 2))
    {
        alarm[1] = (18 * other.amount) - (4 * max(other.amount - 1, 0));
        rgb_rate = alarm[1];
    }
}
repeat (1)
{
    ds_list_add(circle_list, ds_list_find_value(circle_list, 0));
    ds_list_delete(circle_list, 0);
}
alarm[1] = ((18 * amount) - (4 * max(amount - 1, 0))) + (2 * irandom(3));
var newspin = choose(-12, 12);
scr_lerpvar("spin", spin, newspin, (alarm[1] / 2) - 2, 2, "inout");
scr_script_delayed(scr_lerpvar, (alarm[1] / 2) - 2, "spin", newspin, 1 * sign(newspin), (alarm[1] / 2) - 2, 2, "inout");
