scr_tensionheal = function(argument0) //gml_Script_scr_tensionheal
{
    global.tension += argument0
    if (global.tension > global.maxtension)
        global.tension = global.maxtension
    return;
}

