if (scr_debug())
{
    if (keyboard_check(vk_control))
    {
        if ((name == "susie" && controlled == 1) || (name == "kris" && controlled == 1))
        {
            if (susierecordcon == 0)
            {
                var _kris = 0;
                with (obj_mainchara_board)
                {
                    if (name == "kris")
                        _kris = id;
                }
                recordsavex = x;
                recordsavey = y;
                susierecordcon = 1;
                susierecordsave = true;
            }
            else if (susierecordcon == 1)
            {
                susierecordcon = 2;
                susierecordcount = 0;
                x = recordsavex;
                y = recordsavey;
            }
            else if (susierecordcon == 2)
            {
                if (susierecordsave == true && show_question("Save gameplay recording?"))
                {
                    _string_save = get_string("Input file name:", "default");
                    ini_open("susieplayback.ini");
                    ini_write_string("Susie Playback Info", _string_save, susierecordstring);
                    ini_close();
                }
                else
                {
                }
                susierecordcon = 0;
                susierecordcount = 0;
                susierecordstring = "";
            }
        }
        if (name == "ralsei" && controlled == 1)
        {
            if (susierecordcon == 0)
            {
                var _kris = 0;
                with (obj_mainchara_board)
                {
                    if (name == "kris")
                        _kris = id;
                }
                _kris.x = x;
                _kris.y = y;
                recordsavex = x;
                recordsavey = y;
                susierecordcon = 1;
                susierecordsave = true;
            }
            else if (susierecordcon == 1)
            {
                susierecordcon = 2;
                susierecordcount = 0;
                x = recordsavex;
                y = recordsavey;
            }
            else if (susierecordcon == 2)
            {
                if (susierecordsave == true && show_question("Save gameplay recording?"))
                {
                    _string_save = get_string("Input file name:", "default");
                    ini_open("susieplayback.ini");
                    ini_write_string("Susie Playback Info", _string_save, susierecordstring);
                    ini_close();
                }
                else
                {
                }
                susierecordcon = 0;
                susierecordcount = 0;
                susierecordstring = "";
            }
        }
    }
}
