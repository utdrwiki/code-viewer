scr_kana_check = function() //gml_Script_scr_kana_check
{
    var kanafound = 0
    var ___stringlength = string_length(argument0)
    var ___i = 1
    while (___i <= ___stringlength)
    {
        if (ord(string_char_at(argument0, ___i)) >= 12352)
        {
            kanafound = 1
            break
        }
        else
        {
            ___i++
            continue
        }
    }
    return kanafound;
}

