function scr_getpocketspace()
{
    var space = 0;
    for (var i = 0; i < array_length(global.pocketitem); i++)
    {
        if (global.pocketitem[i] == 0)
            space++;
    }
    show_debug_message_concat("pocket space=", space);
    return space;
}

function scr_getinventoryspace()
{
    var space = 0;
    for (var i = 0; i < (array_length(global.item) - 1); i++)
    {
        if (global.item[i] == 0)
            space++;
    }
    show_debug_message_concat("inventory space=", space);
    return space;
}

function scr_getweaponspace()
{
    var space = 0;
    for (var i = 0; i < array_length(global.weapon); i++)
    {
        if (global.weapon[i] == 0)
            space++;
    }
    show_debug_message_concat("weapon space=", space);
    return space;
}

function scr_getarmorspace()
{
    var space = 0;
    for (var i = 0; i < array_length(global.armor); i++)
    {
        if (global.armor[i] == 0)
            space++;
    }
    show_debug_message_concat("armor space=", space);
    return space;
}
