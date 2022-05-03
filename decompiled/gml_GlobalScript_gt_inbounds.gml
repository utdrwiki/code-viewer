gt_inbounds = function(argument0, argument1) //gml_Script_gt_inbounds
{
    return gml_Script_gt_inbounds_tol(argument0, argument1, 0);
}

gt_inbounds_tol = function(argument0, argument1, argument2) //gml_Script_gt_inbounds_tol
{
    return (argument0 >= (gml_Script_gt_minx - argument2) && argument0 <= (gml_Script_gt_maxx + argument2) && argument1 >= (gml_Script_gt_miny - argument2) && argument1 <= (gml_Script_gt_maxy + argument2));
}

