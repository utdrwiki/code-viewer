scr_itemremove = function(argument0) //gml_Script_scr_itemremove
{
    removed = false
    scr_itemcheck(argument0)
    if (haveit == true)
    {
        loc = 0
        skip = false
        if (global.item[0] == argument0 && skip == false)
        {
            loc = 0
            skip = true
        }
        if (global.item[1] == argument0 && skip == false)
        {
            loc = 1
            skip = true
        }
        if (global.item[2] == argument0 && skip == false)
        {
            loc = 2
            skip = true
        }
        if (global.item[3] == argument0 && skip == false)
        {
            loc = 3
            skip = true
        }
        if (global.item[4] == argument0 && skip == false)
        {
            loc = 4
            skip = true
        }
        if (global.item[5] == argument0 && skip == false)
        {
            loc = 5
            skip = true
        }
        if (global.item[6] == argument0 && skip == false)
        {
            loc = 6
            skip = true
        }
        if (global.item[7] == argument0 && skip == false)
        {
            loc = 7
            skip = true
        }
        if (global.item[8] == argument0 && skip == false)
        {
            loc = 8
            skip = true
        }
        if (global.item[9] == argument0 && skip == false)
        {
            loc = 9
            skip = true
        }
        if (global.item[10] == argument0 && skip == false)
        {
            loc = 10
            skip = true
        }
        if (global.item[11] == argument0 && skip == false)
        {
            loc = 11
            skip = true
        }
        scr_itemshift(loc, 0)
        removed = true
    }
    return;
}

