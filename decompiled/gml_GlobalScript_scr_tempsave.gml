scr_tempsave = function() //gml_Script_scr_tempsave
{
    filechoicebk2 = global.filechoice
    global.filechoice = 9
    var is_valid = scr_saveprocess(global.filechoice)
    global.filechoice = filechoicebk2
    if (!is_valid)
    {
        var error_message = instance_create(0, 0, obj_savedata_error)
        error_message.error_type = "temp_save_failed"
        if (room != PLACE_MENU)
            error_message.type = "auto"
    }
    return is_valid;
}

