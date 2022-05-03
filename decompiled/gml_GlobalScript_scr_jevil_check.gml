scr_jevil_check = function() //gml_Script_scr_jevil_check
{
    var item_knife = 0
    var item_tail = 0
    jevil_status[0] = 0
    jevil_status[1] = 0
    jevil_status[2] = 0
    if (global.flag[241] >= 6)
    {
        item_knife = global.flag[241] == 6
        item_tail = global.flag[241] == 7
    }
    else
    {
        for (var k = obj_sneo_friedpipis; k < obj_pipisFireworkGenerator; k++)
        {
            if ossafe_file_exists(("filech1_" + string(k)))
            {
                var file = ("filech1_" + string(k))
                var myfileid = ossafe_file_text_open_read(file)
                ossafe_file_text_read_string(myfileid)
                ossafe_file_text_readln(myfileid)
                if (!global.is_console)
                {
                    for (var i = 0; i < 6; i += 1)
                    {
                        ossafe_file_text_read_string(myfileid)
                        ossafe_file_text_readln(myfileid)
                    }
                }
                else
                {
                    var othername_list = scr_ds_list_read(myfileid)
                    ds_list_destroy(othername_list)
                    ossafe_file_text_readln(myfileid)
                }
                ossafe_file_text_read_real(myfileid)
                ossafe_file_text_readln(myfileid)
                ossafe_file_text_read_real(myfileid)
                ossafe_file_text_readln(myfileid)
                ossafe_file_text_read_real(myfileid)
                ossafe_file_text_readln(myfileid)
                ossafe_file_text_read_real(myfileid)
                ossafe_file_text_readln(myfileid)
                ossafe_file_text_read_real(myfileid)
                ossafe_file_text_readln(myfileid)
                ossafe_file_text_read_real(myfileid)
                ossafe_file_text_readln(myfileid)
                ossafe_file_text_read_real(myfileid)
                ossafe_file_text_readln(myfileid)
                ossafe_file_text_read_real(myfileid)
                ossafe_file_text_readln(myfileid)
                ossafe_file_text_read_real(myfileid)
                ossafe_file_text_readln(myfileid)
                if global.is_console
                {
                    var hp_list = scr_ds_list_read(myfileid)
                    ds_list_destroy(hp_list)
                    ossafe_file_text_readln(myfileid)
                    var maxhp_list = scr_ds_list_read(myfileid)
                    ds_list_destroy(maxhp_list)
                    ossafe_file_text_readln(myfileid)
                    var at_list = scr_ds_list_read(myfileid)
                    ds_list_destroy(at_list)
                    ossafe_file_text_readln(myfileid)
                    var df_list = scr_ds_list_read(myfileid)
                    ds_list_destroy(df_list)
                    ossafe_file_text_readln(myfileid)
                    var mag_list = scr_ds_list_read(myfileid)
                    ds_list_destroy(mag_list)
                    ossafe_file_text_readln(myfileid)
                    var guts_list = scr_ds_list_read(myfileid)
                    ds_list_destroy(guts_list)
                    ossafe_file_text_readln(myfileid)
                    var charweapon_list = scr_ds_list_read(myfileid)
                    ds_list_destroy(charweapon_list)
                    ossafe_file_text_readln(myfileid)
                    var chararmor1_list = scr_ds_list_read(myfileid)
                    ds_list_destroy(chararmor1_list)
                    ossafe_file_text_readln(myfileid)
                    var chararmor2_list = scr_ds_list_read(myfileid)
                    ds_list_destroy(chararmor2_list)
                    ossafe_file_text_readln(myfileid)
                    var weaponstyle_list = scr_ds_list_read(myfileid)
                    ds_list_destroy(weaponstyle_list)
                    ossafe_file_text_readln(myfileid)
                }
                for (i = 0; i < 4; i += 1)
                {
                    if (!global.is_console)
                    {
                        file_text_read_real(myfileid)
                        file_text_readln(myfileid)
                        file_text_read_real(myfileid)
                        file_text_readln(myfileid)
                        file_text_read_real(myfileid)
                        file_text_readln(myfileid)
                        file_text_read_real(myfileid)
                        file_text_readln(myfileid)
                        file_text_read_real(myfileid)
                        file_text_readln(myfileid)
                        file_text_read_real(myfileid)
                        file_text_readln(myfileid)
                        file_text_read_real(myfileid)
                        file_text_readln(myfileid)
                        file_text_read_real(myfileid)
                        file_text_readln(myfileid)
                        file_text_read_real(myfileid)
                        file_text_readln(myfileid)
                        file_text_read_real(myfileid)
                        file_text_readln(myfileid)
                    }
                    for (var q = 0; q < 4; q += 1)
                    {
                        ossafe_file_text_read_real(myfileid)
                        ossafe_file_text_readln(myfileid)
                        ossafe_file_text_read_real(myfileid)
                        ossafe_file_text_readln(myfileid)
                        ossafe_file_text_read_real(myfileid)
                        ossafe_file_text_readln(myfileid)
                        ossafe_file_text_read_real(myfileid)
                        ossafe_file_text_readln(myfileid)
                        ossafe_file_text_read_real(myfileid)
                        ossafe_file_text_readln(myfileid)
                        ossafe_file_text_read_real(myfileid)
                        ossafe_file_text_readln(myfileid)
                        ossafe_file_text_read_real(myfileid)
                        ossafe_file_text_readln(myfileid)
                        ossafe_file_text_read_real(myfileid)
                        ossafe_file_text_readln(myfileid)
                    }
                    for (var j = 0; j < 12; j += 1)
                    {
                        ossafe_file_text_read_real(myfileid)
                        ossafe_file_text_readln(myfileid)
                    }
                }
                ossafe_file_text_read_real(myfileid)
                ossafe_file_text_readln(myfileid)
                ossafe_file_text_read_real(myfileid)
                ossafe_file_text_readln(myfileid)
                ossafe_file_text_read_real(myfileid)
                ossafe_file_text_readln(myfileid)
                if global.is_console
                {
                    var item_list = scr_ds_list_read(myfileid)
                    ds_list_destroy(item_list)
                    ossafe_file_text_readln(myfileid)
                    var keyitem_list = scr_ds_list_read(myfileid)
                    ds_list_destroy(keyitem_list)
                    ossafe_file_text_readln(myfileid)
                    var weapon_list = scr_ds_list_read(myfileid)
                    ds_list_destroy(weapon_list)
                    ossafe_file_text_readln(myfileid)
                    var armor_list = scr_ds_list_read(myfileid)
                    ds_list_destroy(armor_list)
                    ossafe_file_text_readln(myfileid)
                }
                else
                {
                    for (j = 0; j < 13; j += 1)
                    {
                        file_text_read_real(myfileid)
                        file_text_readln(myfileid)
                        file_text_read_real(myfileid)
                        file_text_readln(myfileid)
                        file_text_read_real(myfileid)
                        file_text_readln(myfileid)
                        file_text_read_real(myfileid)
                        file_text_readln(myfileid)
                    }
                }
                ossafe_file_text_read_real(myfileid)
                ossafe_file_text_readln(myfileid)
                ossafe_file_text_read_real(myfileid)
                ossafe_file_text_readln(myfileid)
                ossafe_file_text_read_real(myfileid)
                ossafe_file_text_readln(myfileid)
                ossafe_file_text_read_real(myfileid)
                ossafe_file_text_readln(myfileid)
                ossafe_file_text_read_real(myfileid)
                ossafe_file_text_readln(myfileid)
                ossafe_file_text_read_real(myfileid)
                ossafe_file_text_readln(myfileid)
                ossafe_file_text_read_real(myfileid)
                ossafe_file_text_readln(myfileid)
                ossafe_file_text_read_real(myfileid)
                ossafe_file_text_readln(myfileid)
                ossafe_file_text_read_real(myfileid)
                ossafe_file_text_readln(myfileid)
                ossafe_file_text_read_real(myfileid)
                ossafe_file_text_readln(myfileid)
                ossafe_file_text_read_real(myfileid)
                ossafe_file_text_readln(myfileid)
                ossafe_file_text_read_real(myfileid)
                ossafe_file_text_readln(myfileid)
                ossafe_file_text_read_real(myfileid)
                ossafe_file_text_readln(myfileid)
                if global.is_console
                {
                    var litem_list = scr_ds_list_read(myfileid)
                    ds_list_destroy(litem_list)
                    ossafe_file_text_readln(myfileid)
                    var phone_list = scr_ds_list_read(myfileid)
                    ds_list_destroy(phone_list)
                    ossafe_file_text_readln(myfileid)
                    var flag_list = scr_ds_list_read(myfileid)
                    for (i = 0; i < 242; i += 1)
                    {
                        if (i == 241)
                            jevil_status[k] = ds_list_find_value(flag_list, i)
                    }
                    ds_list_destroy(flag_list)
                    ossafe_file_text_readln(myfileid)
                }
                else
                {
                    for (i = 0; i < 8; i += 1)
                    {
                        file_text_read_real(myfileid)
                        file_text_readln(myfileid)
                        file_text_read_real(myfileid)
                        file_text_readln(myfileid)
                    }
                    for (i = 0; i < 242; i += 1)
                    {
                        if (i == 241)
                        {
                            jevil_status[k] = file_text_read_real(myfileid)
                            file_text_readln(myfileid)
                        }
                        else
                        {
                            file_text_read_real(myfileid)
                            file_text_readln(myfileid)
                        }
                    }
                }
                ossafe_file_text_close(myfileid)
            }
        }
        for (i = 0; i < array_length_1d(jevil_status); i++)
        {
            if (jevil_status[i] >= 6)
            {
                if (!item_knife)
                    item_knife = jevil_status[i] == 6
                if (!item_tail)
                    item_tail = jevil_status[i] == 7
            }
        }
    }
    if item_knife
        global.tempflag[36] = 2
    else if item_tail
        global.tempflag[36] = 1
    return;
}

