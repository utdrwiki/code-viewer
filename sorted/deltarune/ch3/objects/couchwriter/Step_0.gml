if (reformat == true)
{
    init = 0;
    reformat = false;
}
if (init == 0)
{
    if (i_ex(obj_quizsequence))
        quiz = true;
    autowrap = true;
    for (var i = 0; i < string_width(mystring); i++)
    {
        if (string_char_at(mystring, i) == "#")
            autowrap = false;
    }
    if (global.lang == "ja")
        autowrap = false;
    if (autowrap == true)
    {
        var spacelocation = 0;
        var linelength = 0;
        var stringlength = string_length(mystring);
        var savestring = mystring;
        var autowrapchar = 22;
        var failsafe = 0;
        for (var i = 1; i < stringlength; i++)
        {
            var thischar = string_char_at(savestring, i);
            if (thischar == " ")
                spacelocation = i;
            linelength++;
            if (linelength >= autowrapchar && spacelocation >= 1)
            {
                mystring = string_insert("#", mystring, spacelocation);
                mystring = string_delete(mystring, spacelocation + 1, 1);
                linelength = 0;
                i = spacelocation;
                spacelocation = -1;
                failsafe++;
                if (failsafe >= 50 && scr_debug())
                    break;
            }
        }
        autowrap = false;
    }
    if (forceAutowrap == true)
        autowrap = true;
    if (speaker == "none" || speaker == "")
    {
        mysnd = 0;
        mycolor = c_white;
    }
    if (speaker == "ralsei" || speaker == "Ralsei" || speaker == "ra" || speaker == "r")
    {
        mycolor = hexcolor(#6FD213);
        mysnd = 131;
    }
    if (speaker == "susie" || speaker == "Susie" || speaker == "su" || speaker == "s")
    {
        mycolor = hexcolor(#740C83);
        mysnd = 128;
    }
    if (speaker == "tenna" || speaker == "Tenna" || speaker == "te" || speaker == "t")
    {
        mycolor = c_yellow;
        mysnd = 139;
        specialtalk = 1;
        if (talklength == 6)
            talklength = 12;
    }
    if (speaker == "lancer" || speaker == "Lancer" || speaker == "la" || speaker == "l")
    {
        mycolor = #5585BD;
        mysnd = 134;
    }
    readstring = string_hash_to_newline_ex(mystring);
    if (drawtime == -1)
        drawtime = string_length(mystring) * 4;
    if (cleartext == 1)
    {
        with (object_index)
        {
            if (id != other.id)
                instance_destroy();
        }
    }
    if (cleartext == 2)
    {
        with (object_index)
        {
            if (id != other.id)
            {
                if (speaker == other.speaker)
                    instance_destroy();
            }
        }
    }
    myfnt = 5;
    if (global.lang == "ja")
        myfnt = 11;
    if (customcolor != -1)
        mycolor = customcolor;
    if (customsnd != -1)
        mysnd = customsnd;
    if (customfont != -1)
        myfnt = customfnt;
    init = 1;
    if (depth == -1)
    {
        depth = 5000;
        var count = instance_number(object_index);
        if (count > 1)
        {
            depth = 5000 - count;
            with (object_index)
            {
                if (id != other.id)
                {
                    if (other.depth >= depth)
                        other.depth = depth - 2;
                }
            }
        }
    }
    if (mode == 3)
        init = 0;
    if (mode == 3 && !d_ex())
    {
        darktext = "* " + mystring + "/%";
        scr_speaker(speaker);
        msgset(0, darktext);
        d = d_make();
        d.side = 1;
        global.interact = 1;
        modecon = 1;
        init = 1;
    }
}
if (modecon == 1)
{
    if (!d_ex())
    {
        global.interact = 0;
        instance_destroy();
    }
}
