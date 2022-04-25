if instance_exists(obj_dialoguer_ch1)
{
    with (obj_dialoguer_ch1)
    {
        if instance_exists(writer)
        {
            wwx = writer.x
            wwy = writer.y
        }
        with (obj_face_ch1)
            instance_destroy()
        with (writer)
            instance_destroy()
        global.msc += 1
        scr_text_ch1(global.msc)
        event_user(0)
    }
}
with (obj_choicer_old_ch1)
    instance_destroy()
