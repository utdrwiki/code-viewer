scr_targetall = function() //gml_Script_scr_targetall
{
    for (_ti = 0; _ti < 3; _ti += 1)
    {
        if (global.charcantarget[_ti] == true)
            global.targeted[_ti] = true
    }
    mytarget = 3
    target = 3
    return;
}

