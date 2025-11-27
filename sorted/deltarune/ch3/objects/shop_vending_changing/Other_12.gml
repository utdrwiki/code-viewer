if (menu_talk_flag == "check")
{
    scr_speaker("no_name");
    msgsetloc(0, "* (There's graffiti here...)/", "obj_shop_vending_changing_slash_Other_12_gml_8_0");
    msgnextloc("* (THE TV DINNERS..^1. I'VE SEEN WHAT THEY PUT IN THEM..^1. IT'S..^1. IT'S...)/", "obj_shop_vending_changing_slash_Other_12_gml_9_0");
    msgnextloc("* (Seems the message cuts off...)&* (Maybe they'll finish it later.)/%", "obj_shop_vending_changing_slash_Other_12_gml_10_0");
    if (global.plot >= 150)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (There's graffiti here...)/", "obj_shop_vending_changing_slash_Other_12_gml_15_0");
        msgnextloc("* (The TV Dinners are great and healthy!)&* (The white nose ice cream cones are made from Tenna's OWN noses!)/", "obj_shop_vending_changing_slash_Other_12_gml_16_0");
        msgnextloc("* (They certainly aren't recycled from...)/", "obj_shop_vending_changing_slash_Other_12_gml_17_0");
        msgnextloc("* (Seems the message cuts off...)&* (Maybe they'll finish it later.)/%", "obj_shop_vending_changing_slash_Other_12_gml_18_0");
    }
    if (global.plot >= 200)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (There's graffiti here...)/", "obj_shop_vending_changing_slash_Other_12_gml_24_0");
        msgnextloc("* (IN..^1. TENNA'S..^1. WARDROBE..^1. A SUPPLY..^1. HE'S GRINDING THEM UP..^1. FEEDING IT TO US...)/", "obj_shop_vending_changing_slash_Other_12_gml_25_0");
        msgnextloc("* (What? People? Is he grinding up people?)/", "obj_shop_vending_changing_slash_Other_12_gml_26_0");
        msgnextloc("* (OH NO..^1. LOL..^1. IT'S NOT PEOPLE IT'S JUST P...)/", "obj_shop_vending_changing_slash_Other_12_gml_27_0");
        msgnextloc("* (Seems the message cuts off...)&* (They're probably not going to finish it.)/%", "obj_shop_vending_changing_slash_Other_12_gml_28_0");
    }
}
if (menu_talk_flag == "exchange")
{
    global.msc = 1272;
    scr_text(global.msc);
}
if (menu_talk_flag == "smile")
{
    var _current_points = scr_flag_get(1044);
    scr_speaker("no_name");
    if (_current_points > 0)
    {
        scr_flag_set(1044, _current_points - 1);
        msgsetloc(0, "* It smiled./%", "obj_shop_vending_changing_slash_Other_12_gml_58_0");
    }
    else
    {
        msgsetloc(0, "* It still smiled./%", "obj_shop_vending_changing_slash_Other_12_gml_61_0");
    }
}
