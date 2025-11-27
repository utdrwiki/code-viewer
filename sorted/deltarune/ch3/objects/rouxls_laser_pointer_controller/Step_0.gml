if (global.turntimer < 1)
    instance_destroy();
if (con == 1)
{
    recordstring += ("x" + string(mouse_x) + "y" + string(mouse_y) + "o");
    recordcount++;
}
if (con == 2)
{
    if (recordcount < string_length(recordstring))
    {
        var setx = false;
        var sety = false;
        var _x = "0";
        var _y = "0";
        var _end = 0;
        while (_end == 0)
        {
            var _input = string_char_at(recordstring, recordcount);
            recordcount++;
            if (_input == "x")
            {
                setx = true;
            }
            else if (_input == "y")
            {
                setx = false;
                sety = true;
            }
            else if (_input == "o")
            {
                _end = 1;
            }
            else
            {
                if (setx == true)
                    _x += _input;
                if (sety == true)
                    _y += _input;
            }
            if (recordcount >= string_length(recordstring))
                _end = 1;
            _mouse_x = real(_x) + camerax();
            _mouse_y = real(_y) + cameray();
        }
    }
    else
    {
        if (recordsave == true && show_question("Do you want to save the recording?"))
        {
            _string_save = get_string("Input string file name:", "default");
            ini_open("laserpointerplayback.ini");
            ini_write_string("Laser Pointer Playback Info", _string_save, recordstring);
            ini_close();
            recordsave = false;
        }
        else
        {
        }
        recordstring = "";
        recordcount = 0;
        con = 0;
    }
}
