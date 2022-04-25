scr_texttype_ch1 = function() //gml_Script_scr_texttype_ch1
{
    textscale = 1
    var extra_ja_vspace = 0
    if (!variable_global_exists("chemg_typer"))
        global.chemg_typer = -1
    if (global.chemg_typer != global.typer)
        global.chemg_typer = global.typer
    var font_set = true
    switch global.typer
    {
        case 0:
            font_set = false
            break
        case 1:
            scr_textsetup_ch1(scr_84_get_font_ch1("main"), c_white, x, y, 33, 0, 1, snd_text_ch1, 8, 18, false)
            break
        case 2:
            scr_textsetup_ch1(scr_84_get_font_ch1("main"), c_white, x, y, 33, 0, 2, snd_nosound_ch1, 8, 18, false)
            break
        case 3:
            scr_textsetup_ch1(scr_84_get_font_ch1("main"), c_white, x, y, 33, 0, 2, snd_text_ch1, 8, 18, true)
            break
        case 4:
            scr_textsetup_ch1(scr_84_get_font_ch1("mainbig"), c_white, x, y, 33, 0, 1, snd_text_ch1, 16, 28, true)
            extra_ja_vspace = 2
            break
        case 5:
            scr_textsetup_ch1(scr_84_get_font_ch1("main"), c_white, x, y, 33, 0, 1, snd_text_ch1, 8, 18, false)
            break
        case 6:
            scr_textsetup_ch1(scr_84_get_font_ch1("mainbig"), c_white, x, y, 33, 0, 1, snd_text_ch1, 16, 36, true)
            break
        case 7:
            scr_textsetup_ch1(scr_84_get_font_ch1("main"), c_white, x, y, 33, 0, 1, snd_txttor_ch1, 8, 18, false)
            break
        case 8:
            scr_textsetup_ch1(scr_84_get_font_ch1("main"), c_white, x, y, 33, 0, 2, snd_txttor_ch1, 8, 18, false)
            break
        case 10:
            scr_textsetup_ch1(scr_84_get_font_ch1("main"), c_white, x, y, 33, 0, 1, snd_txtsus_ch1, 8, 18, false)
            break
        case 11:
            scr_textsetup_ch1(scr_84_get_font_ch1("main"), c_white, x, y, 33, 0, 1, snd_txtsus_ch1, 8, 18, false)
            break
        case 12:
            scr_textsetup_ch1(scr_84_get_font_ch1("main"), c_white, x, y, 33, 0, 1, snd_txtnoe_ch1, 8, 18, false)
            break
        case 13:
            scr_textsetup_ch1(scr_84_get_font_ch1("main"), c_white, x, y, 33, 0, 1, snd_txtber_ch1, 8, 18, false)
            break
        case 14:
            scr_textsetup_ch1(scr_84_get_font_ch1("comicsans"), c_white, x, y, 33, 0, 1, snd_txtsans_ch1, 8, 18, false)
            break
        case 15:
            scr_textsetup_ch1(scr_84_get_font_ch1("main"), c_white, x, y, 33, 0, 1, snd_text_ch1, 8, 18, false)
            break
        case 16:
            font_set = false
            break
        case 17:
            scr_textsetup_ch1(scr_84_get_font_ch1("main"), c_white, x, y, 33, 0, 1, snd_txtund_ch1, 8, 18, false)
            break
        case 18:
            scr_textsetup_ch1(scr_84_get_font_ch1("main"), c_white, x, y, 33, 0, 1, snd_txtasg_ch1, 8, 18, false)
            break
        case 19:
            scr_textsetup_ch1(scr_84_get_font_ch1("main"), c_white, x, y, 33, 0, 1, snd_text_ch1, 8, 18, false)
            break
        case 20:
            scr_textsetup_ch1(scr_84_get_font_ch1("main"), c_white, x, y, 33, 0, 1, snd_txtal_ch1, 8, 18, false)
            break
        case 21:
            scr_textsetup_ch1(scr_84_get_font_ch1("main"), c_white, x, y, 33, 0, 1, snd_txtal_ch1, 8, 18, false)
            break
        case 22:
            scr_textsetup_ch1(scr_84_get_font_ch1("tinynoelle"), c_white, x, (y + 7), 33, 0, 1, snd_txtal_ch1, 6, 18, false)
            break
        case 23:
            scr_textsetup_ch1(scr_84_get_font_ch1("tinynoelle"), c_white, x, (y + 7), 33, 0, 1, snd_txtnoe_ch1, 6, 18, false)
            break
        case 30:
            scr_textsetup_ch1(scr_84_get_font_ch1("mainbig"), c_white, x, y, 33, 0, 1, snd_txtsus_ch1, 16, 36, true)
            break
        case 31:
            scr_textsetup_ch1(scr_84_get_font_ch1("mainbig"), c_white, x, y, 33, 0, 1, snd_txtral_ch1, 16, 36, true)
            break
        case 32:
            scr_textsetup_ch1(scr_84_get_font_ch1("mainbig"), c_white, x, y, 33, 0, 1, snd_txtlan_ch1, 16, 36, true)
            break
        case 33:
            scr_textsetup_ch1(scr_84_get_font_ch1("mainbig"), c_white, x, y, 33, 0, 1, snd_dadtxt_ch1, 16, 36, true)
            break
        case 35:
            scr_textsetup_ch1(scr_84_get_font_ch1("mainbig"), c_white, x, y, 33, 0, 1, snd_txtjok_ch1, 16, 36, true)
            break
        case 36:
            scr_textsetup_ch1(scr_84_get_font_ch1("mainbig"), c_white, x, y, 33, 0, 1, snd_nosound_ch1, 16, 36, true)
            break
        case 37:
            scr_textsetup_ch1(scr_84_get_font_ch1("mainbig"), c_white, x, y, 33, 0, 3, snd_txtsus_ch1, 18, 36, true)
            break
        case 40:
            scr_textsetup_ch1(scr_84_get_font_ch1("main"), c_white, x, y, 33, 0, 2, snd_nosound_ch1, 8, 18, false)
            break
        case 41:
            scr_textsetup_ch1(scr_84_get_font_ch1("main"), c_white, x, y, 33, 0, 3, snd_nosound_ch1, 8, 18, false)
            break
        case 42:
            scr_textsetup_ch1(scr_84_get_font_ch1("mainbig"), c_white, x, y, 33, 0, 2, snd_nosound_ch1, 16, 36, true)
            break
        case 45:
            scr_textsetup_ch1(scr_84_get_font_ch1("mainbig"), c_white, x, y, 33, 0, 1, snd_txtral_ch1, 16, 28, true)
            extra_ja_vspace = 2
            break
        case 46:
            scr_textsetup_ch1(scr_84_get_font_ch1("mainbig"), c_white, x, y, 33, 0, 1, snd_txtlan_ch1, 16, 28, true)
            extra_ja_vspace = 2
            break
        case 47:
            scr_textsetup_ch1(scr_84_get_font_ch1("mainbig"), c_white, x, y, 33, 0, 1, snd_txtsus_ch1, 16, 28, true)
            extra_ja_vspace = 2
            break
        case 48:
            scr_textsetup_ch1(scr_84_get_font_ch1("mainbig"), c_white, x, y, 33, 0, 1, snd_dadtxt_ch1, 16, 28, true)
            extra_ja_vspace = 2
            break
        case 50:
            scr_textsetup_ch1(scr_84_get_font_ch1("dotumche"), c_black, x, y, 33, 0, 1, snd_text_ch1, 9, 20, false)
            break
        case 51:
            if (global.lang == "ja")
                scr_textsetup_ch1(scr_84_get_font_ch1("mainbig"), c_white, x, y, 33, 0, 14, snd_text_ch1, 16, 36, true)
            else
                scr_textsetup_ch1(scr_84_get_font_ch1("mainbig"), c_white, x, y, 33, 0, 10, snd_text_ch1, 16, 36, true)
            break
        case 52:
            if (global.lang == "ja")
                scr_textsetup_ch1(scr_84_get_font_ch1("mainbig"), c_white, x, y, 33, 0, 6, snd_text_ch1, 16, 36, true)
            else
                scr_textsetup_ch1(scr_84_get_font_ch1("mainbig"), c_white, x, y, 33, 0, 4, snd_text_ch1, 16, 36, true)
            break
        case 53:
            scr_textsetup_ch1(scr_84_get_font_ch1("dotumche"), c_black, x, y, 33, 0, 1, snd_txtsus_ch1, 9, 20, false)
            break
        case 54:
            scr_textsetup_ch1(scr_84_get_font_ch1("dotumche"), c_black, x, y, 33, 0, 2, snd_txtsus_ch1, 9, 20, false)
            break
        case 55:
            scr_textsetup_ch1(scr_84_get_font_ch1("main"), c_white, x, y, 33, 0, 1, snd_txtrud_ch1, 8, 18, false)
            break
        case 60:
            scr_textsetup_ch1(scr_84_get_font_ch1("main"), c_white, x, y, 33, 0, 8, snd_nosound_ch1, 8, 18, false)
            break
        case 666:
            scr_textsetup_ch1(scr_84_get_font_ch1("main"), c_white, x, y, 33, 0, 4, snd_nosound_ch1, 12, 20, 2)
            break
        case 667:
            scr_textsetup_ch1(scr_84_get_font_ch1("main"), c_white, x, y, 33, 0, 2, snd_nosound_ch1, 12, 20, 2)
            break
        case 999:
            scr_textsetup_ch1(scr_84_get_font_ch1("main"), c_white, x, y, 33, 0, 4, snd_txtecho_ch1, 8, 18, 3)
            break
        default:
            font_set = false
            break
    }

    if (font_set && global.lang == "ja")
    {
        if (myfont == fnt_ja_main)
        {
            hspace = (((hspace * 26) / 16) + 1)
            if (vspace == 32)
                vspace = 36
        }
        else if (myfont == fnt_ja_mainbig)
            hspace = (((hspace * 13) / 8) + 1)
        else if (myfont == fnt_ja_comicsans)
        {
            textscale = 0.5
            hspace = (((hspace * 13) / 8) + 3)
        }
        else if (myfont == fnt_ja_tinynoelle)
            hspace = (((hspace * 13) / 8) + 1)
        else if (myfont == fnt_ja_dotumche)
            hspace = (((hspace * 26) / 16) + 1)
        else if (myfont == fnt_ja_small)
            hspace = (((hspace * 13) / 8) + 1)
        vspace += extra_ja_vspace
    }
    return;
}

