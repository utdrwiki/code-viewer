audio_stop_all()
global.lang_loaded = ""
switch chaptertoload_temp
{
    case 1:
        room_goto(ROOM_INITIALIZE_ch1)
        break
    case 2:
        room_goto(ROOM_INITIALIZE)
        break
}

