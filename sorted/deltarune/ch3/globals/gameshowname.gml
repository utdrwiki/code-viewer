function scr_gameshowname()
{
    alphanumericarray[0] = "A";
    alphanumericarray[1] = "B";
    alphanumericarray[2] = "C";
    alphanumericarray[3] = "D";
    alphanumericarray[4] = "E";
    alphanumericarray[5] = "F";
    alphanumericarray[6] = "G";
    alphanumericarray[7] = "H";
    alphanumericarray[8] = "I";
    alphanumericarray[9] = "J";
    alphanumericarray[10] = "K";
    alphanumericarray[11] = "L";
    alphanumericarray[12] = "M";
    alphanumericarray[13] = "N";
    alphanumericarray[14] = "O";
    alphanumericarray[15] = "P";
    alphanumericarray[16] = "Q";
    alphanumericarray[17] = "R";
    alphanumericarray[18] = "S";
    alphanumericarray[19] = "T";
    alphanumericarray[20] = "U";
    alphanumericarray[21] = "V";
    alphanumericarray[22] = "W";
    alphanumericarray[23] = "X";
    alphanumericarray[24] = "Y";
    alphanumericarray[25] = "Z";
    alphanumericarray[26] = "0";
    alphanumericarray[27] = "1";
    alphanumericarray[28] = "2";
    alphanumericarray[29] = "3";
    alphanumericarray[30] = "4";
    alphanumericarray[31] = "5";
    alphanumericarray[32] = "6";
    alphanumericarray[33] = "7";
    alphanumericarray[34] = "8";
    alphanumericarray[35] = "9";
    alphanumericarray[36] = "?";
    alphanumericarray[37] = "!";
    alphanumericarray[38] = ".";
    alphanumericarray[39] = "-";
    if (global.lang == "ja")
        alphanumericarray = scr_ja_alphanumericarray();
    var ___mystring = alphanumericarray[global.flag[1012]] + alphanumericarray[global.flag[1013]] + alphanumericarray[global.flag[1014]];
    return ___mystring;
}
