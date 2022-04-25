global.entrance = 24
instance_create_ch1(0, 0, obj_persistentfadein_ch1)
if (room == room_castle_town_ch1)
    room_goto(room_castle_tutorial_ch1)
if (room == room_castle_tutorial_ch1)
    room_goto(room_castle_town_ch1)
if (room == room_town_south_ch1)
    room_goto(room_library_ch1)
if (room == room_library_ch1)
    room_goto(room_town_south_ch1)
if (room == room_town_church_ch1)
    room_goto(room_townhall_ch1)
if (room == room_townhall_ch1)
    room_goto(room_town_church_ch1)
if (room == room_schoollobby_ch1)
    room_goto(room_town_school_ch1)
if (room == room_town_school_ch1)
    room_goto(room_schoollobby_ch1)
if (room == room_town_mid_ch1)
    room_goto(room_diner_ch1)
if (room == room_diner_ch1)
    room_goto(room_town_mid_ch1)
if (room == room_town_north_ch1)
    room_goto(room_flowershop_1f_ch1)
if (room == room_flowershop_1f_ch1)
    room_goto(room_town_north_ch1)
if (room == room_cc_prisonlancer_ch1)
    room_goto(room_cc_prison_cells_ch1)
if (room == room_cc_prison_cells_ch1)
    room_goto(room_cc_prisonlancer_ch1)
if (room == room_forest_secret1_ch1)
    room_goto(room_forest_dancers1_ch1)
if (room == room_forest_dancers1_ch1)
    room_goto(room_forest_secret1_ch1)
if (room == room_forest_savepoint3_ch1)
    room_goto(room_forest_savepoint_relax_ch1)
if (room == room_forest_savepoint_relax_ch1)
{
    if (global.plot < 120)
        room_goto(room_forest_maze1_ch1)
    else
        room_goto(room_forest_savepoint3_ch1)
}
if (room == room_forest_maze_susie_ch1)
{
    if (y >= (room_height / 2))
    {
        global.flag[292] = 0
        global.flag[291] = 0
        room_goto(room_forest_savepoint_relax_ch1)
    }
    else
        room_goto(room_forest_maze2_ch1)
}
if (room == room_forest_castlefront_ch1)
{
    if (global.plot < 150)
        room_goto_previous()
    else
        room_goto(room_forest_fightsusie_ch1)
}
if (room == room_forest_fightsusie_ch1)
{
    if (global.plot < 150)
        room_goto_next()
    else
        room_goto(room_forest_castlefront_ch1)
}
if (room == room_forest_maze1_ch1 || room == room_forest_maze2_ch1)
{
    if (y >= (room_width / 2))
    {
        global.flag[292] = 0
        if (room == room_forest_maze1_ch1)
        {
            global.flag[291] = 0
            room_goto(room_forest_savepoint_relax_ch1)
        }
        if (room == room_forest_maze2_ch1)
        {
            global.flag[291] = 5
            room_goto(room_forest_maze_susie_ch1)
        }
    }
    else
    {
        with (obj_forestmaze_controller_ch1)
            event_user(0)
    }
}
