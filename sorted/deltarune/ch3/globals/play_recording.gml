function scr_play_recording(arg0, arg1)
{
    with (obj_mainchara_board)
    {
        if (name == arg0)
        {
            susierecordcon = 2;
            susierecordcount = 0;
            susierecordstring = arg1;
            susierecordsave = false;
        }
    }
}
