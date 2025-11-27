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
if (scr_flag_get(742) > 0)
{
    if (scr_flag_get(742) >= 7)
    {
        instance_destroy();
        exit;
    }
    convo_index = scr_flag_get(742);
}
convo[0][0] = [new scr_auto_convo("asgore", stringsetloc("\\E0* Dum dee dum...", "obj_homealone_bathroom_convo_slash_Create_0_gml_70_0"), ["face_up"])];
convo[0][1] = [new scr_auto_convo("asgore", stringsetloc("\\E5* Phew^1! Cleaning up sure works up an appetite.", "obj_homealone_bathroom_convo_slash_Create_0_gml_73_0"), ["face_down"])];
convo[0][2] = [new scr_auto_convo("asgore", stringsetloc("\\E3* ..^1. I wonder if the kitchen has any treats for me...", "obj_homealone_bathroom_convo_slash_Create_0_gml_76_0"), ["face_left"])];
convo[0][3] = [new scr_auto_convo("asgore", stringsetloc("\\E1* ..^1. No. Not now. I can't afford to take a break.", "obj_homealone_bathroom_convo_slash_Create_0_gml_79_0"), ["face_up"])];
convo[0][4] = [new scr_auto_convo("asgore", stringsetloc("\\E2* Now^1, more than ever..^1. I need to concentrate.", "obj_homealone_bathroom_convo_slash_Create_0_gml_82_0"), ["head_down"])];
convo[0][5] = [new scr_auto_convo("asgore", stringsetloc("\\E3* ..^1. to settle this once and for all.", "obj_homealone_bathroom_convo_slash_Create_0_gml_85_0"))];
convo[0][6] = [new scr_auto_convo("asgore", stringsetloc("\\E1* ..^1. I've got to go look again.", "obj_homealone_bathroom_convo_slash_Create_0_gml_88_0"), ["face_down"])];

init_parent = function(arg0)
{
    _parent = arg0;
};

start_convo = function()
{
    con = 0;
    change_convo_index(0);
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

start_final_convo = function()
{
    change_convo_index(1, 2);
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
