var dialoguerObj = 396;
if (global.chapter == 3)
{
    if (i_ex(obj_board_writer))
        dialoguerObj = 184;
}
with (dialoguerObj)
{
    if (i_ex(writer))
    {
        wwx = writer.x;
        wwy = writer.y;
    }
    with (obj_face)
        instance_destroy();
    with (writer)
        instance_destroy();
    with (obj_choicer_neo)
        global.fc = remfc;
    global.msc += 1;
    scr_text(global.msc);
    event_user(0);
}
if (fighting == 1)
{
    with (obj_writer)
        instance_destroy();
}
with (obj_choicer_neo)
    instance_destroy();
