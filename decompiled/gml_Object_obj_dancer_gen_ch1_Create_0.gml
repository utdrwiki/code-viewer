areas = 3
areax1[0] = 120
areay1[0] = 100
areax2[0] = 760
areay2[0] = 580
areax1[1] = 880
areay1[1] = 360
areax2[1] = 1360
areay2[1] = 880
areax1[2] = 200
areay1[2] = 720
areax2[2] = 760
areay2[2] = 1360
battlealpha = 0
if (room == room_forest_dancers1_ch1)
{
    for (var i = 0; i < 5; i += 1)
    {
        sc = instance_create_ch1(320, (160 + (80 * i)), obj_scissordancer_ch1)
        with (sc)
        {
            hspeed = 0
            vspeed = -5
        }
    }
    for (i = 0; i < 4; i += 1)
    {
        sc = instance_create_ch1((520 + (80 * i)), 450, obj_scissordancer_ch1)
        with (sc)
        {
            vspeed = 0
            hspeed = -5
        }
    }
    for (i = 0; i < 2; i += 1)
    {
        sc = instance_create_ch1(500, (170 - (80 * i)), obj_scissordancer_ch1)
        with (sc)
        {
            vspeed = 5
            hspeed = 0
        }
    }
    for (i = 0; i < 4; i += 1)
    {
        sc = instance_create_ch1(960, (440 - (80 * i)), obj_scissordancer_ch1)
        with (sc)
            vspeed = 5
    }
    for (i = 0; i < 4; i += 1)
    {
        sc = instance_create_ch1(960, (40 - (80 * i)), obj_scissordancer_ch1)
        with (sc)
            vspeed = 5
    }
    sc = instance_create_ch1(280, 830, obj_scissordancer_ch1)
    with (sc)
    {
        vspeed = -5
        hspeed = 0
    }
    sc = instance_create_ch1(580, 820, obj_scissordancer_ch1)
    with (sc)
    {
        hspeed = 5
        vspeed = 0
    }
    sc = instance_create_ch1(590, 1050, obj_scissordancer_ch1)
    with (sc)
    {
        vspeed = 5
        hspeed = 0
    }
    sc = instance_create_ch1(290, 1060, obj_scissordancer_ch1)
    with (sc)
    {
        hspeed = -5
        vspeed = 0
    }
}
if (room == room_cc_4f_ch1)
{
    areax1[0] = 260
    areay1[0] = 40
    areax2[0] = 1120
    areay2[0] = 820
    areas = 1
}
tile_fade = false
if (room == room_forest_dancers1_ch1 || room == room_cc_4f_ch1)
{
    alpha_changed = false
    tile_fade = true
    tilearray = tile_get_ids_at_depth_ch1(777777)
    for (i = 0; i < array_length_1d(tilearray); i++)
        tile_set_alpha_ch1(tilearray[i], 0)
}
