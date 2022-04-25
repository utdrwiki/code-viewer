scr_ambush_ch1 = function() //gml_Script_scr_ambush_ch1
{
    with (obj_writer_ch1)
        instance_destroy()
    with (obj_face_ch1)
        instance_destroy()
    global.charturn = 3
    global.mnfight = 1
    global.myfight = -1
    return;
}

