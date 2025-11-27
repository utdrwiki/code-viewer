global.entrance = 23;
instance_create(0, 0, obj_persistentfadein);
event_user(7);
if (room == room_hospital_lobby)
    room_goto(room_town_south);
if (room == room_alphysalley)
    room_goto(room_town_mid);
if (room == room_town_north)
    room_goto(room_beach);
if (room == room_beach)
    room_goto(room_town_north);
if (room == room_town_mid)
{
    if (x > 290 && x < 370)
    {
        global.entrance = 20;
        room_goto(room_lw_icee_pizza);
    }
    if (x > 1730 && x < 1840)
    {
        global.entrance = 23;
        room_goto(room_alphysalley);
    }
}
if (room == room_lw_icee_pizza)
{
    global.entrance = 20;
    room_goto(room_town_mid);
}
if (room == room_town_south)
{
    if (x > 230 && x < 280)
    {
        global.entrance = 22;
        room_goto(room_lw_police);
    }
    if (x > 580 && x < 660)
    {
        global.entrance = 23;
        room_goto(room_hospital_lobby);
    }
}
if (room == room_lw_police)
{
    global.entrance = 22;
    room_goto(room_town_south);
}
if (room == room_dw_castle_east_door)
    room_goto(room_castle_tutorial);
if (room == room_castle_tutorial)
    room_goto(room_dw_castle_east_door);
if (room == room_dw_ralsei_castle_front)
{
    global.entrance = 24;
    room_goto(room_dw_ralsei_castle_1f);
}
if (room == room_dw_ralsei_castle_1f)
{
    if (x > 840 && x < 1000)
    {
        global.entrance = 23;
        room_goto(room_dw_castle_dungeon);
    }
    if (x > 550 && x < 700)
    {
        global.entrance = 24;
        room_goto(room_dw_ralsei_castle_front);
    }
}
if (room == room_dw_ralsei_castle_2f)
{
    if (x > 240 && x < 340)
    {
        global.entrance = 22;
        room_goto(room_dw_castle_rooms_kris);
    }
    if (x > 520 && x < 610)
    {
        global.entrance = 23;
        room_goto(room_dw_castle_rooms_susie);
    }
    if (x > 780 && x < 860)
    {
        global.entrance = 24;
        room_goto(room_cc_lancer);
    }
}
if (room == room_dw_castle_rooms_kris)
{
    global.entrance = 22;
    room_goto(room_dw_ralsei_castle_2f);
}
if (room == room_dw_castle_rooms_susie)
{
    global.entrance = 23;
    room_goto(room_dw_ralsei_castle_2f);
}
if (room == room_cc_lancer)
{
    global.entrance = 24;
    room_goto(room_dw_ralsei_castle_2f);
}
if (room == room_dw_castle_dungeon)
{
    global.entrance = 23;
    room_goto(room_dw_ralsei_castle_1f);
}
if (room == room_library)
{
    if (x > 110 && x < 150)
    {
        global.entrance = 23;
        room_goto(room_lw_computer_lab);
    }
    if (x > 215 && x < 230)
    {
        global.entrance = 20;
        room_goto(room_lw_library_upstairs);
    }
}
if (room == room_lw_library_upstairs)
{
    global.entrance = 20;
    room_goto(room_library);
}
if (room == room_lw_computer_lab)
{
    global.entrance = 23;
    room_goto(room_library);
}
