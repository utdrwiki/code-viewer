scr_nextmsg = function() //gml_Script_scr_nextmsg
{
    msgno += 1
    lineno = 0
    aster = false
    halt = false
    pos = 1
    alarm[0] = 1
    drawaster = true
    autoaster = true
    miniface_pos = 0
    miniface_current_pos = -1
    mystring = nstring[msgno]
    formatted = false
    wxskip = 0
    sound_played = false
    forcebutton1 = false
    if (rate < 3)
    {
        firstnoise = false
        alarm[2] = 1
    }
    return;
}

