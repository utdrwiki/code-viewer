function scr_play_susie_recording(arg0)
{
    with (obj_mainchara_board)
    {
        if (name == "susie")
        {
            susierecordcon = 2;
            susierecordcount = 0;
            susierecordstring = arg0;
            susierecordsave = false;
        }
    }
}
