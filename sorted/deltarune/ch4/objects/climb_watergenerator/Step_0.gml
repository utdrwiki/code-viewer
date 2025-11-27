drawwater--;
if (global.interact == 0)
{
    timer++;
    var waterspawntype = 1;
    if (remote)
        waterspawntype = 2;
    if (waterspawntype == 0)
    {
        if (timer == (waittime - 6))
            event_user(10);
        if (timer >= waittime)
        {
            if ((timer % spawnrate) == 0)
            {
                var mywater = instance_create(x, y, obj_climb_water);
                with (mywater)
                {
                    movetimer = other.watermovetimer;
                    moverate = other.watermoverate;
                    tilelimit = other.watertilelimit;
                    fallingtimer = other.waterfallingtimer;
                    bad = other.waterbad;
                    damage = other.waterdmg;
                    falldir = other.waterdir;
                    spawnrate = other.spawnrate;
                    activetime = other.activetime;
                    watertype = 0;
                }
            }
        }
    }
    if (waterspawntype == 1)
    {
        if (timer == (waittime - 6))
            event_user(10);
        if (timer == waittime)
        {
            var mywater = instance_create(x, y, obj_climb_water);
            with (mywater)
            {
                movetimer = other.watermovetimer;
                moverate = other.watermoverate;
                tilelimit = other.watertilelimit;
                fallingtimer = other.waterfallingtimer;
                bad = other.waterbad;
                damage = other.waterdmg;
                falldir = other.waterdir;
                spawnrate = other.spawnrate;
                activetime = other.activetime;
                watertype = 1;
            }
        }
    }
    if (waterspawntype == 2)
    {
        makewater--;
        if (makewater == 6)
            event_user(10);
        if (makewater == 0)
        {
            var mywater = instance_create(x, y, obj_climb_water);
            with (mywater)
            {
                movetimer = other.watermovetimer;
                moverate = other.watermoverate;
                tilelimit = other.watertilelimit;
                fallingtimer = other.waterfallingtimer;
                bad = other.waterbad;
                damage = other.waterdmg;
                falldir = other.waterdir;
                spawnrate = other.spawnrate;
                activetime = other.activetime;
                watertype = 1;
            }
        }
    }
    if (timer >= (waittime + activetime))
        timer = 0;
}
