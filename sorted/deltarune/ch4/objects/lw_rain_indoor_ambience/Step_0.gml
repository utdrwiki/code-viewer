if (!init)
{
    if (array_length(global.currentsong) <= 2 || !snd_is_playing(global.currentsong[3]))
    {
        global.currentsong[2] = snd_init("raining.ogg");
        global.currentsong[3] = mus_loop(global.currentsong[2]);
        global.currentsong[4] = snd_init("raining_in_church2.ogg");
        global.currentsong[5] = mus_loop(global.currentsong[4]);
        mus_volume(global.currentsong[3], 0, 0);
        mus_volume(global.currentsong[5], 0.75, 14);
    }
    else if (global.flag[794] != 3)
    {
        mus_volume(global.currentsong[5], 0.75, 0);
    }
    global.flag[794] = 2;
    init = true;
}
if (global.interact == 3 && !room_exit)
{
    room_door = true;
    var _found = false;
    with (obj_doorAny)
    {
        if (touched == 1 && doorRoom == room_town_school)
        {
            _found = true;
            break;
        }
    }
    if (!_found && room == room_alphysalley)
    {
        with (obj_doorW)
        {
            if (touched == 1)
            {
                _found = true;
                break;
            }
        }
    }
    if (!_found)
    {
        with (obj_doorX_musfade)
        {
            if (touched == 1)
            {
                _found = true;
                break;
            }
        }
    }
    if (_found)
        event_user(2);
}
