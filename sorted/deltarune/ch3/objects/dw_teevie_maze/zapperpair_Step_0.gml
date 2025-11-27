if (init == 0)
{
    if (extflag == "fight")
    {
        if (global.flag[fightflag] != 0)
            instance_destroy();
    }
    if (facing != -1)
        dir = facing;
    mysolid = instance_create(x + 40, y + 112, obj_solidblocksized);
    init = 1;
}
if (extflag != "fight")
{
    if (con == 1)
    {
        global.interact = 1;
        global.msc = -99;
        global.choice = -1;
        global.choicemsg[0] = stringsetloc("#Yes", "obj_dw_teevie_maze_zapperpair_slash_Step_0_gml_27_0");
        global.choicemsg[1] = stringsetloc("#No", "obj_dw_teevie_maze_zapperpair_slash_Step_0_gml_28_0");
        global.choicemsg[2] = stringset("");
        global.choicemsg[3] = stringset("");
        scr_speaker("zapper");
        msgsetloc(0, "* You seem lost. Do youse need assistance?/", "obj_dw_teevie_maze_zapperpair_slash_Step_0_gml_32_0");
        msgnext("\\C2 ");
        d_make();
        con = 2;
    }
    if (con == 2 && global.choice != -1)
    {
        k_d(1);
        if (global.choice == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* That can be arranged./%", "obj_dw_teevie_maze_zapperpair_slash_Step_0_gml_43_0");
            d_make();
            con = 3;
        }
        if (global.choice == 1)
        {
            con = 0;
            global.interact = 0;
        }
    }
    if (con == 3 && !d_ex())
    {
        timer++;
        if (timer == 1)
        {
            var found = 0;
            with (object_index)
            {
                if (extflag == other.extflag && id != other.id)
                    found = id;
            }
            targx = found.x - 32;
            targy = found.y + 74;
        }
        if (timer == 5)
        {
            timer = 0;
            con = 0;
            change = instance_create(x, y, obj_tvturnoff_manager);
            change.kind = 2;
            change.targx = targx;
            change.targy = targy;
        }
    }
}
if (extflag == "fight")
{
    if (con == 1)
    {
        global.interact = 1;
        scr_speaker("zapper");
        msgsetloc(0, "* Youse seem lost. Like you could use some help./", "obj_dw_teevie_maze_zapperpair_slash_Step_0_gml_84_0");
        scr_anyface_next("ralsei", 0);
        msgnextloc("* I think we're okay./", "obj_dw_teevie_maze_zapperpair_slash_Step_0_gml_86_0");
        scr_anyface_next("no_name", 0);
        msgnextloc("* Nah^1, youse need some help./%", "obj_dw_teevie_maze_zapperpair_slash_Step_0_gml_88_0");
        d_make();
        con = 2;
    }
    if (con == 2 && !d_ex())
    {
        visible = false;
        var mark = scr_dark_marker(x, y, sprite_index);
        scr_battle(137, 0, mark);
        con = 3;
        instance_destroy();
    }
}
