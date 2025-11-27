function scr_shop_vending()
{
}

function vending_menu_option(arg0 = "", arg1 = 0, arg2 = "", arg3 = 0) constructor
{
    option_text = arg0;
    menu_type = arg1;
    talk_flag = arg2;
    talk_style = arg3;
    times_selected = 0;
}

function vending_item(arg0 = 0, arg1 = "", arg2 = 0) constructor
{
    item_id = arg0;
    item_type = arg1;
    item_desc = vending_get_item_description(item_id, item_type);
    point_value = arg2;
}

function vending_event(arg0 = 0, arg1 = "", arg2 = 0, arg3 = "", arg4 = []) constructor
{
    item_id = arg0;
    item_type = "event";
    item_desc = arg1;
    point_value = arg2;
    price_label = arg3;
    sold_flag = arg4;
}

function vending_get_item_description(arg0 = 0, arg1 = "")
{
    var _desc = "";
    if (arg1 == "item")
    {
        switch (arg0)
        {
            case 61:
                _desc = stringsetloc("ITEM#Tea made#of chants,#heals 115HP", "scr_shop_vending_slash_scr_shop_vending_gml_43_0_b");
                break;
            case 62:
                _desc = stringsetloc("ITEM#Sick#juice that#heals 160HP", "scr_shop_vending_slash_scr_shop_vending_gml_46_0_b");
                break;
            default:
                break;
        }
    }
    else if (arg1 == "armor")
    {
        switch (arg0)
        {
            case 50:
                _desc = stringsetloc("ARMOR#Holey#amulet", "scr_shop_vending_slash_scr_shop_vending_gml_56_0");
                break;
            default:
                break;
        }
    }
    else if (arg1 == "weapon")
    {
        switch (arg0)
        {
            case 51:
                _desc = stringsetloc("WEAPON#Pagekeeper#scarf DF+1", "scr_shop_vending_slash_scr_shop_vending_gml_66_0_b");
                break;
            default:
                break;
        }
    }
    return _desc;
}
