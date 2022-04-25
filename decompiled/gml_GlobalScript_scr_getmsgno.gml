scr_getmsgno = function() //gml_Script_scr_getmsgno
{
    if instance_exists(obj_writer)
        return obj_writer.msgno;
    return;
}

