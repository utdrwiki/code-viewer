scr_keyitemremove = function(argument0) //gml_Script_scr_keyitemremove
{
    removed = false
    scr_keyitemcheck(argument0)
    if (haveit == true)
    {
        loc = 0
        skip = false
        if (global.keyitem[0] == argument0 && skip == false)
        {
            loc = 0
            skip = true
        }
        if (global.keyitem[1] == argument0 && skip == false)
        {
            loc = 1
            skip = true
        }
        if (global.keyitem[2] == argument0 && skip == false)
        {
            loc = 2
            skip = true
        }
        if (global.keyitem[3] == argument0 && skip == false)
        {
            loc = 3
            skip = true
        }
        if (global.keyitem[4] == argument0 && skip == false)
        {
            loc = 4
            skip = true
        }
        if (global.keyitem[5] == argument0 && skip == false)
        {
            loc = 5
            skip = true
        }
        if (global.keyitem[6] == argument0 && skip == false)
        {
            loc = 6
            skip = true
        }
        if (global.keyitem[7] == argument0 && skip == false)
        {
            loc = 7
            skip = true
        }
        if (global.keyitem[8] == argument0 && skip == false)
        {
            loc = 8
            skip = true
        }
        if (global.keyitem[9] == argument0 && skip == false)
        {
            loc = 9
            skip = true
        }
        if (global.keyitem[10] == argument0 && skip == false)
        {
            loc = 10
            skip = true
        }
        if (global.keyitem[11] == argument0 && skip == false)
        {
            loc = 11
            skip = true
        }
        scr_keyitemshift(loc, 0)
        removed = true
    }
    return;
}

