scr_load_ch1 = function() //gml_Script_scr_load_ch1
{
    snd_free_all_ch1()
    filechoicebk = 0
    if variable_global_exists("filechoice")
        filechoicebk = global.filechoice
    scr_gamestart_ch1()
    global.filechoice = filechoicebk
    file = ("filech1_" + string(global.filechoice))
    myfileid = ossafe_file_text_open_read_ch1(file)
    if instance_exists(obj_loadscreen_ch1)
        obj_loadscreen_ch1.save_loaded = true
    global.truename = ossafe_file_text_read_string_ch1(myfileid)
    ossafe_file_text_readln_ch1(myfileid)
    show_debug_message(("*** loaded global.truename : " + string(global.truename)))
    if global.is_console
    {
        var othername_list = scr_ds_list_read_ch1(myfileid)
        for (i = 0; i < ds_list_size(othername_list); i += 1)
            global.othername[i] = ds_list_find_value(othername_list, i)
        ds_list_destroy(othername_list)
        ossafe_file_text_readln_ch1(myfileid)
    }
    else
    {
        for (i = 0; i < 6; i += 1)
        {
            global.othername[i] = file_text_read_string(myfileid)
            file_text_readln(myfileid)
        }
    }
    global.char[0] = ossafe_file_text_read_real_ch1(myfileid)
    ossafe_file_text_readln_ch1(myfileid)
    global.char[1] = ossafe_file_text_read_real_ch1(myfileid)
    ossafe_file_text_readln_ch1(myfileid)
    global.char[2] = ossafe_file_text_read_real_ch1(myfileid)
    ossafe_file_text_readln_ch1(myfileid)
    global.gold = ossafe_file_text_read_real_ch1(myfileid)
    ossafe_file_text_readln_ch1(myfileid)
    global.xp = ossafe_file_text_read_real_ch1(myfileid)
    ossafe_file_text_readln_ch1(myfileid)
    global.lv = ossafe_file_text_read_real_ch1(myfileid)
    ossafe_file_text_readln_ch1(myfileid)
    global.inv = ossafe_file_text_read_real_ch1(myfileid)
    ossafe_file_text_readln_ch1(myfileid)
    global.invc = ossafe_file_text_read_real_ch1(myfileid)
    ossafe_file_text_readln_ch1(myfileid)
    global.darkzone = ossafe_file_text_read_real_ch1(myfileid)
    ossafe_file_text_readln_ch1(myfileid)
    if global.is_console
    {
        var hp_list = scr_ds_list_read_ch1(myfileid)
        for (i = 0; i < ds_list_size(hp_list); i += 1)
            global.hp[i] = ds_list_find_value(hp_list, i)
        ds_list_destroy(hp_list)
        ossafe_file_text_readln_ch1(myfileid)
        var maxhp_list = scr_ds_list_read_ch1(myfileid)
        for (i = 0; i < ds_list_size(maxhp_list); i += 1)
            global.maxhp[i] = ds_list_find_value(maxhp_list, i)
        ds_list_destroy(maxhp_list)
        ossafe_file_text_readln_ch1(myfileid)
        var at_list = scr_ds_list_read_ch1(myfileid)
        for (i = 0; i < ds_list_size(at_list); i += 1)
            global.at[i] = ds_list_find_value(at_list, i)
        ds_list_destroy(at_list)
        ossafe_file_text_readln_ch1(myfileid)
        var df_list = scr_ds_list_read_ch1(myfileid)
        for (i = 0; i < ds_list_size(df_list); i += 1)
            global.df[i] = ds_list_find_value(df_list, i)
        ds_list_destroy(df_list)
        ossafe_file_text_readln_ch1(myfileid)
        var mag_list = scr_ds_list_read_ch1(myfileid)
        for (i = 0; i < ds_list_size(mag_list); i += 1)
            global.mag[i] = ds_list_find_value(mag_list, i)
        ds_list_destroy(mag_list)
        ossafe_file_text_readln_ch1(myfileid)
        var guts_list = scr_ds_list_read_ch1(myfileid)
        for (i = 0; i < ds_list_size(guts_list); i += 1)
            global.guts[i] = ds_list_find_value(guts_list, i)
        ds_list_destroy(guts_list)
        ossafe_file_text_readln_ch1(myfileid)
        var charweapon_list = scr_ds_list_read_ch1(myfileid)
        for (i = 0; i < ds_list_size(charweapon_list); i += 1)
            global.charweapon[i] = ds_list_find_value(charweapon_list, i)
        ds_list_destroy(charweapon_list)
        ossafe_file_text_readln_ch1(myfileid)
        var chararmor1_list = scr_ds_list_read_ch1(myfileid)
        for (i = 0; i < ds_list_size(chararmor1_list); i += 1)
            global.chararmor1[i] = ds_list_find_value(chararmor1_list, i)
        ds_list_destroy(chararmor1_list)
        ossafe_file_text_readln_ch1(myfileid)
        var chararmor2_list = scr_ds_list_read_ch1(myfileid)
        for (i = 0; i < ds_list_size(chararmor2_list); i += 1)
            global.chararmor2[i] = ds_list_find_value(chararmor2_list, i)
        ds_list_destroy(chararmor2_list)
        ossafe_file_text_readln_ch1(myfileid)
        var weaponstyle_list = scr_ds_list_read_ch1(myfileid)
        for (i = 0; i < ds_list_size(weaponstyle_list); i += 1)
            global.weaponstyle[i] = ds_list_find_value(weaponstyle_list, i)
        ds_list_destroy(weaponstyle_list)
        ossafe_file_text_readln_ch1(myfileid)
    }
    for (i = 0; i < 4; i += 1)
    {
        if (!global.is_console)
        {
            global.hp[i] = ossafe_file_text_read_real_ch1(myfileid)
            ossafe_file_text_readln_ch1(myfileid)
            global.maxhp[i] = ossafe_file_text_read_real_ch1(myfileid)
            ossafe_file_text_readln_ch1(myfileid)
            global.at[i] = ossafe_file_text_read_real_ch1(myfileid)
            ossafe_file_text_readln_ch1(myfileid)
            global.df[i] = ossafe_file_text_read_real_ch1(myfileid)
            ossafe_file_text_readln_ch1(myfileid)
            global.mag[i] = ossafe_file_text_read_real_ch1(myfileid)
            ossafe_file_text_readln_ch1(myfileid)
            global.guts[i] = ossafe_file_text_read_real_ch1(myfileid)
            ossafe_file_text_readln_ch1(myfileid)
            global.charweapon[i] = ossafe_file_text_read_real_ch1(myfileid)
            ossafe_file_text_readln_ch1(myfileid)
            global.chararmor1[i] = ossafe_file_text_read_real_ch1(myfileid)
            ossafe_file_text_readln_ch1(myfileid)
            global.chararmor2[i] = ossafe_file_text_read_real_ch1(myfileid)
            ossafe_file_text_readln_ch1(myfileid)
            global.weaponstyle[i] = ossafe_file_text_read_string_ch1(myfileid)
            ossafe_file_text_readln_ch1(myfileid)
        }
        for (q = 0; q < 4; q += 1)
        {
            global.itemat[i][q] = ossafe_file_text_read_real_ch1(myfileid)
            ossafe_file_text_readln_ch1(myfileid)
            global.itemdf[i][q] = ossafe_file_text_read_real_ch1(myfileid)
            ossafe_file_text_readln_ch1(myfileid)
            global.itemmag[i][q] = ossafe_file_text_read_real_ch1(myfileid)
            ossafe_file_text_readln_ch1(myfileid)
            global.itembolts[i][q] = ossafe_file_text_read_real_ch1(myfileid)
            ossafe_file_text_readln_ch1(myfileid)
            global.itemgrazeamt[i][q] = ossafe_file_text_read_real_ch1(myfileid)
            ossafe_file_text_readln_ch1(myfileid)
            global.itemgrazesize[i][q] = ossafe_file_text_read_real_ch1(myfileid)
            ossafe_file_text_readln_ch1(myfileid)
            global.itemboltspeed[i][q] = ossafe_file_text_read_real_ch1(myfileid)
            ossafe_file_text_readln_ch1(myfileid)
            global.itemspecial[i][q] = ossafe_file_text_read_real_ch1(myfileid)
            ossafe_file_text_readln_ch1(myfileid)
        }
        for (j = 0; j < 12; j += 1)
        {
            global.spell[i][j] = ossafe_file_text_read_real_ch1(myfileid)
            ossafe_file_text_readln_ch1(myfileid)
        }
    }
    global.boltspeed = ossafe_file_text_read_real_ch1(myfileid)
    ossafe_file_text_readln_ch1(myfileid)
    global.grazeamt = ossafe_file_text_read_real_ch1(myfileid)
    ossafe_file_text_readln_ch1(myfileid)
    global.grazesize = ossafe_file_text_read_real_ch1(myfileid)
    ossafe_file_text_readln_ch1(myfileid)
    if global.is_console
    {
        var item_list = scr_ds_list_read_ch1(myfileid)
        for (i = 0; i < ds_list_size(item_list); i += 1)
            global.item[i] = ds_list_find_value(item_list, i)
        ds_list_destroy(item_list)
        ossafe_file_text_readln_ch1(myfileid)
        var keyitem_list = scr_ds_list_read_ch1(myfileid)
        for (i = 0; i < ds_list_size(keyitem_list); i += 1)
            global.keyitem[i] = ds_list_find_value(keyitem_list, i)
        ds_list_destroy(keyitem_list)
        ossafe_file_text_readln_ch1(myfileid)
        var weapon_list = scr_ds_list_read_ch1(myfileid)
        for (i = 0; i < ds_list_size(weapon_list); i += 1)
            global.weapon[i] = ds_list_find_value(weapon_list, i)
        ds_list_destroy(weapon_list)
        ossafe_file_text_readln_ch1(myfileid)
        var armor_list = scr_ds_list_read_ch1(myfileid)
        for (i = 0; i < ds_list_size(armor_list); i += 1)
            global.armor[i] = ds_list_find_value(armor_list, i)
        ds_list_destroy(armor_list)
        ossafe_file_text_readln_ch1(myfileid)
    }
    else
    {
        for (j = 0; j < 13; j += 1)
        {
            global.item[j] = file_text_read_real(myfileid)
            file_text_readln(myfileid)
            global.keyitem[j] = file_text_read_real(myfileid)
            file_text_readln(myfileid)
            global.weapon[j] = file_text_read_real(myfileid)
            file_text_readln(myfileid)
            global.armor[j] = file_text_read_real(myfileid)
            file_text_readln(myfileid)
        }
    }
    global.tension = ossafe_file_text_read_real_ch1(myfileid)
    ossafe_file_text_readln_ch1(myfileid)
    global.maxtension = ossafe_file_text_read_real_ch1(myfileid)
    ossafe_file_text_readln_ch1(myfileid)
    global.lweapon = ossafe_file_text_read_real_ch1(myfileid)
    ossafe_file_text_readln_ch1(myfileid)
    global.larmor = ossafe_file_text_read_real_ch1(myfileid)
    ossafe_file_text_readln_ch1(myfileid)
    global.lxp = ossafe_file_text_read_real_ch1(myfileid)
    ossafe_file_text_readln_ch1(myfileid)
    global.llv = ossafe_file_text_read_real_ch1(myfileid)
    ossafe_file_text_readln_ch1(myfileid)
    global.lgold = ossafe_file_text_read_real_ch1(myfileid)
    ossafe_file_text_readln_ch1(myfileid)
    global.lhp = ossafe_file_text_read_real_ch1(myfileid)
    ossafe_file_text_readln_ch1(myfileid)
    global.lmaxhp = ossafe_file_text_read_real_ch1(myfileid)
    ossafe_file_text_readln_ch1(myfileid)
    global.lat = ossafe_file_text_read_real_ch1(myfileid)
    ossafe_file_text_readln_ch1(myfileid)
    global.ldf = ossafe_file_text_read_real_ch1(myfileid)
    ossafe_file_text_readln_ch1(myfileid)
    global.lwstrength = ossafe_file_text_read_real_ch1(myfileid)
    ossafe_file_text_readln_ch1(myfileid)
    global.ladef = ossafe_file_text_read_real_ch1(myfileid)
    ossafe_file_text_readln_ch1(myfileid)
    if global.is_console
    {
        var litem_list = scr_ds_list_read_ch1(myfileid)
        for (i = 0; i < (ds_list_size(litem_list) - 1); i += 1)
            global.litem[i] = ds_list_find_value(litem_list, i)
        ds_list_destroy(litem_list)
        ossafe_file_text_readln_ch1(myfileid)
        var phone_list = scr_ds_list_read_ch1(myfileid)
        for (i = 0; i < (ds_list_size(phone_list) - 1); i += 1)
            global.phone[i] = ds_list_find_value(phone_list, i)
        ds_list_destroy(phone_list)
        ossafe_file_text_readln_ch1(myfileid)
        var flag_list = scr_ds_list_read_ch1(myfileid)
        for (i = 0; i < (ds_list_size(flag_list) - 1); i += 1)
            global.flag[i] = ds_list_find_value(flag_list, i)
        ds_list_destroy(flag_list)
        ossafe_file_text_readln_ch1(myfileid)
    }
    else
    {
        for (i = 0; i < 8; i += 1)
        {
            global.litem[i] = ossafe_file_text_read_real_ch1(myfileid)
            ossafe_file_text_readln_ch1(myfileid)
            global.phone[i] = ossafe_file_text_read_real_ch1(myfileid)
            ossafe_file_text_readln_ch1(myfileid)
        }
        for (i = 0; i < 9999; i += 1)
        {
            global.flag[i] = ossafe_file_text_read_real_ch1(myfileid)
            ossafe_file_text_readln_ch1(myfileid)
        }
    }
    global.plot = ossafe_file_text_read_real_ch1(myfileid)
    ossafe_file_text_readln_ch1(myfileid)
    global.currentroom = ossafe_file_text_read_real_ch1(myfileid)
    ossafe_file_text_readln_ch1(myfileid)
    global.time = ossafe_file_text_read_real_ch1(myfileid)
    ossafe_file_text_readln_ch1(myfileid)
    ossafe_file_text_close_ch1(myfileid)
    global.lastsavedtime = global.time
    global.lastsavedlv = global.lv
    audio_group_set_gain(1, global.flag[15], 0)
    audio_set_master_gain(0, global.flag[17])
    if (global.plot >= 156)
    {
        for (i = 0; i < 4; i += 1)
            global.charauto[i] = false
    }
    if (global.flag[279] == 0)
    {
        global.flag[279] = 1
        var room_index = global.currentroom
        var room_offset = room_index
        show_debug_message(("trying to load : " + string(room_get_name(room_index))))
        if (room_index < ROOM_INITIALIZE_ch1)
        {
            room_offset = (ROOM_INITIALIZE_ch1 + room_index)
            show_debug_message(("offset added : " + string(room_get_name(room_offset))))
        }
        global.currentroom = room_offset
    }
    __loadedroom = global.currentroom
    if scr_dogcheck_ch1()
        __loadedroom = PLACE_DOG_ch1
    room_goto(__loadedroom)
    global.currentroom = __loadedroom
    scr_tempsave_ch1()
    return;
}

