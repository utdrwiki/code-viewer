if (su == 0)
{
    with (obj_mainchara_board)
    {
        if (name == "susie")
            other.su = id;
    }
}
scr_board_populatevars();
if (kris_real == 0)
    kris_real = 1185;
if (susie_real == 0)
{
    with (obj_caterpillarchara)
    {
        if (name == "susie")
            other.susie_real = id;
    }
}
if (ralsei_real == 0)
{
    with (obj_caterpillarchara)
    {
        if (name == "ralsei")
            other.ralsei_real = id;
    }
}
if (tenna == 0)
{
    with (obj_actor_tenna)
        other.tenna = id;
}
if (active == 1)
{
    susietimer++;
    if (con == 0 && obj_board_camera.con == 0)
    {
        if (tetalker == 0)
            tetalker = 1;
        ralsei.follow = true;
        shopstring = stringsetloc("LOOK. GUYSE. I'M#LOSTE. I DIDN'T#MEAN TO MAKE A SHOP.", "obj_b2pyramidrouxlsstore_slash_Step_0_gml_22_0");
        if (made && !i_ex(block))
            shopstring = stringsetloc("I HAVETH NOTHING.", "obj_b2pyramidrouxlsstore_slash_Step_0_gml_23_0");
        if (goaway == 0)
        {
            if (obj_b2loverscliff.con > 3)
            {
                goaway = 1;
                texttimer = 9999;
                shopstring = "";
                if (i_ex(block))
                    block.cost = 0;
                safe_delete(rouxlsmarker);
                safe_delete(tennasolid);
            }
        }
        if (activeinit == 0 && obj_board_camera.con == 0)
        {
            activeinit = 1;
            if (made == 0)
            {
                global.flag[1001] = 0;
                instance_create_board(3, 4.5, obj_board_smokepuff);
                block = instance_create_board(3, 4.5, obj_board_store_key);
                block.sprite_index = spr_board_rouxlsblock;
                block.mytype = "rouxlsblock";
                block.cost = 1;
                if (goaway)
                    block.cost = 0;
                if (!goaway)
                {
                    rouxlsmarker = instance_create_board(5.5, 1.25, obj_board_marker);
                    rouxlsmarker.sprite_index = spr_board_rouxls;
                    rouxlsmarker.extflag = "photoless";
                    rouxlsmarker.image_speed = 0.05;
                    tennasolid = instance_create_board(5.5, 1.25, obj_board_solid);
                    tennasolid.sprite_index = spr_board_npc_tenna;
                    scr_darksize(tennasolid);
                    with (rouxlsmarker)
                        scr_depth_board();
                    scr_darksize(rouxlsmarker);
                    instance_create(304, 88, obj_board_smokepuff);
                }
                made = 1;
            }
            visit++;
            con = 1;
            if (goaway == 1)
            {
                shopstring = "";
                texttimer = 9999;
            }
        }
        if (susiewalkcon == 0)
        {
            susiewalkcon = 1;
            scr_pathfind_to_point("susie", 332, 236, 2);
        }
    }
}
else
{
    timer = 0;
    texttimer = 0;
    activeinit = 0;
    con = 0;
    susiewalkcon = 0;
    susietimer = 0;
}
if (!active)
{
    if (tetalker == 1)
    {
        tetimer++;
        if (tetimer == 5)
        {
            if (tennahere())
            {
                with (obj_actor_tenna)
                    bounce = 1;
                var tetalk = stringsetloc("Who the heck was that?", "obj_b2pyramidrouxlsstore_slash_Step_0_gml_94_0");
                scr_couchtalk(tetalk, "tenna", 2, 70);
            }
            tetalker = 2;
        }
    }
}
