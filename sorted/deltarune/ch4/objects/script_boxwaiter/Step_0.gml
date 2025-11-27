if (i_ex(obj_dialoguer))
{
    if (i_ex(obj_dialoguer.writer) && obj_dialoguer.writer.msgno == msgno && (!waitend || obj_dialoguer.writer.halt > 0 || obj_dialoguer.writer.msgno > msgno))
    {
        if (i_ex(target))
            event_user(0);
        instance_destroy();
    }
}
else if (buffer > 0)
{
    buffer--;
}
else
{
    instance_destroy();
}
