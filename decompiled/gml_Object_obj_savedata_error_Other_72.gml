if (ds_map_find_value(async_load, "id") == global.savedata_async_id)
{
    global.savedata_async_id = -1
    if (os_type == os_switch)
        switch_save_data_commit()
    buffer_delete(global.savedata_buffer)
    global.savedata_buffer = undefined
    game_restart_true()
}
