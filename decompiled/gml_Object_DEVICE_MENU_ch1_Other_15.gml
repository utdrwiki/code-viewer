iniwrite = ossafe_ini_open_ch1("dr.ini")
_NEWNAME = ini_read_string(("G" + string(MENUCOORD[2])), "Name", "------")
_NEWTIME = ini_read_real(("G" + string(MENUCOORD[2])), "Time", 0)
var room_index = ini_read_real(("G" + string(MENUCOORD[2])), "Room", 0)
var room_offset = room_index
if (room_index < ROOM_INITIALIZE_ch1)
    room_offset = (ROOM_INITIALIZE_ch1 + room_index)
_NEWROOM = room_offset
_NEWLEVEL = ini_read_real(("G" + string(MENUCOORD[2])), "Level", 0)
_NEWINITLANG = ini_read_real(("G" + string(MENUCOORD[2])), "InitLang", 0)
ini_write_string(("G" + string(MENUCOORD[3])), "Name", _NEWNAME)
ini_write_real(("G" + string(MENUCOORD[3])), "Time", _NEWTIME)
ini_write_real(("G" + string(MENUCOORD[3])), "Room", _NEWROOM)
ini_write_real(("G" + string(MENUCOORD[3])), "Level", _NEWLEVEL)
ini_write_real(("G" + string(MENUCOORD[3])), "InitLang", _NEWINITLANG)
ossafe_ini_close_ch1()
FILE[MENUCOORD[3]] = 1
PLACE[MENUCOORD[3]] = PLACE[MENUCOORD[2]]
TIME[MENUCOORD[3]] = TIME[MENUCOORD[2]]
NAME[MENUCOORD[3]] = NAME[MENUCOORD[2]]
LEVEL[MENUCOORD[3]] = LEVEL[MENUCOORD[2]]
INITLANG[MENUCOORD[3]] = INITLANG[MENUCOORD[2]]
TIME_STRING[MENUCOORD[3]] = TIME_STRING[MENUCOORD[2]]
if (!global.is_console)
{
    file_copy(("filech1_" + string(MENUCOORD[2])), ("filech1_" + string(MENUCOORD[3])))
    if file_exists((("config_" + string(MENUCOORD[2])) + ".ini"))
        file_copy((("config_" + string(MENUCOORD[2])) + ".ini"), (("config_" + string(MENUCOORD[3])) + ".ini"))
}
else
{
    var file_to_copy = ds_map_find_value(global.savedata, ("filech1_" + string(MENUCOORD[2])))
    var new_filename = ("filech1_" + string(MENUCOORD[3]))
    var new_file = ossafe_file_text_open_write_ch1(new_filename)
    ds_map_set(new_file, "data", file_to_copy)
    ossafe_file_text_close_ch1(new_file)
    ossafe_savedata_save_ch1()
    if ossafe_file_exists_ch1((("config_" + string(MENUCOORD[2])) + ".ini"))
    {
        ossafe_ini_open_ch1((("config_" + string(MENUCOORD[2])) + ".ini"))
        var copy_border = ini_read_string("BORDER", "TYPE", global.screen_border_id)
        var copy_controls_list = []
        var shoulder_reassign = obj_gamecontroller.gamepad_shoulderlb_reassign
        for (var i = 0; i < 10; i += 1)
            copy_controls_list[i] = ini_read_real("GAMEPAD_CONTROLS", string(i), global.input_g[i])
        shoulder_reassign = ini_read_real("SHOULDERLB_REASSIGN", "SHOULDERLB_REASSIGN", obj_gamecontroller.gamepad_shoulderlb_reassign)
        ossafe_ini_close_ch1()
        ossafe_ini_open_ch1((("config_" + string(MENUCOORD[3])) + ".ini"))
        ini_write_string("BORDER", "TYPE", copy_border)
        for (i = 0; i < 10; i += 1)
            ini_write_real("GAMEPAD_CONTROLS", string(i), copy_controls_list[i])
        ini_read_real("SHOULDERLB_REASSIGN", "SHOULDERLB_REASSIGN", shoulder_reassign)
        ossafe_ini_close_ch1()
    }
}
