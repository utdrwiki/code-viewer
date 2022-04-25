scr_battletext_ch1 = function() //gml_Script_scr_battletext_ch1
{
    xx = __view_get((0 << 0), 0)
    yy = __view_get((1 << 0), 0)
    if (global.fc != 0)
        battlewriter = instance_create_ch1((xx + 30), (yy + 376), obj_writer_ch1)
    if (global.fc == 0)
        battlewriter = instance_create_ch1((xx + 30), (yy + 376), obj_writer_ch1)
    myface = instance_create_ch1((xx + 26), (yy + 380), obj_face_ch1)
    with (battlewriter)
    {
        dialoguer = 1
        facer = 1
        if (global.fc == 0 && originalcharline == 33)
            charline = 26
    }
    return battlewriter;
}

