scr_qb = function(argument0, argument1, argument2, argument3) //gml_Script_scr_qb
{
    list_attacktype[attackcountmax] = argument0
    list_attackamount[attackcountmax] = argument1
    list_attackvariant[attackcountmax] = argument2
    list_attackwait[attackcountmax] = argument3
    attackcountmax++
    return;
}

