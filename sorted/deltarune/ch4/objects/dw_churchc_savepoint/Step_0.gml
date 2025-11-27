scr_populatechars();
if (!init)
    init = 1;
with (shop)
{
    if (myinteract == 3)
    {
        global.interact = 1;
        global.msc = -99;
        global.choice = -1;
        maketype = 0;
        cost = -1;
        global.choicemsg[0] = stringsetloc("#Make#Scarlixir#($500)", "obj_dw_churchc_savepoint_slash_Step_0_gml_22_0");
        global.choicemsg[1] = stringsetloc("#Make#Rhapsotea#($300)", "obj_dw_churchc_savepoint_slash_Step_0_gml_23_0");
        global.choicemsg[2] = stringsetloc("Do Not", "obj_dw_churchc_savepoint_slash_Step_0_gml_24_0");
        global.choicemsg[3] = stringset("");
        scr_speaker("no_name");
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a strange spring^1, with many chalices.)/", "obj_dw_churchc_savepoint_slash_Step_0_gml_29_0");
        msgnextloc("* (When coins are added^1, the liquid transforms...)/", "obj_dw_churchc_savepoint_slash_Step_0_gml_30_0");
        if (talked)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Strange spring.)/", "obj_dw_churchc_savepoint_slash_Step_0_gml_35_0");
        }
        msgnext("\\C3 ");
        d_make();
        myinteract = 4;
        talked++;
    }
    if (myinteract == 4 && global.choice != -1)
    {
        if (global.choice == 2)
        {
            k_d();
            myinteract = 99;
        }
        else
        {
            k_d(1);
            if (global.choice == 0)
            {
                cost = 500;
                maketype = 1;
            }
            if (global.choice == 1)
            {
                cost = 300;
                maketype = 2;
            }
            var haveroom = scr_inventoryspace() + scr_pocketspace();
            var havegold = false;
            if (global.gold >= cost)
                havegold = true;
            if (haveroom && havegold)
            {
                var itemid = 62;
                if (maketype == 2)
                    itemid = 61;
                global.gold -= cost;
                msgset(0, scr_itemget_anytype_text(itemid, "item"));
                snd_play(snd_equip);
            }
            if (!haveroom)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (Your inventory was full.)/%", "obj_dw_churchc_savepoint_slash_Step_0_gml_82_0");
            }
            if (!havegold)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (You didn't have enough to make it.)/%", "obj_dw_churchc_savepoint_slash_Step_0_gml_87_0");
            }
            d_make();
            myinteract = 99;
        }
    }
    if (myinteract == 99 && !d_ex())
    {
        global.interact = 0;
        myinteract = 0;
    }
}
