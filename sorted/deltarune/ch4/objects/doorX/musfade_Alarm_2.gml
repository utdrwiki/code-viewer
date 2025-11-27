global.entrance = 24;
instance_create(0, 0, obj_persistentfadein);
event_user(7);
if (room == room_castle_tutorial)
    room_goto(room_dw_castle_town);
if (room == room_town_krisyard)
    room_goto(room_torhouse);
if (room == room_torhouse)
{
    if (global.chapter == 4 && global.plot == 15)
        room_goto(room_lw_church_entrance);
    else
        room_goto(room_town_krisyard);
}
if (room == room_town_school)
    room_goto(room_schoollobby);
if (room == room_schoollobby)
    room_goto(room_town_school);
if (global.chapter >= 2)
{
    if (room == room_dw_castle_town)
        room_goto(room_shop1);
    if (room == room_dw_castle_town && global.flag[1661] > 0 && y >= 1500)
        room_goto(room_dw_castle_area_1);
}
