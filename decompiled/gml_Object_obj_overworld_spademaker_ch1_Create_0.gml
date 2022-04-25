timer = 0
darkamt = 0
with (obj_mainchara_ch1)
    battlemode = 1
global.charinstance[0] = obj_mainchara_ch1
alarm[0] = 5
side = 0
homing = 0
if (room == room_dark_chase2_ch1)
    homing = 2
if (room == room_forest_chase1_ch1)
    homing = 3
if (room == room_forest_chase2_ch1)
    homing = 4
sidespade[0] = 4732847832
sidespade[1] = 4732847832
intensity = 0
tile_fade = false
if (room == room_forest_chase1_ch1 || room == room_forest_chase2_ch1 || room == room_dark_chase1_ch1)
{
    alpha_changed = false
    tile_fade = true
    tile_layer_choice = 99999
    tilearray = tile_get_ids_at_depth_ch1(tile_layer_choice)
    for (var i = 0; i < array_length_1d(tilearray); i++)
        tile_set_alpha_ch1(tilearray[i], 0)
}
