_parent = -4;
auto_text = true;
auto_text_buffer_time = 90;
auto_text_buffer = auto_text_buffer_time;
auto_text_start = false;
auto_text_stop = false;
con = -1;
convo = [];
convo_parent_index = 0;
convo_index = 0;
convo_line_index = 0;
convo_wait = false;
convo_timer = 0;
if (scr_flag_get(1558) > 0)
{
    if (scr_flag_get(1558) >= 11)
    {
        instance_destroy();
        exit;
    }
    convo_index = scr_flag_get(1558);
}
convo[0][0] = [new scr_auto_convo("asgore", stringsetloc("\\E0* We're almost there^1, aren't we^1, old friend?", "obj_homealone_north_convo_slash_Create_0_gml_94_0"))];
convo[0][1] = [new scr_auto_convo("asgore", stringsetloc("\\E2* This time for sure..^1. Tori will finally see.", "obj_homealone_north_convo_slash_Create_0_gml_97_0"))];
convo[0][2] = [new scr_auto_convo("asgore", stringsetloc("\\E0* ..^1. see what really happened.", "obj_homealone_north_convo_slash_Create_0_gml_100_0"))];
convo[0][3] = [new scr_auto_convo("asgore", stringsetloc("\\E3* ..^1. that I just wanted to..^1. protect everyone...", "obj_homealone_north_convo_slash_Create_0_gml_103_0"))];
convo[0][4] = [new scr_auto_convo("asgore", stringsetloc("\\E1* And this time^1, she'll have to believe me.", "obj_homealone_north_convo_slash_Create_0_gml_106_0"))];
convo[0][5] = [new scr_auto_convo("asgore", stringsetloc("\\E0* ..^1. they all will.", "obj_homealone_north_convo_slash_Create_0_gml_109_0"))];
convo[0][6] = [new scr_auto_convo("asgore", stringsetloc("\\E2* Then...", "obj_homealone_north_convo_slash_Create_0_gml_112_0"))];
convo[0][7] = [new scr_auto_convo("asgore", stringsetloc("\\E3* We'll all be a happy family again..^1. won't we?", "obj_homealone_north_convo_slash_Create_0_gml_115_0"))];
convo[0][8] = [new scr_auto_convo("asgore", stringsetloc("\\E2* ...", "obj_homealone_north_convo_slash_Create_0_gml_118_0"))];
convo[0][9] = [new scr_auto_convo("asgore", stringsetloc("\\E0* It sure is beautiful^1, isn't it...?", "obj_homealone_north_convo_slash_Create_0_gml_121_0"))];
convo[0][10] = [new scr_auto_convo("asgore", stringsetloc("\\E1* ..^1. this black shard.", "obj_homealone_north_convo_slash_Create_0_gml_124_0"))];

init_parent = function(arg0)
{
    _parent = arg0;
};

start_convo = function()
{
    con = 0;
    change_convo_index(0, 3);
};

interrupt_convo = function()
{
    con = -1;
    with (obj_writer)
        instance_destroy();
    with (obj_dialoguer)
        instance_destroy();
};

change_convo_index = function(arg0, arg1 = 1)
{
    convo_parent_index = arg0;
    convo_line_index = 0;
    con = 0;
    set_timer(arg1 * 30);
};

set_timer = function(arg0)
{
    convo_timer = arg0;
};

trigger_event = function(arg0)
{
    with (_parent)
        trigger_event(arg0);
};
