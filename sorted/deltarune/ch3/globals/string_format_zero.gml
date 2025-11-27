function string_format_zero(arg0, arg1, arg2)
{
    return string_replace_all(string_format(arg0, arg1, arg2), " ", "0");
}

function string_format_auto(arg0, arg1)
{
    if (frac(arg0) == 0)
        return string(arg0);
    else
        return string_format(arg0, 1, arg1);
}
