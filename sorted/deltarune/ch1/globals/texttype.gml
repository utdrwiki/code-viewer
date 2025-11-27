function scr_texttype()
{
    textscale = 1;
    var extra_ja_vspace = 0;
    if (!variable_global_exists("chemg_typer"))
        global.chemg_typer = -1;
    if (global.chemg_typer != global.typer)
        global.chemg_typer = global.typer;
    var font_set = true;
    switch (global.typer)
    {
        case 0:
            font_set = false;
            break;
        case 1:
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 1, snd_text, 8, 18, 0);
            break;
        case 2:
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 2, snd_nosound, 8, 18, 0);
            break;
        case 3:
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 2, snd_text, 8, 18, 1);
            break;
        case 4:
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 1, snd_text, 16, 28, 1);
            extra_ja_vspace = 2;
            break;
        case 5:
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 1, snd_text, 8, 18, 0);
            break;
        case 6:
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 1, snd_text, 16, 36, 1);
            break;
        case 7:
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 1, snd_txttor, 8, 18, 0);
            break;
        case 8:
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 2, snd_txttor, 8, 18, 0);
            break;
        case 10:
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 1, snd_txtsus, 8, 18, 0);
            break;
        case 11:
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 1, snd_txtsus, 8, 18, 0);
            break;
        case 12:
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 1, snd_txtnoe, 8, 18, 0);
            break;
        case 13:
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 1, snd_txtber, 8, 18, 0);
            break;
        case 14:
            scr_textsetup(scr_84_get_font("comicsans"), c_white, x, y, 33, 0, 1, snd_txtsans, 8, 18, 0);
            break;
        case 15:
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 1, snd_text, 8, 18, 0);
            break;
        case 16:
            font_set = false;
            break;
        case 17:
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 1, snd_txtund, 8, 18, 0);
            break;
        case 18:
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 1, snd_txtasg, 8, 18, 0);
            break;
        case 19:
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 1, snd_text, 8, 18, 0);
            break;
        case 20:
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 1, snd_txtal, 8, 18, 0);
            break;
        case 21:
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 1, snd_txtal, 8, 18, 0);
            break;
        case 22:
            scr_textsetup(scr_84_get_font("tinynoelle"), c_white, x, y + 7, 33, 0, 1, snd_txtal, 6, 18, 0);
            break;
        case 23:
            scr_textsetup(scr_84_get_font("tinynoelle"), c_white, x, y + 7, 33, 0, 1, snd_txtnoe, 6, 18, 0);
            break;
        case 30:
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 1, snd_txtsus, 16, 36, 1);
            break;
        case 31:
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 1, snd_txtral, 16, 36, 1);
            break;
        case 32:
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 1, snd_txtlan, 16, 36, 1);
            break;
        case 33:
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 1, snd_dadtxt, 16, 36, 1);
            break;
        case 35:
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 1, snd_txtjok, 16, 36, 1);
            break;
        case 36:
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 1, snd_nosound, 16, 36, 1);
            break;
        case 37:
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 3, snd_txtsus, 18, 36, 1);
            break;
        case 40:
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 2, snd_nosound, 8, 18, 0);
            break;
        case 41:
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 3, snd_nosound, 8, 18, 0);
            break;
        case 42:
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 2, snd_nosound, 16, 36, 1);
            break;
        case 45:
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 1, snd_txtral, 16, 28, 1);
            extra_ja_vspace = 2;
            break;
        case 46:
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 1, snd_txtlan, 16, 28, 1);
            extra_ja_vspace = 2;
            break;
        case 47:
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 1, snd_txtsus, 16, 28, 1);
            extra_ja_vspace = 2;
            break;
        case 48:
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 1, snd_dadtxt, 16, 28, 1);
            extra_ja_vspace = 2;
            break;
        case 50:
            scr_textsetup(scr_84_get_font("dotumche"), c_black, x, y, 33, 0, 1, snd_text, 9, 20, 0);
            break;
        case 51:
            if (global.lang == "ja")
                scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 14, snd_text, 16, 36, 1);
            else
                scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 10, snd_text, 16, 36, 1);
            break;
        case 52:
            if (global.lang == "ja")
                scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 6, snd_text, 16, 36, 1);
            else
                scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 4, snd_text, 16, 36, 1);
            break;
        case 53:
            scr_textsetup(scr_84_get_font("dotumche"), c_black, x, y, 33, 0, 1, snd_txtsus, 9, 20, 0);
            break;
        case 54:
            scr_textsetup(scr_84_get_font("dotumche"), c_black, x, y, 33, 0, 2, snd_txtsus, 9, 20, 0);
            break;
        case 55:
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 1, snd_txtrud, 8, 18, 0);
            break;
        case 60:
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 8, snd_nosound, 8, 18, 0);
            break;
        case 666:
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 4, snd_nosound, 12, 20, 2);
            break;
        case 667:
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 2, snd_nosound, 12, 20, 2);
            break;
        case 999:
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 4, snd_txtecho, 8, 18, 3);
            break;
        default:
            font_set = false;
            break;
    }
    if (font_set && global.lang == "ja")
    {
        if (myfont == 1)
        {
            hspace = ((hspace * 26) / 16) + 1;
            if (vspace == 32)
                vspace = 36;
        }
        else if (myfont == 10)
        {
            hspace = ((hspace * 13) / 8) + 1;
        }
        else if (myfont == 0)
        {
            textscale = 0.5;
            hspace = ((hspace * 13) / 8) + 3;
        }
        else if (myfont == 2)
        {
            hspace = ((hspace * 13) / 8) + 1;
        }
        else if (myfont == 9)
        {
            hspace = ((hspace * 26) / 16) + 1;
        }
        else if (myfont == 8)
        {
            hspace = ((hspace * 13) / 8) + 1;
        }
        vspace += extra_ja_vspace;
    }
}
