function scr_play_ralsei_recording_load(arg0)
{
    with (obj_mainchara_board)
    {
        if (name == "ralsei")
        {
            susierecordcon = 2;
            susierecordcount = 0;
            ini_open("susieplayback.ini");
            susierecordstring = ini_read_string("Susie Playback Info", arg0, "0");
            ini_close();
            susierecordsave = false;
        }
    }
}
