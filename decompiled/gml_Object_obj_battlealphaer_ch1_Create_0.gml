global.charinstance[0] = obj_mainchara_ch1
global.charinstance[1] = global.cinstance[0]
global.charinstance[2] = global.cinstance[1]
battlealpha = 0
active = false
tile_fade = false
fadeplease = false
if (room == room_forest_starwalker_ch1)
    fadeplease = true
if (room == room_forest_maze1_ch1)
    fadeplease = true
if (room == room_forest_maze2_ch1)
    fadeplease = true
if (room == room_dark_wobbles_ch1)
    fadeplease = true
if (fadeplease == true)
{
    tile_layer_amount = 777777
    if (room == room_forest_maze1_ch1 || room == room_forest_maze2_ch1)
        tile_layer_amount = 222222
    alpha_changed = false
    tile_fade = true
    tilearray = tile_get_ids_at_depth_ch1(tile_layer_amount)
    for (var i = 0; i < array_length_1d(tilearray); i++)
        tile_set_alpha_ch1(tilearray[i], 0)
}
