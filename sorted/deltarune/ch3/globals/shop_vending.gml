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

function vending_item(arg0 = 0, arg1 = "", arg2 = 0, arg3 = 0) constructor
{
    item_id = arg0;
    item_type = arg1;
    item_desc = vending_get_item_description(item_id, item_type);
    point_value = arg2;
    custom_price = arg3;
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
            case 34:
                _desc = stringsetloc("ITEM#Even non-TVs#can eat it#HP+100", "scr_shop_vending_slash_scr_shop_vending_gml_43_0");
                break;
            case 37:
                _desc = stringsetloc("ITEM#Full of#nutrient#HP+80", "scr_shop_vending_slash_scr_shop_vending_gml_46_0");
                if (room == room_dw_changing_room)
                    _desc = stringsetloc("ITEM#Members#discount#deal!#HP+80", "scr_shop_vending_slash_scr_shop_vending_gml_49_0");
                break;
            case 39:
                _desc = stringsetloc("ITEM#Classy#meal for#big shots#HP+140", "scr_shop_vending_slash_scr_shop_vending_gml_53_0");
                break;
            default:
                break;
        }
    }
    else if (arg1 == "armor")
    {
        switch (arg0)
        {
            case 24:
                _desc = stringsetloc("ARMOR#Gain more TP#from bullets", "scr_shop_vending_slash_scr_shop_vending_gml_63_0");
                break;
            case 25:
                _desc = stringsetloc("ARMOR#Fragrant#armor", "scr_shop_vending_slash_scr_shop_vending_gml_66_0");
                break;
            default:
                break;
        }
    }
    else if (arg1 == "weapon")
    {
        switch (arg0)
        {
            case 23:
                _desc = stringsetloc("WEAPON#Tsun-type#armaments", "scr_shop_vending_slash_scr_shop_vending_gml_77_0");
                break;
            case 24:
                _desc = stringsetloc("WEAPON#Smelly#weapon", "scr_shop_vending_slash_scr_shop_vending_gml_80_0");
                break;
            case 25:
                _desc = stringsetloc("WEAPON#Weaklings#can flex too", "scr_shop_vending_slash_scr_shop_vending_gml_83_0");
                break;
            default:
                break;
        }
    }
    return _desc;
}
