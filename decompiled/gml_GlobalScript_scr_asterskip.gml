scr_asterskip = function() //gml_Script_scr_asterskip
{
    if (aster == true && autoaster == true)
    {
        length += 2
        mystring = string_insert("||", mystring, i)
    }
    if (aster == 2)
        aster = true
    return;
}

