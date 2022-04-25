scr_stickto_stop = function() //gml_Script_scr_stickto_stop
{
    if variable_instance_exists(id, "_stickto")
    {
        with (_stickto)
            instance_destroy()
    }
    return;
}

