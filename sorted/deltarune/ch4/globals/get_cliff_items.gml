function scr_get_cliff_items()
{
    var boss_list = [];
    for (var i = 0; i < (global.chapter - 1); i++)
    {
        var chapter = i + 1;
        var boss_result = scr_get_ura_value(chapter, global.filechoice);
        if (boss_result > 0)
        {
            var boss_data = [];
            if (boss_result == 3)
            {
                if (chapter == 2)
                {
                    if (boss_result == 3)
                        boss_result = 2;
                }
                else
                {
                    boss_result = 1;
                }
            }
            if (chapter == 3)
            {
                if (boss_result == 2)
                    continue;
            }
            boss_data[0] = chapter;
            boss_data[1] = boss_result;
            boss_list[array_length(boss_list)] = boss_data;
        }
    }
    var pending_items = [];
    for (var i = 0; i < array_length(boss_list); i++)
    {
        var boss_data = boss_list[i];
        var boss_chapter = boss_data[0];
        var boss_result = boss_data[1];
        var boss_item_data = scr_get_boss_item_id(boss_chapter, boss_result);
        var item_type = boss_item_data[0];
        var item_id = boss_item_data[1];
        var have_item = scr_has_boss_item("weapon", item_id) || scr_has_boss_item("armor", item_id);
        if (!have_item)
            pending_items[array_length(pending_items)] = boss_item_data;
    }
    return pending_items;
}

function scr_has_boss_item(arg0, arg1)
{
    var has_item = false;
    if (arg0 == "weapon")
        has_item = scr_weaponcheck_equipped_any(arg1) || scr_weaponcheck_inventory(arg1);
    else if (arg0 == "armor")
        has_item = scr_armorcheck_equipped_any(arg1) || scr_armorcheck_inventory(arg1);
    return has_item;
}

function scr_get_boss_item_id(arg0, arg1)
{
    var _chapter = arg0;
    var _item_type = (arg1 == 1) ? "weapon" : "armor";
    var _item_id = -1;
    switch (_chapter)
    {
        case 2:
            _item_id = 21;
            break;
        case 3:
            _item_id = 26;
            break;
        default:
            _item_id = 7;
            break;
    }
    var item_data = [];
    item_data[0] = _item_type;
    item_data[1] = _item_id;
    item_data[2] = _chapter;
    return item_data;
}

function scr_get_shadow_crystal_flag(arg0)
{
    var _chapter = arg0;
    var _flag = -1;
    switch (_chapter)
    {
        case 1:
            _flag = 1646;
            break;
        case 2:
            _flag = 1647;
            break;
        case 3:
            _flag = 1648;
            break;
        case 4:
            _flag = 1649;
            break;
        default:
            break;
    }
    return _flag;
}

function scr_get_shadow_crystal(arg0)
{
    var _chapter = arg0;
    var _flag = scr_get_shadow_crystal_flag(_chapter);
    if (scr_flag_get(_flag) == 0)
        scr_flag_set(_flag, 1);
}

function scr_get_total_shadow_crystal_amount()
{
    var _amount = 0;
    for (var i = 0; i < global.chapter; i++)
    {
        var _chapter = i + 1;
        var _flag = scr_get_shadow_crystal_flag(_chapter);
        _amount += scr_flag_get(_flag);
    }
    return _amount;
}
