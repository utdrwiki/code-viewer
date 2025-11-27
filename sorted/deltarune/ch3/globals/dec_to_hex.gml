function dec_to_hex(arg0, arg1 = 1)
{
    var hex = "";
    if (arg0 < 0)
        arg1 = max(arg1, ceil(logn(16, 2 * abs(arg0))));
    var dig = "0123456789ABCDEF";
    while (arg1-- || arg0)
    {
        hex = string_char_at(dig, (arg0 & 15) + 1) + hex;
        arg0 = arg0 >> 4;
    }
    return hex;
}
