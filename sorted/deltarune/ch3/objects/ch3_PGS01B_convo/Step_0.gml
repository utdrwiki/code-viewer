if (!parallel_active)
    exit;
if (check_point)
{
    if (point_distance(dialogue_marker[marker_index].x, dialogue_marker[marker_index].y, obj_mainchara.x, obj_mainchara.y) < 90)
    {
        convo_queue++;
        marker_index++;
        if (marker_index >= array_length_1d(dialogue_marker))
            check_point = false;
    }
}
if (!start_convo && convo_queue > 0 && !d_ex())
{
    convo_queue--;
    start_convo = true;
    current_convo = scr_get_parallel_convo(convo_index);
    current_line_index = 0;
    scr_flag_set(7, 1);
}
if (start_convo && !d_ex())
{
    if (current_line_index >= array_length_1d(current_convo))
    {
        start_convo = false;
        convo_index++;
        exit;
    }
    var current_line = current_convo[current_line_index];
    scr_speaker(current_line.speaker);
    msgset(0, current_line.dialogue);
    var d = d_make();
    d.zurasu = 1;
    d.stay = 5;
    d.side = scr_parallel_convo_get_side();
    auto_talk = true;
    current_line_index++;
    talk_timer = 0;
}
if (auto_talk)
{
    if (!d_ex())
    {
        auto_talk = false;
        scr_flag_set(7, 0);
        if (room == room_dw_couch_overworld_05)
            scr_flag_set(734, 1);
        exit;
    }
    if (!i_ex(obj_writer))
        exit;
    with (obj_writer)
        skippable = 0;
    if (obj_writer.halt == 0)
        exit;
    talk_timer++;
    var max_timer = (global.lang == "ja") ? 80 : 60;
    if (talk_timer >= max_timer)
    {
        with (obj_writer)
            forcebutton1 = 1;
        talk_timer = 0;
    }
}
