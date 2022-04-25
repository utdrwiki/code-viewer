global.entrance = 24
instance_create_ch1(0, 0, obj_persistentfadein_ch1)
if (room == room_castle_town_ch1)
    room_goto(room_castle_tutorial_ch1)
if (room == room_castle_tutorial_ch1)
    room_goto(room_castle_town_ch1)
if (room == room_field_shop1_ch1)
    room_goto(room_shop1_ch1)
if (room == room_man_ch1)
    room_goto(room_forest_savepoint2_ch1)
if (room == room_forest_area5_ch1)
{
    ch = ceil(random(50))
    if (ch == 50 && global.flag[910] == 0)
        room_goto(room_man_ch1)
    else
        room_goto(room_forest_starwalker_ch1)
}
if (room == room_town_krisyard_ch1)
    room_goto(room_torhouse_ch1)
if (room == room_torhouse_ch1)
    room_goto(room_town_krisyard_ch1)
if (room == room_town_school_ch1)
    room_goto(room_schoollobby_ch1)
if (room == room_schoollobby_ch1)
    room_goto(room_town_school_ch1)
if (room == room_cc_1f_ch1)
{
    if (x >= 1300)
        room_goto(room_cc_prisonelevator_ch1)
    else
        snd_play_ch1(snd_error_ch1)
}
if (room == room_cc_5f_ch1)
    room_goto(room_shop2_ch1)
if (room == room_cc_prisonelevator_ch1)
{
    if (global.flag[239] == 0)
        room_goto(room_cc_prison_to_elevator_ch1)
    if (global.flag[239] == 1)
        room_goto(room_cc_1f_ch1)
    if (global.flag[239] == 2)
        room_goto(room_cc_5f_ch1)
    if (global.flag[239] == 3)
        room_goto(room_cc_prison_prejoker_ch1)
}
if (room == room_cc_prison_to_elevator_ch1)
{
    global.flag[239] = 0
    room_goto(room_cc_prisonelevator_ch1)
}
if (room == room_cc_1f_ch1)
{
    global.flag[239] = 1
    room_goto(room_cc_prisonelevator_ch1)
}
if (room == room_cc_prison_prejoker_ch1)
{
    global.flag[239] = 3
    room_goto(room_cc_prisonelevator_ch1)
}
if (room == room_cc_entrance_ch1)
    room_goto(room_forest_castlefront_ch1)
