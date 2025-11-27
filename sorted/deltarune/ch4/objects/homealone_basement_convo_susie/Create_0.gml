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
start_convo_index = 0;
if (scr_flag_get(895) > 0)
{
    if (scr_flag_get(895) >= 3)
    {
        instance_destroy();
        exit;
    }
    convo_index = scr_flag_get(895);
}
convo_wait = false;
convo_timer = 0;
convo[0][0] = [new scr_auto_convo("susie", stringsetloc("* ..^1. Damn^1, I've moved everything but I can't find anything...", "obj_homealone_basement_convo_susie_slash_Create_0_gml_34_0"))];
convo[0][1] = [new scr_auto_convo("susie", stringsetloc("* ..^1. wonder how Kris's search is going.", "obj_homealone_basement_convo_susie_slash_Create_0_gml_37_0"))];
convo[0][2] = [new scr_auto_convo("susie", stringsetloc("* ..^1. nothing to do but keep looking^1, I guess.", "obj_homealone_basement_convo_susie_slash_Create_0_gml_40_0"))];

start_convo = function()
{
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

change_convo_index = function(arg0)
{
    convo_parent_index = arg0;
    convo_line_index = 0;
    con = 0;
    set_timer(900);
};

set_timer = function(arg0)
{
    convo_timer = arg0;
};
