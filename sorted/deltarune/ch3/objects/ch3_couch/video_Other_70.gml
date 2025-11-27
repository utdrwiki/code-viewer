var _type = ds_map_find_value(async_load, "type");
if (_type == "video_end")
{
    video_close();
    scr_set_vhs_ini_value(0);
    room_goto(room_dw_tv_cutscene1g);
}
