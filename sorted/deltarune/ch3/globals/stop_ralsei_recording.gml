function scr_stop_ralsei_recording()
{
    with (obj_mainchara_board)
    {
        if (name == "ralsei")
        {
            susierecordstring = "";
            susierecordcon = 0;
            susierecordcount = 0;
        }
    }
}
