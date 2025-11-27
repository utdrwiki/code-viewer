function scr_get_parallel_convo(arg0)
{
    var convo_index = arg0;
    var convo = 0;
    if (convo_index == 0)
        convo = [new scr_parallel_convo_line("susie", stringsetloc("\\E0* Anyway^1, so I've been thinking.../%", "scr_parallel_convo_slash_scr_parallel_convo_gml_13_0")), new scr_parallel_convo_line("susie", stringsetloc("\\EA* About some of those movies last night./%", "scr_parallel_convo_slash_scr_parallel_convo_gml_14_0")), new scr_parallel_convo_line("susie", stringsetloc("\\E2* Think YOU could survive BLOOD CRUSHERS 2, Ralsei?/%", "scr_parallel_convo_slash_scr_parallel_convo_gml_15_0")), new scr_parallel_convo_line("ralsei", stringsetloc("\\EQ* Haha^1, umm^1, I don't know^1, I've never seen a movie...!/%", "scr_parallel_convo_slash_scr_parallel_convo_gml_16_0")), new scr_parallel_convo_line("susie", stringsetloc("\\EL* Heh^1, really?/%", "scr_parallel_convo_slash_scr_parallel_convo_gml_17_0"))];
    if (convo_index == 1)
        convo = [new scr_parallel_convo_line("susie", stringsetloc("\\E2* Would you want to?/%", "scr_parallel_convo_slash_scr_parallel_convo_gml_26_0")), new scr_parallel_convo_line("ralsei", stringsetloc("\\EL* H..^1. huh?/%", "scr_parallel_convo_slash_scr_parallel_convo_gml_27_0")), new scr_parallel_convo_line("susie", stringsetloc("\\EA* Y'know^1. Come watch next time^1. Movies./%", "scr_parallel_convo_slash_scr_parallel_convo_gml_28_0")), new scr_parallel_convo_line("ralsei", stringsetloc("\\EQ* Oh...^1! That would..^1. be nice^1, wouldn't it?/%", "scr_parallel_convo_slash_scr_parallel_convo_gml_29_0"))];
    if (convo_index == 2)
        convo = [new scr_parallel_convo_line("susie", stringsetloc("\\EA* ..^1. and then^1, like.../%", "scr_parallel_convo_slash_scr_parallel_convo_gml_38_0")), new scr_parallel_convo_line("susie", stringsetloc("\\EL* It doesn't have to just be movies^1, y'know?/%", "scr_parallel_convo_slash_scr_parallel_convo_gml_39_0")), new scr_parallel_convo_line("susie", stringsetloc("\\EN* You could even..^1. like^1, go to school with us./%", "scr_parallel_convo_slash_scr_parallel_convo_gml_40_0")), new scr_parallel_convo_line("susie", stringsetloc("\\E9* Then we could get him to do our homework^1, right^1, Kris?/%", "scr_parallel_convo_slash_scr_parallel_convo_gml_41_0")), new scr_parallel_convo_line("ralsei", stringsetloc("\\EI* I.../%", "scr_parallel_convo_slash_scr_parallel_convo_gml_42_0")), new scr_parallel_convo_line("ralsei", stringsetloc("\\EQ* I'd..^1. love to do your homework^1, Susie.../%", "scr_parallel_convo_slash_scr_parallel_convo_gml_43_0"))];
    if (convo_index == 3)
        convo = [new scr_parallel_convo_line("susie", stringsetloc("\\E2* And then^1, like./%", "scr_parallel_convo_slash_scr_parallel_convo_gml_52_0")), new scr_parallel_convo_line("susie", stringsetloc("\\EA* Best idea for last./%", "scr_parallel_convo_slash_scr_parallel_convo_gml_53_0")), new scr_parallel_convo_line("susie", stringsetloc("\\EN* So there's this..^1. Festival in a few days^1, right?/%", "scr_parallel_convo_slash_scr_parallel_convo_gml_54_0")), new scr_parallel_convo_line("susie", stringsetloc("\\EQ* And^1, heh^1, maybe it's stupid^1, but.../%", "scr_parallel_convo_slash_scr_parallel_convo_gml_55_0")), new scr_parallel_convo_line("susie", stringsetloc("\\ET* Wouldn't it be kinda..^1. fun? If we all went?/%", "scr_parallel_convo_slash_scr_parallel_convo_gml_56_0"))];
    if (convo_index == 4)
        convo = [new scr_parallel_convo_line("susie", stringsetloc("\\EK* Um^1, by all^1, I mean Ralsei too^1, obviously?/%", "scr_parallel_convo_slash_scr_parallel_convo_gml_65_0")), new scr_parallel_convo_line("ralsei", stringsetloc("\\EQ* Susie^1, I..^1. Um^1, I'd.../%", "scr_parallel_convo_slash_scr_parallel_convo_gml_66_0")), new scr_parallel_convo_line("ralsei", stringsetloc("\\EQ* I'd like nothing more!/%", "scr_parallel_convo_slash_scr_parallel_convo_gml_67_0"))];
    if (convo_index == 5)
        convo = [new scr_parallel_convo_line("ralsei", stringsetloc("\\E5* I'd like nothing more than to go^1, Susie.../%", "scr_parallel_convo_slash_scr_parallel_convo_gml_76_0")), new scr_parallel_convo_line("ralsei", stringsetloc("\\E4* But..^1. I.../%", "scr_parallel_convo_slash_scr_parallel_convo_gml_77_0")), new scr_parallel_convo_line("susie", stringsetloc("\\E6* But you..^1. what?/%", "scr_parallel_convo_slash_scr_parallel_convo_gml_78_0"))];
    return convo;
}

function scr_parallel_convo_line(arg0, arg1) constructor
{
    speaker = arg0;
    dialogue = arg1;
}

function scr_parallel_convo_get_side()
{
    var side = 0;
    if (room == room_dw_couch_overworld_02)
    {
        if (obj_mainchara.y >= 670)
            side = 1;
        if (obj_mainchara.y >= 830)
            side = 0;
        if (obj_mainchara.y >= 1500)
            side = 1;
        if (obj_mainchara.y >= 2070)
            side = 0;
        if (obj_mainchara.y >= 2300)
            side = 1;
    }
    if (room == room_dw_couch_overworld_03)
    {
        if (obj_mainchara.y >= 300)
            side = 0;
        if (obj_mainchara.y >= 740)
            side = 0;
        if (obj_mainchara.y >= 1040)
            side = 1;
    }
    if (room == room_dw_couch_overworld_04)
    {
        side = 1;
        if (obj_mainchara.y >= 4850)
            side = 0;
    }
    if (room == room_dw_couch_overworld_05)
    {
        side = 1;
        if (obj_mainchara.y >= 800)
            side = 0;
    }
    if (obj_mainchara.sliding == 1)
        side = 1;
    return side;
}
