if (init == false)
{
    if (count == 0)
    {
        obj_traffic_switch.groupcheck = swapgroup
        obj_traffic_switch.bossidcheck = id
        boss = true
        with (obj_traffic_switch)
        {
            if (swapgroup == groupcheck)
            {
                bossid = bossidcheck
                bossid.allcount++
                bossid.countid[count] = id
                bossid.counttimer[count] = default_time
                bossid.counttype[count] = type
            }
        }
        obj_traffic_switch.allcountcheck = allcount
        with (obj_traffic_switch)
        {
            if (swapgroup == groupcheck)
                allcount = allcountcheck
        }
    }
    init = true
}
if (myinteract == 1)
{
    myinteract = 0
    with (obj_mainchara)
        onebuffer = 5
}
if (active == true && (global.interact == 0 || i_ex(obj_cutscene_master)))
{
    timer--
    if (timer <= 0)
    {
        timer = (default_time * timefactor)
        active = false
        snd_play(snd_noise)
        if instance_exists(obj_traffic_car)
            obj_traffic_car.groupcheck = group
        if instance_exists(obj_traffic_car_generator)
            obj_traffic_car_generator.groupcheck = group
        with (obj_traffic_car)
        {
            if (group == groupcheck)
            {
                walking = false
                active = true
            }
        }
        with (obj_traffic_car_generator)
        {
            if (group == groupcheck)
            {
                walking = false
                active = true
            }
        }
        if instance_exists(obj_cybercity_bg_trafficlight_shine)
        {
            var group_check = group
            with (obj_cybercity_bg_trafficlight_shine)
            {
                if (group == group_check)
                    stop = 0
            }
        }
    }
}
if clear_traffic
{
    if i_ex(obj_traffic_car)
    {
        with (obj_traffic_car)
        {
            y += myspeed
            if (y >= ((cameray() + view_hport[0]) + 100))
                instance_destroy()
        }
    }
    else
        clear_traffic = false
}
pressbuffer--
