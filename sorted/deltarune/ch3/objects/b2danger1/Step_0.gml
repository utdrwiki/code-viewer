scr_board_populatevars();
scr_gameshow_populatevars();
if (tennatext == -1)
{
    with (obj_b2northcross)
        other.tennatext = tennatext;
}
if (active == 1)
{
    if (kris.boat && !tennahere() && ralseiquestion == 0 && obj_board_camera.con == 0)
    {
        ralseiquestion = 1;
        var ratalk = stringsetloc("Kris...? The ending was right there...", "obj_b2danger1_slash_Step_0_gml_26_0");
        scr_couchtalk(ratalk, "ralsei", 2, 120);
        ra_real.sprite_index = spr_ralsei_walk_left_unhappy;
    }
    if (tennawarn == 0 && obj_board_camera.con == 0)
    {
        tennawarn = 1;
        obj_b2northcross.tennawarn = 999;
    }
    if (tennawarn)
    {
        tennawarn++;
        if (tennawarn == 15)
        {
        }
    }
    if (!tennahere())
    {
        made = true;
        dontmake = true;
    }
    if (!made)
    {
        ralsei.follow = 0;
        var player = 0;
        with (obj_mainchara_board)
        {
            if (controlled == 1)
                player = id;
        }
        if (player.x < 320)
            side = 0;
        else
            side = 1;
        made = true;
        array_resize(eligiblespots, 0);
        var dir = -1;
        if (obj_board_camera.shift == "down")
            dir = 2;
        if (obj_board_camera.shift == "left")
            dir = 3;
        if (obj_board_camera.shift == "right")
            dir = 1;
        if (obj_board_camera.shift == "up")
            dir = 0;
        if (dir == 0)
        {
            with (obj_board_shadowgunner_spawn)
            {
                if (dir_down == true)
                {
                    var addtoarray = 0;
                    if (other.side == 0 && x > 320)
                        addtoarray = true;
                    if (other.side == 1 && x < 320)
                        addtoarray = true;
                    if (addtoarray == true && extflag == "b2danger1")
                        array_insert(other.eligiblespots, array_length(other.eligiblespots), id);
                }
            }
        }
        if (dir == 2)
        {
            with (obj_board_shadowgunner_spawn)
            {
                if (dir_up == true)
                {
                    var addtoarray = 0;
                    if (other.side == 0 && x > 320)
                        addtoarray = true;
                    if (other.side == 1 && x < 320)
                        addtoarray = true;
                    if (addtoarray == true && extflag == "b2danger1")
                        array_insert(other.eligiblespots, array_length(other.eligiblespots), id);
                }
            }
        }
        if (dir == 3)
        {
            with (obj_board_shadowgunner_spawn)
            {
                if (dir_right == true && extflag == "b2danger1")
                    array_insert(other.eligiblespots, array_length(other.eligiblespots), id);
            }
        }
        if (dir == 1)
        {
            with (obj_board_shadowgunner_spawn)
            {
                if (dir_left == true && extflag == "b2danger1")
                    array_insert(other.eligiblespots, array_length(other.eligiblespots), id);
            }
        }
        var targSpot = 0;
        var spotIndex = irandom(array_length(eligiblespots) - 1);
        targSpot = eligiblespots[spotIndex];
        mygunner1 = instance_create(targSpot.x, targSpot.y, obj_board_shadowgunner);
    }
    if (i_ex(mygunner1))
    {
        if (mygunner1.phototaken == true)
            dontmake = true;
    }
    if (!i_ex(mygunner1) && obj_board_camera.con == 0 && dontmake == false)
    {
        array_resize(eligiblespots, 0);
        if (obj_mainchara_board.x < 320)
            side = 0;
        else
            side = 1;
        with (obj_board_shadowgunner_spawn)
        {
            if (dir_down == true)
            {
                var addtoarray = 0;
                if (other.side == 0 && x > 320)
                    addtoarray = true;
                if (other.side == 1 && x < 320)
                    addtoarray = true;
                if (addtoarray == true && extflag == "b2danger1")
                    array_insert(other.eligiblespots, array_length(other.eligiblespots), id);
            }
        }
        var targSpot = 0;
        var spotIndex = irandom(array_length(eligiblespots) - 1);
        targSpot = eligiblespots[spotIndex];
        mygunner1 = instance_create(targSpot.x, targSpot.y, obj_board_shadowgunner);
    }
    if (con == 0 && obj_board_camera.con == 0)
    {
        if (kris.boat == false)
        {
            with (obj_board_grabobject)
                sourcey = susie.y;
        }
        if (suwalk == 0 && kris.boat == false)
        {
            if (i_ex(mygunner1))
            {
                if (mygunner1.timer == (mygunner1.startWait + 1))
                {
                    with (susie)
                    {
                        grabbed = other.ralsei;
                        grab = 1;
                        grabmarker = instance_create(x, y, obj_board_grabobject);
                        with (grabmarker)
                        {
                            drawreticle = false;
                            snd_play(snd_board_lift);
                            grabdaddy = other.id;
                            grabbedid = other.grabbed;
                            sprite_index = grabbedid.sprite_index;
                            image_xscale = grabbedid.image_xscale;
                            image_yscale = grabbedid.image_yscale;
                            image_speed = grabbedid.image_speed;
                            sourcex = grabbedid.x;
                            sourcey = grabbedid.y;
                        }
                        with (grabbed)
                        {
                            visible = false;
                            frozen = true;
                            setxy(board_tilex(-1), board_tiley(-1));
                            if (object_index == obj_mainchara_board)
                                canfreemove = 0;
                        }
                    }
                    suwalk = 1;
                    var walkstring = "";
                    for (var i = 0; i < irandom(14); i++)
                        walkstring += "0W";
                    if (susie.y < 180)
                    {
                        for (var i = 0; i < 64; i++)
                            walkstring += "0D";
                    }
                    else
                    {
                        for (var i = 0; i < 64; i++)
                            walkstring += "0U";
                    }
                    scr_play_recording("susie", walkstring);
                }
            }
        }
    }
}
else
{
    suwalk = 0;
    if (made == true)
    {
        made = false;
        eligiblespots[0] = 0;
        array_resize(eligiblespots, 0);
    }
    dontmake = false;
    safe_delete(mygunner1);
    safe_delete(mygunner2);
}
if (active && obj_board_camera.con != 0)
    susie.iframes = 0;
if (resetevent)
{
    suwalk = 1;
    var walkstring = "";
    for (var i = 0; i < 5; i++)
        walkstring += "0W";
    if (kris.y < 180)
    {
        for (var i = 0; i < 64; i++)
            walkstring += "0D";
    }
    else
    {
        for (var i = 0; i < 64; i++)
            walkstring += "0U";
    }
    scr_play_recording("susie", walkstring);
    resetevent = false;
}
