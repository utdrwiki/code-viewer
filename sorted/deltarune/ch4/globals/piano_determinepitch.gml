function scr_piano_determinepitch(arg0 = 0, arg1 = 1)
{
    var pitcher = 1;
    if (arg1 == 1)
    {
        switch (arg0)
        {
            case 0:
                pitcher = 1;
                break;
            case 1:
                pitcher = 1.12;
                break;
            case 3:
                pitcher = 1.19;
                break;
            case 5:
                pitcher = 0.8928571428571428;
                break;
            case 7:
                pitcher = 0.5;
                break;
        }
    }
    if (arg1 == 2)
    {
        switch (arg0)
        {
            case 0:
                pitcher = 1;
                break;
            case 1:
                pitcher = 1.12;
                break;
            case 2:
                pitcher = 1.155;
                break;
            case 3:
                pitcher = 1.19;
                break;
            case 4:
                pitcher = 1.0414285714285714;
                break;
            case 5:
                pitcher = 0.8928571428571428;
                break;
            case 6:
                pitcher = 0.6964285714285714;
                break;
            case 7:
                pitcher = 0.5;
                break;
            case 8:
                pitcher = 0.3035714286;
                break;
        }
    }
    return pitcher;
}
