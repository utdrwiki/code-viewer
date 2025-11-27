function scr_nameentrybadcheck()
{
    var nextletter = false;
    var lang = 0;
    if (global.lang == "ja")
        lang = 1;
    if (lang == 0)
    {
        if (letter[0] == 5 && letter[1] == 20)
        {
            if (letter[2] == 2 || letter[2] == 10 || letter[2] == 16 || letter[2] == 23)
                nextletter = true;
        }
        if (letter[0] == 18 && letter[1] == 4 && letter[2] == 23)
            nextletter = true;
        if (letter[0] == 2 && letter[1] == 20 && letter[2] == 12)
            nextletter = true;
        if (letter[0] == 2 && letter[1] == 14)
        {
            if (letter[2] == 2 || letter[2] == 10 || letter[2] == 16)
                nextletter = true;
        }
        if (letter[0] == 5 && letter[1] == 2)
        {
            if (letter[2] == 10 || letter[2] == 23)
                nextletter = true;
        }
        if (letter[2] == 6)
            nextletter = true;
    }
    else if (letter[2] == scr_ja_alphanumericarray_check("コ") || letter[2] == scr_ja_alphanumericarray_check("ゲ") || letter[2] == scr_ja_alphanumericarray_check("バ") || letter[2] == scr_ja_alphanumericarray_check("ボ") || letter[2] == scr_ja_alphanumericarray_check("ポ"))
    {
        nextletter = true;
    }
    return nextletter;
}
