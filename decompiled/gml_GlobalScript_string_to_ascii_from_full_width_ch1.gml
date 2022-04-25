string_to_ascii_from_full_width_ch1 = function(argument0) //gml_Script_string_to_ascii_from_full_width_ch1
{
    var str = argument0
    var result = ""
    for (var i = 1; i <= string_length(str); i++)
    {
        var ch = ord(string_char_at(str, i))
        if (ch >= 65281 && ch <= 65374)
            ch -= 65248
        else if (ch == 12288)
            ch = 32
        var lastch = chr(ch)
        result += lastch
    }
    return result;
}

