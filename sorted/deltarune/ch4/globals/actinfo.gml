function scr_actinfo(arg0)
{
    actcost = -1;
    acttype = 0;
    actspell = 0;
    actor = 1;
    actname = " ";
    switch (arg0)
    {
        case 0:
            actcost = -1;
            acttype = 0;
            actspell = 0;
            actor = 1;
            actname = " ";
            break;
        case 1:
            actcost = -1;
            acttype = 0;
            actspell = 0;
            actor = 1;
            actname = "Compliment";
            break;
        case 2:
            actcost = -1;
            acttype = 1;
            actspell = 2;
            actor = 2;
            actname = "DualBuster";
            break;
    }
}
