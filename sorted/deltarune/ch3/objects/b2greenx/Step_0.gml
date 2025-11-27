scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (solved == 1 && !i_ex(solvedblock))
    {
        snd_play(snd_board_door_close);
        var xloc = 0;
        var yloc = 0;
        with (obj_board_b2greenblock)
        {
            if (boss)
            {
                xloc = x + 16;
                yloc = y + 16;
            }
        }
        solvedblock = instance_create(xloc, yloc, obj_b2_greenxsolve);
    }
    if (obj_board_camera.con == 0 && solved == 0)
    {
        checktimer++;
        var check = 0;
        with (obj_board_b2greenblock)
        {
            if (con == 0)
                check = 1;
        }
        if (check == 1)
        {
            with (obj_board_b2greenblock)
            {
                if (boss)
                    event_user(12);
            }
        }
    }
    if (con == 0 && obj_board_camera.con == 0)
    {
        if (resetbell == 0)
        {
            with (obj_board_resetbell)
            {
                if (extflag == "b2greenx")
                    other.resetbell = id;
            }
        }
        if (i_ex(resetbell))
        {
            if (resetbell.reset == true)
            {
                resetbell.reset = false;
                with (obj_board_b2greenblock)
                {
                    var ralseiBlock = instance_place(daddy.x, daddy.y, obj_pushableblock_board);
                    if (i_ex(ralseiBlock))
                    {
                        if (ralseiBlock.sprite_index != spr_ralsei_board_stoolforme)
                            ralseiBlock = -4;
                    }
                    var offset = 0;
                    if (ralseiBlock != -4)
                        offset = 32;
                    scr_lerpvar("x", x, daddy.x + offset, 15, -1, "out");
                    scr_lerpvar("y", y, daddy.y, 15, -1, "out");
                }
            }
        }
        if (suwalk == 0)
        {
            suwalk = 1;
            if (susie.x < 320)
                scr_pathfind_to_point("susie", 2, 3, 1);
            else
                scr_pathfind_to_point("susie", 9, 3, 3);
        }
        if (ralwalk == 0)
        {
            if (ralsei.x < 320)
                scr_pathfind_to_point("ralsei", 2, 5, 1);
            else
                scr_pathfind_to_point("ralsei", 9, 5, 3);
            ralwalk = 1;
        }
        if (kris.camera == 0)
        {
            with (obj_board_b2greenblock)
                pushcount = 0;
        }
        if (ralsubcon == 0)
        {
            var pushedcount = 0;
            with (obj_board_b2greenblock)
                pushedcount += pushcount;
            if (pushedcount >= 3)
            {
                ralsubcon = 1;
                ralsubtimer = 0;
            }
        }
        if (ralsubcon == 1 && obj_board_camera.con == 0)
        {
            refollow = 1;
            ralsubtimer++;
            if (ralsubtimer == 10 && ralhelptalk == 0)
                ralhelptalk = 1;
        }
        if (ralsubcon == 2 && obj_board_camera.con == 0)
        {
            var resetpoint = false;
            if (ralsei.is_moving && obj_board_camera.con == 0)
            {
                with (obj_pushableblock_board)
                    resetpoint += con;
            }
            if (resetpoint)
            {
                ralsubcon = 1;
                ralsubtimer = 0;
            }
            if (!resetpoint && ralsei.is_moving == false)
            {
                if (ralhelptalk == 1)
                    ralhelptalk = 2;
                ralsubcon++;
            }
        }
        if (ralhelptalk == 2 && active && obj_board_camera.con == 0 && !i_ex(obj_couchwriter))
            ralhelptalk = 3;
        if (solved == 1)
        {
            con = 1;
            with (resetbell)
            {
                snd_play(snd_link_secret);
                puff = instance_create(x, y, obj_board_smokepuff);
                puff.image_blend = #FFF200;
                instance_destroy();
            }
        }
    }
    if (con == 1 && obj_board_camera.con == 0)
    {
        if (global.flag[1040] == 1)
            endtimer++;
        if (endtimer >= 45)
            con++;
    }
    if (con == 2)
    {
        if (ralwalk == 0)
        {
        }
    }
    if (introtalk == 0 && !solved && obj_board_camera.con == 0)
    {
        introtimer++;
        if (introtimer == 10)
        {
            var sutalk = stringsetloc("Those are some weird looking blocks.", "obj_b2greenx_slash_Step_0_gml_239_0");
            scr_couchtalk(sutalk, "susie", 2, 60);
        }
        if (introtimer == 70)
        {
            var tetalk = stringsetloc("Those are no ordinary blocks! This room presents a challenge!", "obj_b2greenx_slash_Step_0_gml_244_0");
            scr_couchtalk(tetalk, "tenna", 2, 60);
        }
        if (introtimer == 130)
        {
            var ratalk = stringsetloc("Oh, I think you can push these blocks around.", "obj_b2greenx_slash_Step_0_gml_249_0");
            scr_couchtalk(ratalk, "ralsei", 2, 60);
        }
        if (introtimer == 190)
        {
            var tetalk = stringsetloc("See? He gets it!", "obj_b2greenx_slash_Step_0_gml_254_0");
            scr_couchtalk(tetalk, "tenna", 2, 60);
        }
        if (introtimer == 250)
        {
            introtalk = 1;
            introtimer = 0;
        }
    }
}
else
{
    if (introtalk == 0 && introtimer > 10)
        introtalk = 1;
    introtimer = 0;
    if (refollow == 1)
    {
        ralsei.follow = 1;
        refollow = 0;
    }
    if (ralsubcon > 0)
        ralsubcon = 1;
    ralsubtimer = 0;
    ralwalk = 0;
    var check = 0;
}
if (active && obj_board_camera.con == 0)
{
    if (suwalk == 0 && solved)
    {
        suwalktimer++;
        if (suwalktimer == 1)
            ralsei.follow = true;
        if (suwalktimer >= 15)
        {
            suwalk = 1;
            var xloc = 2;
            var yloc = 3;
            var face = 0;
            var rand = irandom(5);
            rand = 0;
            switch (rand)
            {
                case 0:
                    xloc = irandom(2) + 1;
                    yloc = irandom(5) + 1;
                    face = 0;
                    break;
                case 1:
                    xloc = 8;
                    yloc = 5;
                    face = 0;
                    break;
                case 2:
                    xloc = 7;
                    yloc = 1;
                    face = 0;
                    break;
                case 3:
                    xloc = 10;
                    yloc = choose(5, 6);
                    face = spr_trashball;
                    break;
                case 4:
                    xloc = 9;
                    yloc = choose(1, 2);
                    face = spr_trashball;
                    break;
            }
            scr_pathfind_to_point("susie", xloc, yloc, face);
        }
    }
}
if (!active)
{
    suwalk = 0;
    suwalktimer = 0;
}
