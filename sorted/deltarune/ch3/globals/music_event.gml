function scr_create_music_event_manager(arg0, arg1)
{
    var __mem = instance_create(0, 0, obj_music_event_manager);
    __mem.track1_instance = arg0;
    __mem.bpm = arg1;
    return __mem;
}

function scr_music_event_add(arg0, arg1, arg2, arg3 = true, arg4 = 4)
{
    scr_music_event_add_instance(id, arg0, arg1, arg2, arg3, arg4);
}

function scr_music_event_add_instance(arg0, arg1, arg2, arg3, arg4 = true, arg5 = 4)
{
    if (arg4)
        arg1 = scr_round_to_mem_beat(arg1, arg5);
    if (!i_ex(obj_music_event_manager))
        instance_create(0, 0, obj_music_event_manager);
    with (obj_music_event_manager)
    {
        event_id[event_count] = arg0;
        event_time[event_count] = arg1;
        event_var[event_count] = arg2;
        event_value[event_count] = arg3;
        event_count++;
    }
}

function scr_music_userevent_add(arg0, arg1, arg2 = true, arg3 = 4)
{
    scr_music_event_add_instance(id, arg0, "event", arg1);
}

function scr_music_userevent_add_instance(arg0, arg1, arg2, arg3 = true, arg4 = 4)
{
    scr_music_event_add_instance(arg0, arg1, "event", arg2);
}

function scr_music_beat_event(arg0, arg1, arg2 = true)
{
    scr_music_beat_event_instance(id, arg0, arg1, arg2);
}

function scr_music_beat_userevent(arg0, arg1 = true)
{
    scr_music_beat_event_instance(id, "event", arg0, arg1);
}

function scr_music_beat_event_instance(arg0, arg1, arg2, arg3 = true)
{
    if (!i_ex(obj_music_event_manager))
        instance_create(0, 0, obj_music_event_manager);
    with (obj_music_event_manager)
    {
        if (arg3)
        {
            beat_event = true;
            next_beat = round(trackpos / 0.2608695652173913) * 0.2608695652173913;
        }
        beat_id = arg0;
        beat_var = arg1;
        beat_value = arg2;
    }
}

function scr_music_beat_userevent_instance(arg0, arg1, arg2 = true)
{
    scr_music_beat_event_instance(arg0, "event", arg1, arg2);
}

function scr_set_music_beat_time(arg0, arg1 = 0)
{
    if (arg1 == 0)
    {
        with (obj_music_event_manager)
            beat_event = arg0;
    }
    else
    {
        scr_music_beat_event_instance(obj_music_event_manager, arg1, "beat_event", arg0);
    }
}

function scr_music_event_get_current_music()
{
    with (obj_music_event_manager)
    {
        track1_instance = global.currentsong[1];
        track2_instance = mus_loop(track2);
    }
}

function scr_round_to_mem_beat(arg0, arg1 = 4)
{
    return scr_round_to_beat(arg0, obj_music_event_manager.bpm, arg1);
}

function scr_music_event_clear()
{
    event_id = [];
    event_time = [];
    event_var = [];
    event_value = [];
    event_count = 0;
}
