event_inherited();
state = "nothing";
timer = 0;
wait_time = 60;
attached = false;
image_speed = 0;
patience = 0;
stickiness = 0;
destroyonhit = false;
canjump = true;

hop_trajectory = function()
{
    var targ_x = clamp(obj_heart.x + 8, scr_get_box(2) + 30, scr_get_box(0) - 30);
    var targ_y = clamp(obj_heart.y + 8, scr_get_box(1) + 30, scr_get_box(3) - 30);
    var fly_list = ds_list_create();
    var fly_distance = 999;
    var _fly = -4;
    with (obj_ribbick_battle_fly)
    {
        if (x > scr_get_box(2) && x < scr_get_box(0) && y > scr_get_box(1) && y < scr_get_box(3))
            ds_list_add(fly_list, id);
    }
    for (a = 0; a < ds_list_size(fly_list); a++)
    {
        if (point_distance(x, y, ds_list_find_value(fly_list, a).x, ds_list_find_value(fly_list, a).y) < fly_distance)
        {
            _fly = ds_list_find_value(fly_list, a);
            fly_distance = point_distance(x, y, ds_list_find_value(fly_list, a).x, ds_list_find_value(fly_list, a).y);
        }
    }
    ds_list_destroy(fly_list);
    if (_fly != -4)
    {
        targ_x = clamp(_fly.x, scr_get_box(2) + 30, scr_get_box(0) - 30);
        targ_y = clamp(_fly.y, scr_get_box(1) + 30, scr_get_box(3) - 30);
    }
    var first_aim = point_direction(x, y, targ_x, targ_y);
    if (first_aim > 270)
        return 0;
    else if (first_aim > 180)
        return 180;
    else
        return clamp(first_aim, 0, 180);
};
