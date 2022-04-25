snd_pitch_time = function(argument0, argument1, argument2) //gml_Script_snd_pitch_time
{
    with (obj_lerppitch)
    {
        if (sndtarget == argument0)
            instance_destroy()
    }
    var pitchthing = instance_create(0, 0, obj_lerppitch)
    pitchthing.sndtarget = argument0
    pitchthing.targetpitch = argument1
    pitchthing.maxframes = argument2
    with (pitchthing)
        event_user(0)
    return;
}

