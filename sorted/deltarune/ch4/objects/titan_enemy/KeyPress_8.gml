if (scr_debug())
{
    if (drawstate == "defense end")
    {
        drawstate = "undefense";
        drawstatetimer = 6;
        snd_play(snd_wingflap3);
        feathercon = 2;
    }
    else if (sunkus_kb_check_direct(160) && global.monsterhp[myself] > 10000)
    {
        global.monsterhp[myself] = 10001;
        debug_print("Titan HP reduced to " + string(global.monsterhp[myself]));
    }
    else
    {
        global.monsterhp[myself] -= 1000;
        debug_print("Titan HP reduced to " + string(global.monsterhp[myself]));
    }
}
