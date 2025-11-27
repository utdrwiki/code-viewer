if (menu_talk_flag == "sell")
{
    scr_speaker("susie");
    msgsetloc(0, "\\E5* You don't get money for sticking stuff in the machine^1, dumbass!/", "obj_shop_vending_slash_Other_12_gml_8_0");
    msgnextloc("\\EK* That's like the first thing ANYONE tries./%", "obj_shop_vending_slash_Other_12_gml_9_0");
    if (talk_counter > 1)
    {
        scr_speaker("susie");
        msgsetloc(0, "\\E2* Let's stick Ralsei in the machine and see how much money he costs./", "obj_shop_vending_slash_Other_12_gml_14_0");
        scr_anyface_next("ralsei", 32);
        msgnextloc("\\EW* That's STILL not how it works!/%", "obj_shop_vending_slash_Other_12_gml_16_0");
    }
}
else if (menu_talk_flag == "talk")
{
    scr_speaker("no_name");
    msgsetloc(0, "* (The vending machine did not respond.)/%", "obj_shop_vending_slash_Other_12_gml_21_0");
    if (global.plot >= 280)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (The vending machine had no response.)/", "obj_shop_vending_slash_Other_12_gml_26_0");
        msgnextloc("* (..^1. well^1, maybe a little.)/", "obj_shop_vending_slash_Other_12_gml_27_0");
        msgnextloc("* (..^1. not really.)/%", "obj_shop_vending_slash_Other_12_gml_28_0");
    }
}
