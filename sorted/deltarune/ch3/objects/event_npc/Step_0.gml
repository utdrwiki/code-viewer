if (init == 0)
{
    if (npc == "munmi1")
    {
        mynpc = instance_create(x - 32, y, obj_board_marker);
        mynpc.sprite_index = spr_board_npc_munmi;
        scr_darksize(mynpc);
        mynpc.depth = depth;
    }
    if (npc == "munmi2")
    {
        mynpc = instance_create(x, y - 32, obj_board_marker);
        mynpc.sprite_index = spr_board_npc_munmi;
        scr_darksize(mynpc);
        mynpc.depth = depth;
    }
    init = 1;
}
if (tilecon == 0)
{
    if (tilechoice == 2)
    {
        if (npc == "munmi1" || npc == "munmi2")
        {
            scr_speaker("no_name");
            msgsetloc(0, "* It's some sort of munmi./%", "obj_event_npc_slash_Step_0_gml_34_0");
            writer = instance_create(x, y, obj_board_writer);
        }
        looked++;
        if (tilecon == 0)
            tilecon = 99;
    }
    if (tilechoice == 3)
    {
        if (npc == "munmi1")
        {
            scr_speaker("no_name");
            msgsetloc(0, "* I'm a munmi girl/", "obj_event_npc_slash_Step_0_gml_45_0");
            msgnextloc("* In a munmi world/", "obj_event_npc_slash_Step_0_gml_46_0");
            msgnextloc("* Wrapped in fabric/", "obj_event_npc_slash_Step_0_gml_47_0");
            msgnextloc("* It's not so great./%", "obj_event_npc_slash_Step_0_gml_48_0");
            writer = instance_create(x, y, obj_board_writer);
        }
        if (npc == "munmi2")
        {
            scr_speaker("no_name");
            msgsetloc(0, "* I think there's a crying child on the other side of these cactuses./%", "obj_event_npc_slash_Step_0_gml_55_0");
            writer = instance_create(x, y, obj_board_writer);
        }
        talked++;
        if (tilecon == 0)
            tilecon = 99;
    }
}
if (tilecon == 99)
{
    tilechoice = 0;
    if (!i_ex(writer))
    {
        tilecon = 0;
        obj_board_controller.phase = 0;
        obj_board_controller.inputbuffer = 2;
    }
}
