if (!tutorial_ready)
{
    debug_print("tutorial not ready to advance!");
    exit;
}
tutorial++;
tutorial_ready = false;
if (tutorial == 1)
{
    timer = 0;
    debug_print("Tutorial: How to play");
    difficulty = 5;
    show_chart = 1;
    auto_play = 1;
    song_id = 3;
    intro_con = 2;
    loadsong = 1;
    with (obj_rhythmgame_chart)
        auto_play = true;
    alarm[0] = 20;
}
else if (tutorial == 2)
{
    scr_rhythmgame_toggle_notes(true);
    debug_print("Tutorial: Spawn notes");
    alarm[0] = 60;
}
else if (tutorial == 3)
{
    timer = 1;
    debug_print("Tutorial: Ignore your friends");
    alarm[0] = 20;
}
else if (tutorial == 4)
{
    debug_print("Tutorial: Playing bad");
    auto_play = -1;
    alarm[0] = 60;
}
else if (tutorial == 5)
{
    debug_print("Tutorial: Kris failed");
    difficulty = 10;
    alarm[0] = 30;
}
else if (tutorial == 6)
{
    with (obj_rhythmgame_chart)
    {
        if (instrument == 1)
            auto_play = false;
    }
    debug_print("Tutorial: Everyone's a loser (except Ralsei)");
    alarm[0] = 60;
}
else if (tutorial == 7)
{
    debug_print("Tutorial: Gone");
    auto_play = 0;
    show_chart = 0;
    difficulty = 5;
    alarm[0] = 20;
}
else if (tutorial == 8)
{
    tutorial = -1;
    miss_timer = 0;
    missnotecon = 0;
    missnotetimer = 0;
    mus_volume(track1_instance, 0, 60);
    mus_volume(track2_instance, 0, 60);
    event_user(1);
    debug_print("Tutorial: Wrapped up");
    tutorial_ready = true;
}
