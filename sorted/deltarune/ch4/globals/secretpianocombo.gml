function scr_secretpianocombo(arg0 = 3)
{
    var combo = ["7071", "3050", "5310"];
    if (arg0 < 3)
        return combo[arg0];
    else
        return combo[0] + combo[1] + combo[2];
}
