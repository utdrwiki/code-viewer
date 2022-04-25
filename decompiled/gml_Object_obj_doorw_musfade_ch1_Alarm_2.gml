global.entrance = 23
instance_create_ch1(0, 0, obj_persistentfadein_ch1)
if (room == room_cc_1f_ch1)
{
    room_goto(room_cc_elevator_ch1)
    global.flag[239] = 1
}
if (room == room_cc_5f_ch1)
{
    room_goto(room_cc_elevator_ch1)
    global.flag[239] = 2
}
if (room == room_cc_elevator_ch1)
{
    if (global.flag[239] == 1)
        room_goto(room_cc_1f_ch1)
    if (global.flag[239] == 2)
        room_goto(room_cc_5f_ch1)
}
if (room == room_forest_castlefront_ch1)
    room_goto(room_cc_entrance_ch1)
if (room == room_cc_entrance_ch1)
    room_goto(room_forest_castlefront_ch1)
