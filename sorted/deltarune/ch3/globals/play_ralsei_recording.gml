function scr_play_ralsei_recording(arg0)
{
    with (obj_mainchara_board)
    {
        if (name == "ralsei")
        {
            susierecordcon = 2;
            susierecordcount = 0;
            susierecordstring = arg0;
            susierecordsave = false;
        }
    }
}
