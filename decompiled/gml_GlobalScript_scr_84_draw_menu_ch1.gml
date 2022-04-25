scr_84_draw_menu_ch1 = function(argument0, argument1, argument2, argument3, argument4, argument5, argument6) //gml_Script_scr_84_draw_menu_ch1
{
    var array = argument0
    var xx = argument1
    var yy = argument2
    var vspacing = argument3
    var selection_indices = argument4
    var func_depth = argument5
    var menu_depth = argument6
    var length = ds_list_size(array)
    for (var i = 0; i < length; i += 3)
    {
        var ndx = (i / 3)
        var type = ds_list_find_value(array, i)
        var item = ds_list_find_value(array, (i + 1))
        var name = ds_list_find_value(array, (i + 2))
        var selected = false
        var prefix = "  "
        if (ndx == selection_indices[func_depth])
            selected = true
        if selected
        {
            prefix = "> "
            if (func_depth > global.chemg_max_depth)
            {
                global.chemg_max_depth = func_depth
                global.chemg_cursor_y = yy
            }
        }
        if (type == "[group]")
            name = (("[ " + name) + "... ]")
        scr_84_draw_text_outline_ch1(xx, yy, (prefix + name))
        yy += vspacing
        if (func_depth < menu_depth && ndx == selection_indices[func_depth])
            yy = scr_84_draw_menu_ch1(item, (xx + 20), yy, vspacing, selection_indices, (func_depth + 1), menu_depth)
    }
    return yy;
}

