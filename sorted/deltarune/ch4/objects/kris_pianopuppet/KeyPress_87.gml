if (lpianorecordcon == 0)
{
    lpianorecordcon = 1;
    lpianorecordsave = true;
}
else if (lpianorecordcon == 1)
{
    lpianorecordcon = 2;
    lpianorecordcount = 0;
}
else if (lpianorecordcon == 2)
{
    if (lpianorecordsave == true && show_question("Save gameplay recording?"))
    {
        var _string_save = get_string("Input file name:", "default");
        ini_open("pianoplayback.ini");
        ini_write_string("Left Piano Playback Info", _string_save, lpianorecordstring);
        ini_close();
    }
    else
    {
    }
    lpianorecordcon = 0;
    lpianorecordcount = 0;
    lpianorecordstring = "";
}
if (rpianorecordcon == 0)
{
    rpianorecordcon = 1;
    rpianorecordsave = true;
}
else if (rpianorecordcon == 1)
{
    rpianorecordcon = 2;
    rpianorecordcount = 0;
}
else if (rpianorecordcon == 2)
{
    if (rpianorecordsave == true && show_question("Save gameplay recording?"))
    {
        var _string_save = get_string("Input file name:", "default");
        ini_open("pianoplayback.ini");
        ini_write_string("right Piano Playback Info", _string_save, rpianorecordstring);
        ini_close();
    }
    else
    {
    }
    rpianorecordcon = 0;
    rpianorecordcount = 0;
    rpianorecordstring = "";
}
