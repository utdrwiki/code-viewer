scr_nextmsg_ch1 = function() //gml_Script_scr_nextmsg_ch1
{
    msgno += 1
    lineno = 0
    aster = false
    halt = false
    pos = 1
    alarm[0] = 1
    autoaster = true
    mystring = nstring[msgno]
    formatted = false
    wxskip = 0
    sound_played = false
    if (rate < 3)
    {
        firstnoise = false
        alarm[2] = 1
    }
    return;
}

