scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (tennawarn == 0 && obj_board_camera.con == 0)
    {
        tennawarn = 1;
        obj_b2danger1.tennawarn = 999;
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
        var player = 0;
        with (obj_mainchara_board)
        {
            if (controlled == 1)
                player = id;
        }
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
        if (freefire == 1)
        {
            freefire = 0;
            dir = choose(0, 1, 2, 3);
        }
        with (obj_board_shadowgunner_spawn)
        {
            if (extflag == "b2northcross")
            {
                if (dir == 0 && dir_up == true)
                    array_insert(other.eligiblespots, array_length(other.eligiblespots), id);
                if (dir == 1 && dir_right == true)
                    array_insert(other.eligiblespots, array_length(other.eligiblespots), id);
                if (dir == 2 && dir_down == true)
                    array_insert(other.eligiblespots, array_length(other.eligiblespots), id);
                if (dir == 3 && dir_left == true)
                    array_insert(other.eligiblespots, array_length(other.eligiblespots), id);
            }
        }
        var targSpot = 0;
        var spotIndex = irandom(array_length(eligiblespots) - 1);
        targSpot = eligiblespots[spotIndex];
        mygunner1 = instance_create(targSpot.x, targSpot.y, obj_board_shadowgunner);
        debug_message("mygunner1 made x:" + string(mygunner1.x));
        debug_message("mygunner1 made y:" + string(mygunner1.y));
    }
    if (i_ex(mygunner1))
    {
        if (mygunner1.phototaken == true)
            dontmake = true;
    }
    if (!i_ex(mygunner1) && obj_board_camera.con == 0 && dontmake == false)
    {
        array_resize(eligiblespots, 0);
        var _kris = 0;
        with (obj_mainchara_board)
        {
            if (controlled == 1)
                _kris = id;
        }
        if (_kris.x < 320)
            side = 0;
        else
            side = 1;
        with (obj_board_shadowgunner_spawn)
        {
            if (extflag == "b2northcross")
            {
                var addtoarray = 0;
                if (other.side == 0 && x > 320)
                    addtoarray = true;
                if (other.side == 1 && x < 320)
                    addtoarray = true;
                if (addtoarray == true)
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
        if (suwalk == 0)
        {
            suwalk = 1;
            ralsei.follow = true;
            if (susie.x == 480)
                scr_pathfind_to_point("susie", 0, choose(3, 4), 0);
            if (susie.x == 128)
                scr_pathfind_to_point("susie", 11, 4, 0);
            if (susie.y == 64)
                scr_pathfind_to_point("susie", choose(5, 6), 7, 0);
            if (susie.y == 288)
                scr_pathfind_to_point("susie", choose(5, 6), 0, 0);
        }
    }
    if (ralsei.follow == true)
    {
        if (ralsei.iframes > 0 || kris.iframes > 0)
        {
            ralsei.follow = false;
            var ralpoint = irandom(3);
            if (hitcount == 0)
            {
                hitcount = 1;
                var ratalk = stringsetloc("Kris!! Duck and cover!!", "obj_b2northcross_slash_Step_0_gml_130_0");
                scr_couchtalk(ratalk, "ralsei", 2, 60);
                scr_shakeobj_ext(ra_real, 6, 4);
            }
            switch (ralpoint)
            {
                case 0:
                    scr_pathfind_to_point("ralsei", choose(5, 6), 7, 0);
                    break;
                case 1:
                    scr_pathfind_to_point("ralsei", 11, 4, 0);
                    break;
                case 2:
                    scr_pathfind_to_point("ralsei", choose(5, 6), 0, 0);
                    break;
                case 3:
                    scr_pathfind_to_point("ralsei", 0, 4, 0);
                    break;
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
