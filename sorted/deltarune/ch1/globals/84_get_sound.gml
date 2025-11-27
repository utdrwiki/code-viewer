function scr_84_get_sound(arg0)
{
    var sound_file_name = arg0;
    if (global.lang == "ja")
        sound_file_name += "_ja";
    return asset_get_index(sound_file_name);
}
