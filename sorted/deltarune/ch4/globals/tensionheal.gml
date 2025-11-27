function scr_tensionheal(arg0)
{
    if (i_ex(obj_jackenstein_enemy) && global.tempflag[89] >= 3)
        global.tension += ceil(arg0 * 1.5);
    else
        global.tension += arg0;
    if (global.tension > global.maxtension)
        global.tension = global.maxtension;
}
