if (alwaysactive)
    active = true;
scr_board_populatevars();
if (tenna == 0)
{
    with (obj_actor_tenna)
        other.tenna = id;
}
if (susiereal == 0)
{
    with (obj_caterpillarchara)
    {
        if (name == "susie")
            other.susiereal = id;
    }
}
if (ralseireal == 0)
{
    with (obj_caterpillarchara)
    {
        if (name == "ralsei")
            other.ralseireal = id;
    }
}
if (krisreal == 0)
{
    with (obj_mainchara)
        other.krisreal = id;
}
if (active == 1)
{
    if (reset == true)
    {
        reset = false;
        with (obj_board_grabobject)
        {
            if (grabbedid.object_index == obj_board_bridge)
            {
                grabdaddy.grabbed = 0;
                grabdaddy.grab = 0;
                instance_destroy();
            }
        }
        with (obj_board_bridge)
        {
            if (puzzleid == other.puzzleid)
                instance_destroy();
        }
        with (obj_board_bridge_placed)
        {
            if (puzzleid == other.puzzleid)
                instance_destroy();
        }
        with (obj_board_breakableblock)
        {
            if (puzzleid == other.puzzleid)
                instance_destroy();
        }
        with (obj_board_grabbablegrass)
        {
            if (puzzleid == other.puzzleid)
                instance_destroy();
        }
        with (obj_board_bridgespawner)
        {
            if (puzzleid == other.puzzleid)
                made = false;
        }
    }
    var solvecleanup = false;
    if (solved == 0)
    {
        if (dosolve == true)
        {
            solved = true;
            dosolve = false;
            snd_play(snd_bell);
            snd_play_delay(snd_applause_single, 15);
            solvecleanup = true;
        }
        with (obj_board_solvedtrigger)
        {
            if (puzzleid == other.puzzleid)
            {
                if (place_meeting(x, y, obj_board_bridge_placed))
                {
                    other.solved = true;
                    snd_play(snd_bell);
                    snd_play_delay(snd_applause_single, 15);
                    solvecleanup = true;
                }
            }
        }
        if (specialsolve == true && solved == 0)
        {
            if (puzzleid == 203)
            {
                var remainingtilecount = 0;
                with (obj_board_breakableblock)
                {
                    if (puzzleid == other.puzzleid)
                        remainingtilecount++;
                }
                if (remainingtilecount == 0)
                {
                    snd_play(snd_won);
                    solved = true;
                    specialsolve = false;
                }
            }
            if (puzzleid == 204)
            {
                var tilecount = 0;
                with (obj_board_solvedtrigger)
                {
                    if (puzzleid == 204)
                    {
                        if (place_meeting(x, y, obj_board_breakableblock))
                            tilecount++;
                    }
                }
                if (tilecount == 0)
                {
                    solved = true;
                    solvecleanup = true;
                }
            }
        }
    }
    if (puzzleid == 204)
    {
        if (specialsolve == true)
        {
            var remainingtilecount = 0;
            with (obj_board_breakableblock)
            {
                if (puzzleid == 204)
                    remainingtilecount++;
            }
            if (remainingtilecount == 0)
            {
                snd_play(snd_won);
                specialsolve = false;
            }
        }
    }
    if (solvecleanup == true)
    {
        with (obj_board_bridgespawner)
        {
            if (puzzleid == other.puzzleid)
                instance_destroy();
        }
        with (obj_board_grabbablegrassspawner)
        {
            if (puzzleid == other.puzzleid)
                instance_destroy();
        }
        with (obj_board_breakableblockspawner)
        {
            if (puzzleid == other.puzzleid)
                instance_destroy();
        }
        with (obj_board_resettile)
        {
            if (puzzleid == other.puzzleid)
            {
                var puff = instance_create(x, y, obj_board_smokepuff);
                puff.image_blend = #FFF200;
                instance_destroy();
            }
        }
    }
}
else if (!solved)
{
    with (obj_board_bridge)
    {
        if (puzzleid == other.puzzleid)
            instance_destroy();
    }
    with (obj_board_bridge_placed)
    {
        if (puzzleid == other.puzzleid)
            instance_destroy();
    }
    with (obj_board_breakableblock)
    {
        if (puzzleid == other.puzzleid)
            instance_destroy();
    }
    with (obj_board_grabbablegrass)
    {
        if (puzzleid == other.puzzleid)
            instance_destroy();
    }
}
