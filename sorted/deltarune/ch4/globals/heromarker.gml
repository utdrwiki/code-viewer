function scr_heromarker(arg0 = "", arg1 = "")
{
    var ____foundmarker = -4;
    var xpos = -1;
    var ypos = -1;
    var objindextocheck = 1365;
    if (string_pos("kr", arg0) != 0)
        objindextocheck = 544;
    if (string_pos("su", arg0) != 0)
        objindextocheck = 522;
    if (string_pos("ra", arg0) != 0)
        objindextocheck = 75;
    if (string_pos("no", arg0) != 0)
        objindextocheck = 933;
    if (string_pos("gen", arg0) != 0)
        objindextocheck = 1365;
    with (objindextocheck)
    {
        if (variable_instance_exists(id, "extflag"))
        {
            if (extflag == arg1)
                ____foundmarker = id;
        }
    }
    if (instance_exists(____foundmarker))
    {
        xpos = ____foundmarker.x;
        ypos = ____foundmarker.y;
    }
    if (____foundmarker == -4)
    {
        debug_message("scr_heromarker(" + arg0 + "," + arg1 + ") Object Not Found");
        return [-4, -4, -4];
    }
    return [xpos, ypos, ____foundmarker];
}

function scr_genmarker(arg0 = "")
{
    var marker = -4;
    with (obj_genmarker)
    {
        if (extflag == arg0)
            marker = id;
    }
    return marker;
}
