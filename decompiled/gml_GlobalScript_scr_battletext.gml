scr_battletext = function() //gml_Script_scr_battletext
{
    xx = __view_get((0 << 0), 0)
    yy = __view_get((1 << 0), 0)
    if (global.fc != 0)
        battlewriter = instance_create((xx + 30), (yy + 376), obj_writer)
    if (global.fc == 0)
        battlewriter = instance_create((xx + 30), (yy + 376), obj_writer)
    myface = instance_create((xx + 26), (yy + 380), obj_face)
    with (battlewriter)
    {
        dialoguer = 1
        facer = 1
        if (global.fc == 0 && originalcharline == 33)
            charline = 26
    }
    return battlewriter;
}

