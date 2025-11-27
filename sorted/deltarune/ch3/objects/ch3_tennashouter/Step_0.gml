if (init == 0)
{
    var spacelocation = 0;
    var linelength = 0;
    var stringlength = string_length(mystring);
    var savestring = mystring;
    var autowrapchar = 27;
    var failsafe = 0;
    for (var i = 1; i < stringlength; i++)
    {
        var thischar = string_char_at(savestring, i);
        if (thischar == " ")
            spacelocation = i;
        linelength++;
        if (linelength >= autowrapchar && spacelocation >= 1)
        {
            mystring = string_insert("\n", mystring, spacelocation);
            myboxsize++;
            mystring = string_delete(mystring, spacelocation + 1, 1);
            linelength = 0;
            i = spacelocation;
            spacelocation = -1;
            failsafe++;
            if (failsafe >= 50)
                break;
        }
    }
    if (customlife != -1)
        boxlife = customlife;
    scr_speaker("noone");
    global.typer = 80;
    msgset(0, mystring);
    d = d_make();
    d.boxheight = myboxsize;
    d.side = side;
    d.skippable = 1;
    d.zurasu = 0;
    init = 1;
}
timer++;
if (timer >= boxlife)
    instance_destroy();
