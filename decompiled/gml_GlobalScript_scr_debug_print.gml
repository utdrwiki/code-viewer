scr_debug_print = function(argument0) //gml_Script_scr_debug_print
{
    if (!scr_debug())
        return;
    if (!instance_exists(obj_debug_gui))
    {
        instance_create((__view_get((0 << 0), 0) + 10), (__view_get((1 << 0), 0) + 10), obj_debug_gui)
        obj_debug_gui.depth = -9999
    }
    obj_debug_gui.newtext = argument0
    with (obj_debug_gui)
    {
        message[messagecount] = newtext
        newtext = ""
        timer[messagecount] = (90 - totaltimer)
        totaltimer += timer[messagecount]
        messagecount++
        debugmessage = message[0]
        for (i = 1; i < messagecount; i++)
            debugmessage += ("#" + message[i])
    }
    return;
}

