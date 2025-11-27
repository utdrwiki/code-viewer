overlay_surface = -4;
overlay_sprite = -4;
is_init = false;
if (room == room_town_krisyard_dark)
    is_init = true;
kr_target = -4;
su_target = -4;
y_offset = -80;
if (room == room_town_krisyard_dark)
{
    is_init = true;
    y_offset = 0;
}
window_pos[0][0] = 125;
window_pos[0][1] = 236 + y_offset;
window_pos[1][0] = 199;
window_pos[1][1] = 236 + y_offset;
for (var i = 0; i < array_length(window_pos); i++)
{
    var _x = window_pos[i][0];
    var _y = window_pos[i][1];
    var _marker = scr_marker(_x, _y, bg_building_krishouse_window_night);
    with (_marker)
        scr_depth();
}
depth = 1000;
