function scr_getmsgno_d()
{
    if (instance_exists(obj_dialoguer) && instance_exists(obj_dialoguer.writer))
        return obj_dialoguer.writer.msgno;
}
