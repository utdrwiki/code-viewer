scr_bullbattle_muspos = function(argument0) //gml_Script_scr_bullbattle_muspos
{
    var targ = (argument0 - modifier)
    if (trackpos >= (targ - 0.03) && trackpos <= (targ + 0.01))
        return 1;
    else
        return 0;
}

