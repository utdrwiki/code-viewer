global.entrance = 23;
instance_create(0, 0, obj_persistentfadein);
event_user(7);
if (room == room_town_mid)
{
    if (x > 1000 && x < 1140)
    {
        global.entrance = 22;
        room_goto(room_lw_conbini);
    }
}
if (room == room_lw_conbini)
{
    global.entrance = 22;
    room_goto(room_town_mid);
}
if (room == room_lw_police)
{
    global.entrance = 22;
    room_goto(room_town_south);
}
if (room == room_castle_tutorial)
    room_goto(room_shop_music);
