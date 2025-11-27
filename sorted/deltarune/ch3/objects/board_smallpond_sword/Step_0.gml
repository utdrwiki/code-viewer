if (room != room_board_1_sword)
{
    if (wither == 0)
    {
        if (obj_board_oasis.wither >= 1)
        {
            image_index = 1;
            wither = 1;
        }
    }
    if (init == 0)
    {
        with (obj_mainchara_board)
        {
            if (name == "kris")
                other.kr = id;
            if (name == "susie")
                other.su = id;
            if (name == "ralsei")
                other.ra = id;
        }
        if (kr != 0 && su != 0 && ra != 0)
            init = 1;
    }
    buffer--;
    if (myinteract == 3)
    {
        if (wither == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "IT'S A BEAUTIFUL LITTLE SPRING./%", "obj_board_smallpond_sword_slash_Step_0_gml_34_0");
        }
        else
        {
            msgsetloc(0, "IT'S A DRY^1, SAD PIT./%", "obj_board_smallpond_sword_slash_Step_0_gml_39_0");
        }
        bw_make();
        myinteract = 5;
    }
    if (myinteract == 5 && !i_ex(obj_board_writer))
        myinteract = 9;
    if (myinteract == 9)
    {
        myinteract = 0;
        buffer = 3;
        global.interact = 0;
        if (kr != 0)
            kr.canfreemove = kr_mem;
        if (su != 0)
            su.canfreemove = su_mem;
        if (ra != 0)
            ra.canfreemove = ra_mem;
    }
    if (wither == 1)
    {
        with (obj_board_waterfall)
            wither = 1;
        wither = 2;
    }
    if (wither >= 1)
    {
        myinteract = 99999999999;
        buffer = 9999999999;
        image_index = 1;
        if (i_ex(mysolid))
            safe_delete(mysolid);
    }
}
