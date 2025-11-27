scr_board_populatevars();
scr_gameshow_populatevars();
if (init == 0)
{
    batcon = 0;
    battimer = 0;
    lefteye = scr_board_marker(4062, 150, spr_board_shutta_eyeShape, 0, 998080);
    with (lefteye)
        setxy_board(x, yprevious);
    righteye = scr_board_marker(4222, 150, spr_board_shutta_eyeShape, 0, 998080);
    with (righteye)
        setxy_board(x, y);
    mouth = scr_board_marker(4128, 160, spr_board_shutta_mouth, 0, 998160);
    with (mouth)
        setxy_board(x, y);
    leftsolid = instance_create(4064, 160, obj_board_solid);
    with (leftsolid)
        setxy_board(x, y);
    rightsolid = instance_create(4224, 160, obj_board_solid);
    with (rightsolid)
        setxy_board(x, y);
    mouthsolid = instance_create(4128, 172, obj_board_solid);
    with (mouthsolid)
        setxy_board(x, y);
    mouthsolid.image_xscale = 2;
    init = 1;
}
if (prebat == 1)
{
    camtimer = 999;
    camcon = 999;
}
if (prebat == 2 && !i_ex(obj_board_playercamera))
{
    with (obj_mainchara_board)
        canfreemove = false;
    battimer++;
    if (battimer == 1)
    {
    }
    if (battimer == 15)
    {
        prebat = 3;
        batcon = 1;
        battimer = 0;
    }
}
var fadecount = 4;
var fadestep = 3;
if (batcon == 1)
{
    battimer++;
    if (battimer == 1)
    {
        makewriter = 0;
        prebat = 99;
        safe_delete(shopwriter);
        global.interact = 1;
        with (obj_mainchara_board)
            facing = 2;
        safe_delete(leftsolid);
        safe_delete(rightsolid);
        safe_delete(mouthsolid);
        lpupil = scr_board_marker(240, 176, spr_board_shutta_pupil, 0, lefteye.depth, 2, 0);
        with (lpupil)
        {
            image_alpha = 0;
            for (var i = 1; i < (fadecount + 1); i++)
                scr_delay_var("image_alpha", i / fadecount, fadestep * i);
        }
        rpupil = scr_board_marker(400, 176, spr_board_shutta_pupil, 0, lefteye.depth, 2, 0);
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
        scr_speaker("no_name");
        msgsetloc(0, "FABULOUS^1! JUST FABULOUS!/", "obj_b2camera_slash_Step_0_gml_135_0");
        msgnextloc("DO YOU THINK YOU COULD PHOTOGRAPH ME TOO?/%", "obj_b2camera_slash_Step_0_gml_136_0");
        bw_make();
        batcon = 2;
        battimer = 0;
    }
}
if (batcon == 2 && !bw_ex())
{
    scr_battle(111, 0);
    scr_delay_var("batcon", 3, 60);
    battimer = 0;
    batcon = -1;
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
        cleanup = 1;
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
    obj_b2intro.makeboat = true;
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
    if (battimer >= 5 && !i_ex(obj_battleback))
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
if (kris.camera == true && !active)
    camcon = 999;
if (active == 1)
{
    if (makewriter && obj_board_camera.con == 0)
    {
        if (!madewriter)
        {
            shopwriter = instance_create(x, y, obj_board_shopwriter);
            shopwriter.yloc = board_tiley(1) + 12;
            shopwriter.shopstring = stringsetloc("RAFT APPEARS IN#THE RIVER", "obj_b2camera_slash_Step_0_gml_213_0");
            if (prebat == 1)
                shopwriter.shopstring = stringsetloc("THE FINAL PHOTO#THE THREE HEROES", "obj_b2camera_slash_Step_0_gml_215_0");
            madewriter = true;
        }
    }
    if (camcon == 0 && kris.camera == true)
    {
        camcon = 1;
        camtimer = 0;
    }
    if (prebat > 0)
    {
        camcon = 999;
        camtimer = 999;
    }
    if (camcon == 1)
    {
        camtimer++;
        if (camtimer == 10)
        {
            var ratalk = stringsetloc("Kris! Take a photo!", "obj_b2camera_slash_Step_0_gml_229_0");
            scr_couchtalk(ratalk, "ralsei", 2, 90);
        }
        if (camtimer > 10)
        {
            if (ralsei.sprite_index == spr_board_ralsei_itemget && raphoto == 0)
            {
                raphoto = 1;
                var ratalk = stringsetloc("A-Ahh! Hahaha! That's me!", "obj_b2camera_slash_Step_0_gml_246_0");
                scr_couchtalk(ratalk, "ralsei", 2, 60);
                scr_delay_var("raphoto", 2, 30);
            }
            if (susie.sprite_index == spr_board_susie_itemget && suphoto == 0)
            {
                suphoto = 1;
                var sutalk = stringsetloc("Heh, guess it's OK if it's in a game.", "obj_b2camera_slash_Step_0_gml_254_0");
                scr_couchtalk(sutalk, "susie", 2, 120);
                scr_delay_var("suphoto", 2, 30);
            }
            if (krisphoto == 1)
            {
                if ((susie.sprite_index != spr_board_susie_itemget || suphoto == 2) && (ralsei.sprite_index != spr_board_ralsei_itemget || raphoto == 2))
                {
                    krisphoto = 2;
                    krtimer = 0;
                    var ratalk = stringsetloc("Cute selfie, Kris!", "obj_b2camera_slash_Step_0_gml_266_0");
                    scr_couchtalk(ratalk, "ralsei", 2, 90);
                }
                else
                {
                    krisphoto = 0;
                }
            }
            if (krisphoto == 2)
            {
                krtimer++;
                if (krtimer == 70)
                {
                    var sutalk = stringsetloc("Pff. Can't you even pose?", "obj_b2camera_slash_Step_0_gml_280_0");
                    scr_couchtalk(sutalk, "susie", 2, 90);
                    krisphoto = 3;
                }
            }
        }
    }
    if (global.flag[1040] == 1 && global.flag[1041] == 1 && global.flag[1042] == 1 && prebat == 0)
    {
        prebat = 1;
        makewriter = true;
        battimer = 0;
    }
    if (con == 0 && obj_board_camera.con == 0)
    {
        if (suwalk == 0)
        {
            if (prebat == 0)
            {
                ralsei.follow = false;
                scr_pathfind_to_point("ralsei", 2, 5, 2);
                scr_pathfind_to_point("susie", 9, 5, 2);
            }
            else
            {
                scr_pathfind_to_point("susie", 7, 6, 0);
                ralsei.follow = true;
            }
            suwalk = 1;
        }
        if (tetalker == 0)
        {
            tetalker = 1;
            var tetalk = stringsetloc("Oh, a camera!", "obj_b2camera_slash_Step_0_gml_322_0");
            scr_couchtalk(tetalk, "ralsei", 2, 60);
        }
    }
    if (con == 1)
    {
        if (!i_ex(key))
        {
            kris.camera = false;
            con = 2;
        }
    }
}
else
{
    suwalk = 0;
    safe_delete(shopwriter);
    madewriter = false;
    if (krisphoto >= 1)
        krisphoto = 99;
}
if (active)
{
    if (!noreturn)
    {
        if (obj_board_camera.shift != "none" && kris.camera == true)
        {
            noreturn = true;
            debug_print("yes");
            with (instance_create(4128, 288, obj_board_solid))
            {
                setxy_board();
                scr_size(2, 1);
            }
        }
    }
}
