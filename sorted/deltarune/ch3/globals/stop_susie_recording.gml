function scr_stop_susie_recording()
{
    with (obj_mainchara_board)
    {
        if (name == "susie")
        {
            susierecordstring = "";
            susierecordcon = 0;
            susierecordcount = 0;
        }
    }
}
