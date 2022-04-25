scr_tensionheal_ch1 = function(argument0) //gml_Script_scr_tensionheal_ch1
{
    global.tension += argument0
    if (global.tension > global.maxtension)
        global.tension = global.maxtension
    return;
}

