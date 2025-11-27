auto_talk = false;
convo_index = 0;
if (room == room_dw_couch_overworld_03)
    convo_index = 2;
if (room == room_dw_couch_overworld_04)
    convo_index = 3;
if (room == room_dw_couch_overworld_05)
    convo_index = 5;
parallel_active = true;
start_convo = false;
talk_timer = 0;
convo_queue = 0;
marker_index = 0;
check_point = true;
current_convo = -1;
current_line_index = 0;
var markers = layer_get_all_elements("DIALOGUE_MARKERS");
for (var i = 0; i < array_length(markers); i++)
{
    if (layer_get_element_type(markers[i]) == 4)
        dialogue_marker[i] = new Vector2(layer_sprite_get_x(markers[i]), layer_sprite_get_y(markers[i]));
}
layer_set_visible("DIALOGUE_MARKERS", 0);
instance_create(0, 0, obj_ch3_PGS01B_slide_check);
