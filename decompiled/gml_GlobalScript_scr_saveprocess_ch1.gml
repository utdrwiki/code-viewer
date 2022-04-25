scr_saveprocess_ch1 = function(argument0) //gml_Script_scr_saveprocess_ch1
{
    global.lastsavedtime = global.time
    global.lastsavedlv = global.lv
    file = ("filech1_" + string(argument0))
    myfileid = ossafe_file_text_open_write_ch1(file)
    ossafe_file_text_write_string_ch1(myfileid, global.truename)
    ossafe_file_text_writeln_ch1(myfileid)
    if global.is_console
    {
        scr_ds_list_write_ch1(global.othername, 6)
        ossafe_file_text_writeln_ch1(myfileid)
    }
    else
    {
        for (i = 0; i < 6; i += 1)
        {
            ossafe_file_text_write_string_ch1(myfileid, global.othername[i])
            ossafe_file_text_writeln_ch1(myfileid)
        }
    }
    ossafe_file_text_write_real_ch1(myfileid, global.char[0])
    ossafe_file_text_writeln_ch1(myfileid)
    ossafe_file_text_write_real_ch1(myfileid, global.char[1])
    ossafe_file_text_writeln_ch1(myfileid)
    ossafe_file_text_write_real_ch1(myfileid, global.char[2])
    ossafe_file_text_writeln_ch1(myfileid)
    ossafe_file_text_write_real_ch1(myfileid, global.gold)
    ossafe_file_text_writeln_ch1(myfileid)
    ossafe_file_text_write_real_ch1(myfileid, global.xp)
    ossafe_file_text_writeln_ch1(myfileid)
    ossafe_file_text_write_real_ch1(myfileid, global.lv)
    ossafe_file_text_writeln_ch1(myfileid)
    ossafe_file_text_write_real_ch1(myfileid, global.inv)
    ossafe_file_text_writeln_ch1(myfileid)
    ossafe_file_text_write_real_ch1(myfileid, global.invc)
    ossafe_file_text_writeln_ch1(myfileid)
    ossafe_file_text_write_real_ch1(myfileid, global.darkzone)
    ossafe_file_text_writeln_ch1(myfileid)
    if global.is_console
    {
        scr_ds_list_write_ch1(global.hp, 4)
        ossafe_file_text_writeln_ch1(myfileid)
        scr_ds_list_write_ch1(global.maxhp, 4)
        ossafe_file_text_writeln_ch1(myfileid)
        scr_ds_list_write_ch1(global.at, 4)
        ossafe_file_text_writeln_ch1(myfileid)
        scr_ds_list_write_ch1(global.df, 4)
        ossafe_file_text_writeln_ch1(myfileid)
        scr_ds_list_write_ch1(global.mag, 4)
        ossafe_file_text_writeln_ch1(myfileid)
        scr_ds_list_write_ch1(global.guts, 4)
        ossafe_file_text_writeln_ch1(myfileid)
        scr_ds_list_write_ch1(global.charweapon, 4)
        ossafe_file_text_writeln_ch1(myfileid)
        scr_ds_list_write_ch1(global.chararmor1, 4)
        ossafe_file_text_writeln_ch1(myfileid)
        scr_ds_list_write_ch1(global.chararmor2, 4)
        ossafe_file_text_writeln_ch1(myfileid)
        scr_ds_list_write_ch1(global.weaponstyle, 4)
        ossafe_file_text_writeln_ch1(myfileid)
    }
    for (i = 0; i < 4; i += 1)
    {
        if (!global.is_console)
        {
            file_text_write_real(myfileid, global.hp[i])
            file_text_writeln(myfileid)
            file_text_write_real(myfileid, global.maxhp[i])
            file_text_writeln(myfileid)
            file_text_write_real(myfileid, global.at[i])
            file_text_writeln(myfileid)
            file_text_write_real(myfileid, global.df[i])
            file_text_writeln(myfileid)
            file_text_write_real(myfileid, global.mag[i])
            file_text_writeln(myfileid)
            file_text_write_real(myfileid, global.guts[i])
            file_text_writeln(myfileid)
            file_text_write_real(myfileid, global.charweapon[i])
            file_text_writeln(myfileid)
            file_text_write_real(myfileid, global.chararmor1[i])
            file_text_writeln(myfileid)
            file_text_write_real(myfileid, global.chararmor2[i])
            file_text_writeln(myfileid)
            file_text_write_string(myfileid, global.weaponstyle[i])
            file_text_writeln(myfileid)
        }
        for (q = 0; q < 4; q += 1)
        {
            ossafe_file_text_write_real_ch1(myfileid, global.itemat[i][q])
            ossafe_file_text_writeln_ch1(myfileid)
            ossafe_file_text_write_real_ch1(myfileid, global.itemdf[i][q])
            ossafe_file_text_writeln_ch1(myfileid)
            ossafe_file_text_write_real_ch1(myfileid, global.itemmag[i][q])
            ossafe_file_text_writeln_ch1(myfileid)
            ossafe_file_text_write_real_ch1(myfileid, global.itembolts[i][q])
            ossafe_file_text_writeln_ch1(myfileid)
            ossafe_file_text_write_real_ch1(myfileid, global.itemgrazeamt[i][q])
            ossafe_file_text_writeln_ch1(myfileid)
            ossafe_file_text_write_real_ch1(myfileid, global.itemgrazesize[i][q])
            ossafe_file_text_writeln_ch1(myfileid)
            ossafe_file_text_write_real_ch1(myfileid, global.itemboltspeed[i][q])
            ossafe_file_text_writeln_ch1(myfileid)
            ossafe_file_text_write_real_ch1(myfileid, global.itemspecial[i][q])
            ossafe_file_text_writeln_ch1(myfileid)
        }
        for (j = 0; j < 12; j += 1)
        {
            ossafe_file_text_write_real_ch1(myfileid, global.spell[i][j])
            ossafe_file_text_writeln_ch1(myfileid)
        }
    }
    ossafe_file_text_write_real_ch1(myfileid, global.boltspeed)
    ossafe_file_text_writeln_ch1(myfileid)
    ossafe_file_text_write_real_ch1(myfileid, global.grazeamt)
    ossafe_file_text_writeln_ch1(myfileid)
    ossafe_file_text_write_real_ch1(myfileid, global.grazesize)
    ossafe_file_text_writeln_ch1(myfileid)
    if global.is_console
    {
        scr_ds_list_write_ch1(global.item, 13)
        ossafe_file_text_writeln_ch1(myfileid)
        scr_ds_list_write_ch1(global.keyitem, 13)
        ossafe_file_text_writeln_ch1(myfileid)
        scr_ds_list_write_ch1(global.weapon, 13)
        ossafe_file_text_writeln_ch1(myfileid)
        scr_ds_list_write_ch1(global.armor, 13)
        ossafe_file_text_writeln_ch1(myfileid)
    }
    else
    {
        for (j = 0; j < 13; j += 1)
        {
            file_text_write_real(myfileid, global.item[j])
            file_text_writeln(myfileid)
            file_text_write_real(myfileid, global.keyitem[j])
            file_text_writeln(myfileid)
            file_text_write_real(myfileid, global.weapon[j])
            file_text_writeln(myfileid)
            file_text_write_real(myfileid, global.armor[j])
            file_text_writeln(myfileid)
        }
    }
    ossafe_file_text_write_real_ch1(myfileid, global.tension)
    ossafe_file_text_writeln_ch1(myfileid)
    ossafe_file_text_write_real_ch1(myfileid, global.maxtension)
    ossafe_file_text_writeln_ch1(myfileid)
    ossafe_file_text_write_real_ch1(myfileid, global.lweapon)
    ossafe_file_text_writeln_ch1(myfileid)
    ossafe_file_text_write_real_ch1(myfileid, global.larmor)
    ossafe_file_text_writeln_ch1(myfileid)
    ossafe_file_text_write_real_ch1(myfileid, global.lxp)
    ossafe_file_text_writeln_ch1(myfileid)
    ossafe_file_text_write_real_ch1(myfileid, global.llv)
    ossafe_file_text_writeln_ch1(myfileid)
    ossafe_file_text_write_real_ch1(myfileid, global.lgold)
    ossafe_file_text_writeln_ch1(myfileid)
    ossafe_file_text_write_real_ch1(myfileid, global.lhp)
    ossafe_file_text_writeln_ch1(myfileid)
    ossafe_file_text_write_real_ch1(myfileid, global.lmaxhp)
    ossafe_file_text_writeln_ch1(myfileid)
    ossafe_file_text_write_real_ch1(myfileid, global.lat)
    ossafe_file_text_writeln_ch1(myfileid)
    ossafe_file_text_write_real_ch1(myfileid, global.ldf)
    ossafe_file_text_writeln_ch1(myfileid)
    ossafe_file_text_write_real_ch1(myfileid, global.lwstrength)
    ossafe_file_text_writeln_ch1(myfileid)
    ossafe_file_text_write_real_ch1(myfileid, global.ladef)
    ossafe_file_text_writeln_ch1(myfileid)
    if global.is_console
    {
        scr_ds_list_write_ch1(global.litem, 8)
        ossafe_file_text_writeln_ch1(myfileid)
        scr_ds_list_write_ch1(global.phone, 8)
        ossafe_file_text_writeln_ch1(myfileid)
        scr_ds_list_write_ch1(global.flag, 9999)
        ossafe_file_text_writeln_ch1(myfileid)
    }
    else
    {
        for (i = 0; i < 8; i += 1)
        {
            file_text_write_real(myfileid, global.litem[i])
            file_text_writeln(myfileid)
            file_text_write_real(myfileid, global.phone[i])
            file_text_writeln(myfileid)
        }
        for (i = 0; i < 9999; i += 1)
        {
            file_text_write_real(myfileid, global.flag[i])
            file_text_writeln(myfileid)
        }
    }
    ossafe_file_text_write_real_ch1(myfileid, global.plot)
    ossafe_file_text_writeln_ch1(myfileid)
    ossafe_file_text_write_real_ch1(myfileid, global.currentroom)
    ossafe_file_text_writeln_ch1(myfileid)
    ossafe_file_text_write_real_ch1(myfileid, global.time)
    ossafe_file_text_close_ch1(myfileid)
    return;
}

