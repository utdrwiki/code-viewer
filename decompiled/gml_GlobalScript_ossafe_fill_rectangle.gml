ossafe_fill_rectangle = function(argument0, argument1, argument2, argument3) //gml_Script_ossafe_fill_rectangle
{
    var x1 = argument0
    var y1 = argument1
    var x2 = argument2
    var y2 = argument3
    if (x1 > x2)
    {
        var temp = x1
        x1 = x2
        x2 = temp
    }
    if (y1 > y2)
    {
        temp = y1
        y1 = y2
        y2 = temp
    }
    if (os_type == os_ps4 || os_type == os_psvita)
    {
        x2++
        y2++
    }
    draw_rectangle(x1, y1, x2, y2, false)
    return;
}

