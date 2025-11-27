function scr_couchclear(arg0)
{
    with (obj_couchwriter)
    {
        if (speaker == arg0)
            instance_destroy();
    }
}

function scr_couchtalk(arg0, arg1)
{
    var ix = -1;
    var iy = -1;
    if (argument_count >= 6)
    {
        ix = argument4;
        iy = argument5;
    }
    var couchtext = instance_create_depth(ix, iy, 5000, obj_couchwriter);
    couchtext.mystring = arg0;
    couchtext.speaker = arg1;
    if (argument_count >= 3)
        couchtext.cleartext = argument2;
    if (argument_count >= 4)
        couchtext.drawtime = argument3;
    if (argument_count >= 7)
        couchtext.customsnd = argument6;
    if (argument_count >= 8)
        couchtext.customcolor = argument7;
    if (argument_count >= 9)
        couchtext.talkrate = argument8;
    if (argument_count >= 10)
        couchtext.talklength = argument9;
    return couchtext;
}
