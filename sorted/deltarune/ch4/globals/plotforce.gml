function scr_plotforce(arg0)
{
    if (scr_debug())
    {
        if (global.plot < arg0)
        {
            var curplot = global.plot;
            global.plot = arg0;
            debug_print("Force Plot Update, see debug");
            debug_message("=============================");
            debug_message("Force Plot Update from " + string(curplot) + " to " + string(arg0));
            debug_message("scr_plotforce(" + string(arg0) + ") was called by " + object_get_name(object_index));
            debug_message("=============================");
        }
    }
}
