if (ds_map_find_value(async_load, "id") == global.savedata_async_id)
{
    global.savedata_async_id = -1
    if global.savedata_async_load
    {
        global.savedata_async_load = 0
        if (ds_map_find_value(async_load, "status") == 0)
        {
            if (!old_savedata_check)
            {
                old_savedata_check = 1
                ossafe_savedata_load_old_check()
                return;
            }
            else
            {
                global.savedata_error = 1
                global.savedata_debuginfo = ("load failed: " + string(ds_map_find_value(async_load, "status")))
                global.savedata = ds_map_create()
            }
        }
        else
        {
            global.savedata_error = 0
            global.savedata_debuginfo = "load succeeded"
            var json = buffer_read(global.savedata_buffer, buffer_string)
            global.savedata = json_decode(json)
        }
        buffer_delete(global.savedata_buffer)
        global.savedata_buffer = undefined
        scr_84_init_localization_ch1()
        scr_84_load_ini_ch1()
        scr_gamestart_ch1()
        global.damagefont = font_add_sprite_ext(spr_numbersfontbig_ch1, "0123456789", 20, 0)
        global.hpfont = font_add_sprite_ext(spr_numbersfontsmall_ch1, scr_84_get_lang_string_ch1("obj_initializer2_slash_Create_0_gml_2_0"), 0, 2)
        for (i = 0; i < 100; i += 1)
            global.tempflag[i] = 0
        global.heartx = 300
        global.hearty = 220
        audio_group_load(1)
        if (!instance_exists(obj_time_ch1))
            instance_create_ch1(0, 0, obj_time_ch1)
    }
}
