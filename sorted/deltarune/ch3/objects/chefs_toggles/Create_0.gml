t = 0;
var i = 0;
repeat (30)
{
    opt[i] = 0;
    i++;
    optmax[i] = 1;
}

function refresh_options()
{
    var _str = "NONE";
    var i = 0;
    switch (opt[i])
    {
        default:
            break;
        case 1:
            _str = "DODGE FIRE";
            break;
        case 2:
            _str = "DEFEAT GUESTS";
            break;
        case 3:
            _str = "DODGE & FIGHT";
            break;
        case 4:
            _str = "FIRE WHIP";
            break;
        case 5:
            _str = "FIRE WHIP (HARD)";
            break;
        case 6:
            _str = "DODGE FIRE (EASY)";
            break;
    }
    option[i] = "microgame: " + string(opt[i]) + " " + _str;
    optmax[i] = 6;
    i++;
    option[i] = "enable MUSIC: " + string(opt[i]);
    i++;
    option[i] = "[ START ]";
    menu_length = array_length(option);
}

selected = false;
selection = 0;
refresh_options();
hfast = 0;
vfast = 0;
t = 0;
depth = -100;
