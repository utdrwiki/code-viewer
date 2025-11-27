if (init == 0)
{
    for (var i = 0; i < 20; i++)
    {
        genx[i] = 2;
        geny[i] = 2;
        actualcat[i] = -4;
        catmarker[i] = -4;
        catdrawx[i] = 0;
        catdrawy[i] = 0;
        catsiner[i] = 0;
        gencatbirth[i] = 5;
        buff[i] = 0;
    }
    init = 1;
}
var gencatnew = instance_number(obj_caterpillar_generic);
if (gencatnew > gencat)
{
    gencat = gencatnew;
    actualcat[gencat] = instance_find(obj_caterpillar_generic, gencat - 1);
    catmarker[gencat] = scr_dark_marker(ralsei.x, ralsei.y, actualcat[gencat].sprite_index);
    catmarker[gencat].name = actualcat[gencat].name;
    wasactive = false;
    kindaactive = true;
}
if (alert == 0)
{
    with (obj_dw__backstagelight)
    {
        if (alerted == 1)
        {
            if (special)
                other.special = true;
            other.alertlight = id;
            global.interact = 1;
            other.alert = 1;
            other.alerter = alerter;
            other.alerttimer = 0;
        }
    }
}
