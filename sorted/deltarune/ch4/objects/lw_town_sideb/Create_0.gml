if (!scr_sideb_active() || global.plot < 95 || global.plot >= 105)
{
    instance_destroy();
    exit;
}
con = -1;
customcon = 0;
dialogue_progress = scr_flag_get(1528);
target_pos = [];
target_con = -1;
talk_point = [];
susie_overlay = -4;
talk_point[0][0] = 24;
talk_point[0][1] = [770, 220];
talk_point[0][2] = 10;
talk_point[1][0] = 28;
talk_point[1][1] = [340, 150];
talk_point[1][2] = 20;
if (dialogue_progress >= array_length(talk_point))
{
    instance_destroy();
    exit;
}
var current_talk_point = talk_point[dialogue_progress];
var target_room = current_talk_point[0];
_trigger = -4;
if (room == target_room)
{
    con = 0;
    target_pos = current_talk_point[1];
    target_con = current_talk_point[2];
    _trigger = instance_create(target_pos[0], target_pos[1], obj_trigger);
    with (_trigger)
        image_xscale = 14;
}

continue_scene = function()
{
    con = 39;
    alarm[0] = 90;
};
