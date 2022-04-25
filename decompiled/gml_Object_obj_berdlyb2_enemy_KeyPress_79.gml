if scr_debug()
{
    global.monsterhp[myself] -= 100
    scr_debug_print(("health = " + string(global.monsterhp[myself])))
}
