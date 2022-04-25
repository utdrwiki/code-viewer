myinteract = 1
if (active == true && pressbuffer < 0)
    timer = 0
if (global.facing != 0 && active == false && pressbuffer <= 0)
{
    snd_play(snd_noise)
    timer = (default_time * timefactor)
    pressbuffer = 2
    active = true
    if (deleteCars != false)
    {
        with (obj_traffic_car)
        {
            if (place_meeting(x, y, obj_carKiller) && (!scr_onscreen(id)))
            {
                instance_destroy()
                debug_message((string(id) + " obliterated by obj_carKiller"))
            }
        }
    }
    obj_traffic_switch.bgroupcheck = group
    obj_traffic_switch.notme = 1
    notme = 0
    with (obj_traffic_switch)
    {
        if (group == bgroupcheck && notme == 1)
        {
            pressbuffer = 2
            timer = (default_time * timefactor)
            active = false
        }
    }
    if instance_exists(obj_traffic_car)
        obj_traffic_car.groupcheck = group
    if instance_exists(obj_traffic_car_generator)
        obj_traffic_car_generator.groupcheck = group
    if instance_exists(obj_cybercity_bg_trafficlight_shine)
    {
        var group_check = group
        with (obj_cybercity_bg_trafficlight_shine)
        {
            if (group == group_check)
                stop = 1
        }
    }
    if (type == 0)
    {
        with (obj_traffic_car)
        {
            if (group == groupcheck)
                active = false
        }
        with (obj_traffic_car_generator)
        {
            if (group == groupcheck)
                active = false
        }
    }
    if (type == 1)
    {
        with (obj_traffic_car)
        {
            if (group == groupcheck)
            {
                walking = true
                active = true
            }
        }
        with (obj_traffic_car_generator)
        {
            if (group == groupcheck)
            {
                walking = true
                active = true
            }
        }
    }
    if (room == room_dw_city_traffic_4 && global.plot == 80)
    {
        with (obj_ch2_city_car_b)
            con = 0
    }
}
if (type == 2)
{
    with (obj_traffic_car_generator)
        active = false
    fade = 0
    active = false
    clear_traffic = true
    if (room == room_dw_city_traffic_4 && global.plot == 85)
    {
        with (obj_ch2_city_car_b)
            con = 0
    }
}
