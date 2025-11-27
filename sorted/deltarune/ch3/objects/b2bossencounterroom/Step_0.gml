scr_board_populatevars();
scr_gameshow_populatevars();
if (active == 1)
{
    if (con == 0 && obj_board_camera.con == 0)
    {
        var trig = false;
        if (obj_board_inventory.ninfriendo)
        {
            with (obj_board_trigger)
            {
                if (extflag == "b2bosstrig")
                {
                    if (place_meeting(x, y, obj_mainchara_board))
                        trig = true;
                }
            }
        }
        if (trig)
        {
            doorhide = scr_board_marker(x, y, spr_pxwhite, 0, 999990, 32);
            doorhide.image_blend = #632323;
            with (instance_create(x, y, obj_board_smokepuff))
            {
                depth = 900000;
                image_blend = #CE6951;
            }
            with (door)
                setxy(room_width, room_height);
            for (var i = 0; i < 2; i++)
            {
                block[i] = instance_create_board(9 + i, 8, obj_board_solid);
                with (block[i])
                {
                    visible = true;
                    sprite_index = spr_board_b2pantheonbrick;
                    depth = 999990;
                    image_xscale = -2;
                    image_yscale = -2;
                    with (instance_create(x - 32, y - 32, obj_board_smokepuff))
                    {
                        image_blend = #FFD78C;
                        depth = 999989;
                    }
                }
            }
            snd_play_x(snd_board_door_close, 0.8, 0.8);
            snd_play_x(snd_board_door_close, 0.8, 1);
            con = 1;
        }
    }
    if (con == 1)
    {
        timer++;
        if (timer == 10)
        {
            var uhohsu = stringsetloc("Uh oh.", "obj_b2bossencounterroom_slash_Step_0_gml_63_0");
            var uhohra = stringsetloc("Uh oh.", "obj_b2bossencounterroom_slash_Step_0_gml_61_0_b");
            scr_couchtalk(uhohsu, "susie", 2, 60);
            scr_couchtalk(uhohra, "ralsei", 2, 60);
            susie.sleepy = false;
        }
        if (timer == 25)
        {
            shopwriter = instance_create(x, y, obj_board_shopwriter);
            shopwriter.yloc = board_tiley(1) + 12;
            shopwriter.shopstring = stringsetloc("THE FINAL PHOTO#THE THREE HEROES", "obj_b2bossencounterroom_slash_Step_0_gml_57_0");
            if (retry)
            {
                shopwriter.yloc -= 8;
                shopwriter.shopstring = stringsetloc("THE FINAL PHOTO#THE THREE HEROES#    (AGAIN)", "obj_b2bossencounterroom_slash_Step_0_gml_61_0");
            }
            con = 2;
            timer = 0;
        }
    }
    if (con == 3 && !i_ex(obj_board_playercamera))
    {
        with (obj_mainchara_board)
            canfreemove = false;
        battimer++;
        if (battimer == 1)
        {
        }
        if (battimer == 15)
        {
            batcon = 0.5;
            battimer = 0;
            con = 4;
        }
    }
    if (batcon == 0.5)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "FABULOUS^1! A MUGSHOT OF YOU THREE CRIMINALS!/", "obj_b2bossencounterroom_slash_Step_0_gml_95_0");
        msgnextloc("YOU TOOK MY CAMERA^1, TOOK THE MOON AND EVEN TOOK THE CLOUDS./", "obj_b2bossencounterroom_slash_Step_0_gml_96_0");
        msgnextloc("NOW^1, IF YOU'RE GOING TO BE TAKING AND TAKING.../%", "obj_b2bossencounterroom_slash_Step_0_gml_97_0");
        if (retry == 0)
            bw_make();
        batcon = 0.6;
    }
    if (batcon == 0.6 && !bw_ex())
    {
        batcon = 1;
        battimer = 0;
    }
    var fadecount = 4;
    var fadestep = 3;
    if (batcon == 1)
    {
        battimer++;
        if (battimer == 1)
        {
            prebat = 99;
            safe_delete(shopwriter);
            global.interact = 1;
            with (obj_mainchara_board)
                facing = 2;
            safe_delete(leftsolid);
            safe_delete(rightsolid);
            safe_delete(mouthsolid);
            lpupil = scr_board_marker(240, 192, spr_board_shutta_pupil, 0, 998080, 2, 0);
            with (lpupil)
            {
                image_alpha = 0;
                for (var i = 1; i < (fadecount + 1); i++)
                    scr_delay_var("image_alpha", i / fadecount, fadestep * i);
            }
            rpupil = scr_board_marker(400, 192, spr_board_shutta_pupil, 0, 998080, 2, 0);
            with (rpupil)
            {
                image_alpha = 0;
                for (var i = 1; i < (fadecount + 1); i++)
                    scr_delay_var("image_alpha", i / fadecount, fadestep * i);
            }
            realmouth = scr_board_marker(mouth.x, mouth.y, mouth.sprite_index, 0, mouth.depth, 2, 0);
            realmouth.image_index = 1;
            with (mouth)
            {
                for (var i = 1; i < (fadecount + 1); i++)
                    scr_delay_var("image_alpha", 1 - (i / fadecount), fadestep * i);
            }
        }
        if (battimer == ((fadestep * fadecount) + 30))
        {
            with (rpupil)
            {
                scr_lerpvar("x", x, x - 4, 5, 2, "out");
                scr_lerpvar("y", y, y + 4, 5, 2, "out");
            }
            with (lpupil)
            {
                scr_lerpvar("x", x, x + 4, 5, 2, "out");
                scr_lerpvar("y", y, y + 4, 5, 2, "out");
            }
        }
        if (battimer == ((fadestep * fadecount) + 40))
        {
            scr_speaker("shutta");
            msgsetloc(0, "COULD YOU AT LEAST TAKE A PHOTO OF ME?/%", "obj_b2bossencounterroom_slash_Step_0_gml_178_0");
            if (retry)
            {
                msgsetloc(0, "HMM^1, THAT LAST PHOTO SHOOT DIDN'T GO SO WELL./", "obj_b2bossencounterroom_slash_Step_0_gml_182_0");
                msgnextloc("HOW ABOUT A RETAKE?/%", "obj_b2bossencounterroom_slash_Step_0_gml_183_0");
            }
            bw_make();
            batcon = 2;
            battimer = 0;
        }
    }
    if (batcon == 2 && !bw_ex())
    {
        battimer++;
        if (battimer == 1)
        {
            global.flag[9] = 0;
            global.interact = 1;
            battler = instance_create(x, y, obj_gameshow_battlemanager);
            battler.encounterno = 111;
            battler.encounterflag = 584;
        }
        if (battimer == 60)
        {
            batcon = 3;
            battimer = 0;
        }
    }
    if (batcon == 3)
    {
        if (cleanup == 0)
        {
            safe_delete(lefteye);
            safe_delete(leftsolid);
            safe_delete(righteye);
            safe_delete(rightsolid);
            safe_delete(mouth);
            safe_delete(mouthsolid);
            safe_delete(realmouth);
            safe_delete(lpupil);
            safe_delete(rpupil);
            safe_delete(block[0]);
            safe_delete(block[1]);
            safe_delete(doorhide);
            with (door)
                setxy_board(2464, 1632);
            cleanup = 1;
            with (kris)
                setxy_board(2608, 1744);
            with (susie)
                setxy(other.kris.x + 32, other.kris.y - 32);
            with (ralsei)
                setxy(other.kris.x - 32, other.kris.y - 32);
            kris.facing = 0;
            ralsei.facing = 0;
            susie.facing = 0;
        }
    }
    if (batcon == 3 && global.fighting == 0)
    {
        with (obj_board_npc)
        {
            if (extflag == "b2intro")
                instance_destroy();
        }
        batcon++;
        battimer = 0;
    }
    if (batcon == 4)
    {
        obj_mainchara.cutscene = true;
        battimer++;
        if (battimer >= 5 && !i_ex(obj_battleback) && !i_ex(battler))
        {
            batcon++;
            global.interact = 0;
            with (obj_mainchara_board)
                canfreemove = true;
            kris.canfreemove = true;
            madewriter = 0;
            makewriter = 1;
            ralsei.follow = true;
            scr_board_caterpillar_interpolate_ralsei();
        }
    }
    if (suwalk == 0 && obj_board_camera.con == 0)
    {
        suwalktimer++;
        if (suwalktimer == 15)
        {
            if (susie.x > 300)
                scr_pathfind_to_point("susie", 2, 2, 2);
            else
                scr_pathfind_to_point("susie", 6, 6, 0);
            susie.sleepy = true;
            suwalk = 1;
        }
    }
}
else
{
    suwalktimer = 0;
    suwalk = 0;
}
if (rebuild == 1)
{
    safe_delete(leftsolid);
    safe_delete(rightsolid);
    safe_delete(mouthsolid);
    safe_delete(lefteye);
    safe_delete(leftsolid);
    safe_delete(righteye);
    safe_delete(rightsolid);
    safe_delete(mouth);
    safe_delete(mouthsolid);
    safe_delete(realmouth);
    safe_delete(lpupil);
    safe_delete(rpupil);
    safe_delete(block[0]);
    safe_delete(block[1]);
    safe_delete(doorhide);
    with (door)
        setxy_board(2464, 1632);
    var displacex = -1536;
    var displacey = 1552;
    lefteye = scr_board_marker(4062 + displacex, 150 + displacey, spr_board_shutta_eyeShape, 0, 998080);
    with (lefteye)
        setxy_board(x, y);
    righteye = scr_board_marker(4222 + displacex, 150 + displacey, spr_board_shutta_eyeShape, 0, 998080);
    with (righteye)
        setxy_board(x, y);
    mouth = scr_board_marker(4128 + displacex, 160 + displacey, spr_board_shutta_mouth, 0, 998160);
    with (mouth)
        setxy_board(x, y);
    leftsolid = instance_create(4064 + displacex, 160 + displacey, obj_board_solid);
    with (leftsolid)
        setxy_board(x, y);
    rightsolid = instance_create(4224 + displacex, 160 + displacey, obj_board_solid);
    with (rightsolid)
        setxy_board(x, y);
    mouthsolid = instance_create(4128 + displacex, 172 + displacey, obj_board_solid);
    with (mouthsolid)
        setxy_board(x, y);
    mouthsolid.image_xscale = 2;
    cleanup = 0;
    rebuild = false;
}
