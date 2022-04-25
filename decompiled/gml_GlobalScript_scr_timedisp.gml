scr_timedisp = function(argument0) //gml_Script_scr_timedisp
{
    var minutes = floor((argument0 / 1800))
    var seconds = round((((argument0 / 1800) - minutes) * 60))
    if (seconds == 60)
        seconds = 59
    if (seconds < 10)
        seconds = ("0" + string(seconds))
    var timedisp = ((string(minutes) + ":") + string(seconds))
    return timedisp;
}

