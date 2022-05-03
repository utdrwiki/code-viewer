var lines;
scr_validate_data = function(argument0) //gml_Script_scr_validate_data
{
    if (os_type == os_switch)
        return 1;
    var data = argument0
    var num_lines = 0
    while (string_byte_length(data) > 0)
    {
        var newline_pos = string_pos("\n", data)
        if (newline_pos > 0)
        {
            var nextline_pos = (newline_pos + 1)
            if (newline_pos > 1 && string_char_at(data, (newline_pos - 1)) == "\r")
                newline_pos--
            if (newline_pos > 1)
                var line = substr(data, 1, (newline_pos - 1))
            else
                line = ""
            if (nextline_pos <= strlen(data))
                data = substr(data, nextline_pos)
            else
                data = ""
        }
        else
        {
            line = data
            data = ""
        }
        lines[num_lines++] = line
    }
    myfileid = ds_map_create()
    ds_map_set(myfileid, "is_write", 0)
    ds_map_set(myfileid, "text", lines)
    ds_map_set(myfileid, "num_lines", num_lines)
    ds_map_set(myfileid, "line", 0)
    ds_map_set(myfileid, "line_read", 0)
    var test_truename = ossafe_file_text_read_string(myfileid)
    if (test_truename != global.truename)
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    if (!(scr_validate_list(myfileid, global.othername)))
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    var is_valid = 1
    var i = 0
    while (i < 3)
    {
        var char_test = ossafe_file_text_read_real(myfileid)
        if (char_test != global.char[i])
        {
            is_valid = 0
            break
        }
        else
        {
            ossafe_file_text_readln(myfileid)
            i++
            continue
        }
    }
    if (!is_valid)
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    var test_gold = ossafe_file_text_read_real(myfileid)
    if (test_gold != global.gold)
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    var test_xp = ossafe_file_text_read_real(myfileid)
    if (test_xp != global.xp)
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    var test_lv = ossafe_file_text_read_real(myfileid)
    if (test_lv != global.lv)
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    var test_inv = ossafe_file_text_read_real(myfileid)
    if (test_inv != global.inv)
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    var test_invc = ossafe_file_text_read_real(myfileid)
    if (test_invc != global.invc)
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    var test_darkzone = ossafe_file_text_read_real(myfileid)
    if (test_darkzone != global.darkzone)
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    if (!(scr_validate_list(myfileid, global.hp)))
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    if (!(scr_validate_list(myfileid, global.maxhp)))
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    if (!(scr_validate_list(myfileid, global.at)))
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    if (!(scr_validate_list(myfileid, global.df)))
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    if (!(scr_validate_list(myfileid, global.mag)))
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    if (!(scr_validate_list(myfileid, global.guts)))
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    if (!(scr_validate_list(myfileid, global.charweapon)))
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    if (!(scr_validate_list(myfileid, global.chararmor1)))
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    if (!(scr_validate_list(myfileid, global.chararmor2)))
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    if (!(scr_validate_list(myfileid, global.weaponstyle)))
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    is_valid = 1
    for (i = 0; i < 5; i += 1)
    {
        q = 0
        while (q < 4)
        {
            var test_itemat = ossafe_file_text_read_real(myfileid)
            if (test_itemat != global.itemat[i][q])
            {
                is_valid = 0
                break
            }
            else
            {
                ossafe_file_text_readln(myfileid)
                var test_itemdf = ossafe_file_text_read_real(myfileid)
                if (test_itemdf != global.itemdf[i][q])
                {
                    is_valid = 0
                    break
                }
                else
                {
                    ossafe_file_text_readln(myfileid)
                    var test_itemmag = ossafe_file_text_read_real(myfileid)
                    if (test_itemmag != global.itemmag[i][q])
                    {
                        is_valid = 0
                        break
                    }
                    else
                    {
                        ossafe_file_text_readln(myfileid)
                        var test_itembolts = ossafe_file_text_read_real(myfileid)
                        if (test_itembolts != global.itembolts[i][q])
                        {
                            is_valid = 0
                            break
                        }
                        else
                        {
                            ossafe_file_text_readln(myfileid)
                            var test_itemgrazeamt = ossafe_file_text_read_real(myfileid)
                            if (test_itemgrazeamt != global.itemgrazeamt[i][q])
                            {
                                is_valid = 0
                                break
                            }
                            else
                            {
                                ossafe_file_text_readln(myfileid)
                                var test_itemgrazesize = ossafe_file_text_read_real(myfileid)
                                if (test_itemgrazesize != global.itemgrazesize[i][q])
                                {
                                    is_valid = 0
                                    break
                                }
                                else
                                {
                                    ossafe_file_text_readln(myfileid)
                                    var test_itemboltspeed = ossafe_file_text_read_real(myfileid)
                                    if (test_itemboltspeed != global.itemboltspeed[i][q])
                                    {
                                        is_valid = 0
                                        break
                                    }
                                    else
                                    {
                                        ossafe_file_text_readln(myfileid)
                                        var test_itemspecial = ossafe_file_text_read_real(myfileid)
                                        if (test_itemspecial != global.itemspecial[i][q])
                                        {
                                            is_valid = 0
                                            break
                                        }
                                        else
                                        {
                                            ossafe_file_text_readln(myfileid)
                                            var test_itemelement = ossafe_file_text_read_real(myfileid)
                                            if (test_itemelement != global.itemelement[i][q])
                                            {
                                                is_valid = 0
                                                break
                                            }
                                            else
                                            {
                                                ossafe_file_text_readln(myfileid)
                                                var test_itemelementamount = ossafe_file_text_read_real(myfileid)
                                                if (test_itemelementamount != global.itemelementamount[i][q])
                                                {
                                                    is_valid = 0
                                                    break
                                                }
                                                else
                                                {
                                                    ossafe_file_text_readln(myfileid)
                                                    q += 1
                                                    continue
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        j = 0
        while (j < 12)
        {
            var test_spell = ossafe_file_text_read_real(myfileid)
            if (test_spell != global.spell[i][j])
            {
                is_valid = 0
                break
            }
            else
            {
                ossafe_file_text_readln(myfileid)
                j += 1
                continue
            }
        }
    }
    if (!is_valid)
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    var test_boltspeed = ossafe_file_text_read_real(myfileid)
    if (test_boltspeed != global.boltspeed)
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    var test_grazeamt = ossafe_file_text_read_real(myfileid)
    if (test_grazeamt != global.grazeamt)
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    var test_grazesize = ossafe_file_text_read_real(myfileid)
    if (test_grazesize != global.grazesize)
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    if (!(scr_validate_list(myfileid, global.item)))
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    if (!(scr_validate_list(myfileid, global.keyitem)))
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    if (!(scr_validate_list(myfileid, global.weapon)))
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    if (!(scr_validate_list(myfileid, global.armor)))
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    if (!(scr_validate_list(myfileid, global.pocketitem)))
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    var test_tension = ossafe_file_text_read_real(myfileid)
    if (test_tension != global.tension)
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    var test_maxtension = ossafe_file_text_read_real(myfileid)
    if (test_maxtension != global.maxtension)
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    var test_lweapon = ossafe_file_text_read_real(myfileid)
    if (test_lweapon != global.lweapon)
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    var test_larmor = ossafe_file_text_read_real(myfileid)
    if (test_larmor != global.larmor)
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    var test_lxp = ossafe_file_text_read_real(myfileid)
    if (test_lxp != global.lxp)
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    var test_llv = ossafe_file_text_read_real(myfileid)
    if (test_llv != global.llv)
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    var test_lgold = ossafe_file_text_read_real(myfileid)
    if (test_lgold != global.lgold)
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    var test_lhp = ossafe_file_text_read_real(myfileid)
    if (test_lhp != global.lhp)
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    var test_lmaxhp = ossafe_file_text_read_real(myfileid)
    if (test_lmaxhp != global.lmaxhp)
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    var test_lat = ossafe_file_text_read_real(myfileid)
    if (test_lat != global.lat)
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    var test_ldf = ossafe_file_text_read_real(myfileid)
    if (test_ldf != global.ldf)
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    var test_lwstrength = ossafe_file_text_read_real(myfileid)
    if (test_lwstrength != global.lwstrength)
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    var test_ladef = ossafe_file_text_read_real(myfileid)
    if (test_ladef != global.ladef)
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    if (!(scr_validate_list(myfileid, global.litem)))
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    if (!(scr_validate_list(myfileid, global.phone)))
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    if (!(scr_validate_list(myfileid, global.flag)))
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    var test_plot = ossafe_file_text_read_real(myfileid)
    if (test_plot != global.plot)
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    var test_room = ossafe_file_text_read_real(myfileid)
    if (test_room != global.currentroom)
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    var test_time = ossafe_file_text_read_real(myfileid)
    if (test_time != global.lastsavedtime)
    {
        ds_map_destroy(myfileid)
        return 0;
    }
    else
        ossafe_file_text_readln(myfileid)
    ds_map_destroy(myfileid)
    return 1;
}

