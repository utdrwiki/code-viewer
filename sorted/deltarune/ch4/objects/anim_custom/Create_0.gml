target_obj = -4;
event_handler = -4;
anim_active = false;
anim_timestamps = [];
anim_modifier = 30;
anim_index = 0;
anim_timer = 0;
anim_events = [];

init = function(arg0, arg1, arg2, arg3 = 30)
{
    target_obj = arg0;
    target_obj.sprite_index = arg1;
    target_obj.image_index = 0;
    target_obj.image_speed = 0;
    anim_timestamps = arg2;
    anim_modifier = arg3;
    anim_timer = anim_timestamps[anim_index] / anim_modifier;
};

start = function()
{
    anim_active = true;
};

stop = function()
{
    anim_active = false;
    trigger_event("anim_end");
};

trigger_event = function(arg0, arg1 = -1)
{
    for (var i = 0; i < array_length(anim_events); i++)
    {
        var _event = anim_events[i][0];
        var _callback = anim_events[i][1];
        var _condition = anim_events[i][2];
        var _args = anim_events[i][3];
        if (_event == arg0)
        {
            if (_condition == arg1)
            {
                if (array_length(_args) == 0)
                    _callback();
                else if (array_length(_args) == 1)
                    _callback(_args[0]);
                else if (array_length(_args) == 2)
                    _callback(_args[0], _args[1]);
                else if (array_length(_args) == 3)
                    _callback(_args[0], _args[1], _args[2]);
            }
        }
    }
};

reset = function()
{
    target_obj = -4;
    anim_active = false;
    anim_timestamps = [];
    anim_modifier = 30;
    anim_index = 0;
    anim_timer = 0;
    anim_events = [];
};

is_playing = function()
{
    return anim_active;
};

anim_event = function(arg0, arg1, arg2, arg3)
{
    var event = [];
    event[0] = arg0;
    event[1] = arg1;
    event[2] = arg2;
    event[3] = arg3;
    return event;
};

event_connect = function(arg0, arg1, arg2 = -1, arg3 = [])
{
    var _event = anim_event(arg0, arg1, arg2, arg3);
    anim_events[array_length(anim_events)] = _event;
};
