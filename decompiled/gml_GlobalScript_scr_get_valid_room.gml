scr_get_valid_room = function(argument0, argument1, argument2) //gml_Script_scr_get_valid_room
{
    if (argument2 == undefined)
        argument2 = 0
    var chapter = argument0
    var room_index = argument1
    var plot = argument2
    var current_room = new scr_valid_room(room_index, plot)
    if (chapter == 1)
        var valid_rooms = [new scr_valid_room(room_krisroom_ch1, 0), new scr_valid_room(room_dark1a_ch1, 11), new scr_valid_room(room_dark_eyepuzzle_ch1, 11), new scr_valid_room(room_castle_town_ch1, 16), new scr_valid_room(room_field_start_ch1, 33), new scr_valid_room(room_field_shop1_ch1, 42), new scr_valid_room(room_field_checkers3_ch1, 55), new scr_valid_room(room_field_checkers7_ch1, 55), new scr_valid_room(room_forest_savepoint1_ch1, 60), new scr_valid_room(room_forest_savepoint2_ch1, 75), new scr_valid_room(room_forest_savepoint_relax_ch1, 75), new scr_valid_room(room_forest_savepoint3_ch1, 120), new scr_valid_room(room_forest_fightsusie_ch1, 130), new scr_valid_room(room_cc_prison_to_elevator_ch1, 156), new scr_valid_room(room_cc_1f_ch1, 165), new scr_valid_room(room_cc_5f_ch1, 165), new scr_valid_room(room_cc_throneroom_ch1, 175), new scr_valid_room(room_cc_prison_prejoker_ch1, 156), new scr_valid_room(room_field_maze_ch1, 0)]
    if (chapter == 2)
        valid_rooms = [new scr_valid_room(room_krisroom, 0), new scr_valid_room(room_dw_castle_area_2, 0), new scr_valid_room(room_dw_castle_area_2_transformed, 0), new scr_valid_room(room_dw_cyber_intro_connector, 0), new scr_valid_room(room_dw_cyber_savepoint, 0), new scr_valid_room(room_dw_cyber_queen_boxing, 0), new scr_valid_room(room_dw_cyber_musical_shop, 0), new scr_valid_room(room_dw_city_entrance, 0), new scr_valid_room(room_dw_city_hacker, 0), new scr_valid_room(room_dw_city_mice3, 0), new scr_valid_room(room_dw_city_savepoint, 0), new scr_valid_room(room_dw_city_berdly, 0), new scr_valid_room(room_dw_city_postbaseball_1, 0), new scr_valid_room(room_dw_mansion_lightner_hallway, 0), new scr_valid_room(room_dw_mansion_entrance, 0), new scr_valid_room(room_dw_mansion_east_3f, 0), new scr_valid_room(room_dw_mansion_acid_tunnel_exit, 0), new scr_valid_room(room_dw_mansion_b_central, 0), new scr_valid_room(room_dw_mansion_east_4f_d, 0), new scr_valid_room(room_dw_mansion_prefountain, 0)]
    var is_valid = 0
    var i = 0
    while (i < array_length_1d(valid_rooms))
    {
        if (current_room.room_index == valid_rooms[i].room_index)
        {
            is_valid = 1
            show_debug_message(("1 found matching room: " + string(room_get_name(current_room.room_index))))
            break
        }
        else
        {
            i++
            continue
        }
    }
    if (!is_valid)
    {
        current_room.room_index++
        i = 0
        while (i < array_length_1d(valid_rooms))
        {
            if (current_room.room_index == valid_rooms[i].room_index)
            {
                is_valid = 1
                show_debug_message(("2 found matching adjusted room: " + string(room_get_name(current_room.room_index))))
                break
            }
            else
            {
                i++
                continue
            }
        }
    }
    if (!is_valid)
    {
        current_room.room_index--
        show_debug_message(("trying to load invalid room: " + string(room_get_name(current_room.room_index))))
    }
    return current_room.room_index;
}

scr_valid_room = function(argument0, argument1) constructor //gml_Script_scr_valid_room
{
    room_index = argument0
    plot = argument1
}

scr_add_valid_room = function(argument0, argument1, argument2) constructor //gml_Script_scr_add_valid_room
{
}

