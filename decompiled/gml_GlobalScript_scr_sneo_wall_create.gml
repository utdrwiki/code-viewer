scr_sneo_wall_create = function(argument0, argument1, argument2, argument3, argument4, argument5, argument6) //gml_Script_scr_sneo_wall_create
{
    if (argument0 == 0)
    {
    }
    if (argument0 == 1)
        emptyspot1[wallsetupcount] = 1
    if (argument0 == 2)
        breakspot1[wallsetupcount] = 1
    if (argument0 == 3)
        pipispot1[wallsetupcount] = 1
    if (argument0 == 4)
        redbreakspot1[wallsetupcount] = 1
    if (argument1 == 0)
    {
    }
    if (argument1 == 1)
        emptyspot2[wallsetupcount] = 2
    if (argument1 == 2)
        breakspot2[wallsetupcount] = 2
    if (argument1 == 3)
        pipispot2[wallsetupcount] = 2
    if (argument1 == 4)
        redbreakspot2[wallsetupcount] = 2
    if (argument2 == 0)
    {
    }
    if (argument2 == 1)
        emptyspot3[wallsetupcount] = 3
    if (argument2 == 2)
        breakspot3[wallsetupcount] = 3
    if (argument2 == 3)
        pipispot3[wallsetupcount] = 3
    if (argument2 == 4)
        redbreakspot3[wallsetupcount] = 3
    if (argument3 == 0)
    {
    }
    if (argument3 == 1)
        emptyspot4[wallsetupcount] = 4
    if (argument3 == 2)
        breakspot4[wallsetupcount] = 4
    if (argument3 == 3)
        pipispot4[wallsetupcount] = 4
    if (argument3 == 4)
        redbreakspot4[wallsetupcount] = 4
    if (argument4 == 0)
    {
    }
    if (argument4 == 1)
        emptyspot5[wallsetupcount] = 5
    if (argument4 == 2)
        breakspot5[wallsetupcount] = 5
    if (argument4 == 3)
        pipispot5[wallsetupcount] = 5
    if (argument4 == 4)
        redbreakspot5[wallsetupcount] = 5
    wallcreatetimer[wallsetupcount] = argument5
    walltype[wallsetupcount] = argument6
    wallsetupcount++
    return;
}

