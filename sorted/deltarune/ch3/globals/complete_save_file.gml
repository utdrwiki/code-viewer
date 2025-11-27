function scr_complete_save_file()
{
    _remfilechoice = global.filechoice;
    global.filechoice += 3;
    scr_set_ini_value(global.chapter, global.filechoice, "SideB", scr_sideb_active());
    scr_save();
    global.filechoice = _remfilechoice;
}

function scr_chapter_save_file_exists(arg0)
{
    var _exists = false;
    for (var i = 0; i < 3; i++)
    {
        _exists = ossafe_file_exists("filech" + string(arg0) + "_" + string(i));
        if (_exists == true)
            break;
    }
    return _exists;
}

function scr_completed_chapter(arg0)
{
    return ossafe_file_exists("filech" + string(arg0) + "_" + string(global.filechoice + 3));
}

function scr_completed_chapter_any_slot(arg0)
{
    var _file_exists = false;
    for (var i = 0; i < 3; i++)
    {
        if (ossafe_file_exists("filech" + string(arg0) + "_" + string(i + 3)))
        {
            _file_exists = true;
            break;
        }
    }
    return _file_exists;
}

function scr_get_secret_boss_result(arg0)
{
    var fought_flag = scr_get_secret_boss_flag(arg0);
    return global.flag[fought_flag];
}

function scr_defeated_secret_boss_any_slot(arg0)
{
    var _fought_boss = scr_fought_secret_boss_any_slot(arg0);
    var _defeated = false;
    if (_fought_boss)
    {
        for (var i = 0; i < 3; i++)
        {
            var _slot = i;
            var _result = scr_get_ura_value(arg0, _slot);
            if (_result == 1 || _result == 3)
            {
                _defeated = true;
                break;
            }
        }
    }
    return _defeated;
}

function scr_spared_secret_boss_any_slot(arg0)
{
    var _fought_boss = scr_fought_secret_boss_any_slot(arg0);
    var _spared = false;
    if (_fought_boss)
    {
        for (var i = 0; i < 3; i++)
        {
            var _slot = i;
            var _result = scr_get_ura_value(arg0, _slot);
            if (_result >= 2)
            {
                _spared = true;
                break;
            }
        }
    }
    return _spared;
}

function scr_fought_secret_boss(arg0)
{
    return scr_get_secret_boss_result(arg0) > 0;
}

function scr_fought_secret_boss_any_slot(arg0)
{
    var _fought = false;
    for (var i = 0; i < 3; i++)
    {
        var _slot = i;
        var _result = scr_get_ura_value(arg0, _slot);
        if (_result > 0)
        {
            _fought = true;
            break;
        }
    }
    return _fought;
}

function scr_get_secret_boss_flag(arg0)
{
    var fought_flag = 241;
    switch (arg0)
    {
        case 1:
            fought_flag = 241;
            break;
        case 2:
            fought_flag = 571;
            break;
        case 3:
            fought_flag = 1047;
            break;
        default:
            break;
    }
    return fought_flag;
}

function scr_enable_chapter_skip(arg0)
{
    var _skip_flag = 38;
    switch (arg0)
    {
        case 2:
            _skip_flag = 39;
            break;
        case 3:
            _skip_flag = 40;
            break;
        default:
            break;
    }
    global.tempflag[_skip_flag] = 1;
}

function scr_get_knight_total_loss_count()
{
    var _times_lost = 0;
    var _chapter = 3;
    var _fought_boss = scr_fought_secret_boss_any_slot(_chapter);
    if (_fought_boss)
    {
        for (var i = 0; i < 3; i++)
        {
            var _slot = i;
            var _result = scr_get_ura_value(_chapter, _slot);
            if (_result == 2)
                _times_lost++;
        }
    }
    return _times_lost;
}

function scr_get_knight_total_attempts()
{
    var _times_attempted = 0;
    var _chapter = 3;
    var _fought_boss = scr_fought_secret_boss_any_slot(_chapter);
    if (_fought_boss)
    {
        for (var i = 0; i < 3; i++)
        {
            var _slot = i;
            var _result = scr_get_ura_value(_chapter, _slot);
            if (_result > 0)
                _times_attempted++;
        }
    }
    return _times_attempted;
}

function scr_set_ini_value(arg0, arg1, arg2, arg3)
{
    var iniwrite = ossafe_ini_open("dr.ini");
    ini_write_real(scr_ini_chapter(arg0, arg1), arg2, arg3);
    ossafe_ini_close();
}

function scr_get_ini_value_all_slots(arg0, arg1)
{
    var _ini_file = ossafe_ini_open("dr.ini");
    var _list = [];
    for (var i = 0; i < 6; i++)
    {
        var _slot = i;
        var _value = ini_read_real(scr_ini_chapter(arg0, _slot), arg1, 0);
        _list[i][0] = _slot;
        _list[i][1] = _value;
    }
    ossafe_ini_close();
    return _list;
}

function scr_get_ini_value(arg0, arg1, arg2)
{
    var _ini_file = ossafe_ini_open("dr.ini");
    var _ini_value = ini_read_real(scr_ini_chapter(arg0, arg1), arg2, 0);
    ossafe_ini_close();
    return _ini_value;
}

function scr_get_ura_value(arg0, arg1)
{
    var _ini_file = ossafe_ini_open("dr.ini");
    var _ini_value = ini_read_real("URA", string(arg0) + "_" + string(arg1), 0);
    ossafe_ini_close();
    return _ini_value;
}

function scr_set_ura_value(arg0, arg1, arg2)
{
    var _ini_file = ossafe_ini_open("dr.ini");
    var _ini_value = ini_write_real("URA", string(arg0) + "_" + string(arg1), arg2);
    ossafe_ini_close();
    return _ini_value;
}

function scr_store_ura_result(arg0, arg1, arg2)
{
    if (arg2 == 0)
        exit;
    var slot = arg1;
    if (slot > 2)
        slot -= 3;
    var current_result = scr_get_ura_value(arg0, slot);
    var new_result = arg2;
    if ((arg2 + current_result) == 3)
        new_result = 3;
    scr_set_ura_value(arg0, slot, new_result);
}

function scr_get_vhs_ini_value()
{
    var _ini_file = ossafe_ini_open("dr.ini");
    var _ini_value = ini_read_real("VHS", "watched", 0);
    ossafe_ini_close();
    return _ini_value;
}

function scr_set_vhs_ini_value(arg0)
{
    var iniwrite = ossafe_ini_open("dr.ini");
    ini_write_real("VHS", "watched", arg0);
    ossafe_ini_close();
    ossafe_savedata_save();
}
