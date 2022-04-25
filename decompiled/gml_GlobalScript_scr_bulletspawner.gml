scr_bulletspawner = function(argument0, argument1, argument2) //gml_Script_scr_bulletspawner
{
    __dc = instance_create(argument0, argument1, argument2)
    __dc.creator = myself
    __dc.target = mytarget
    __dc.damage = (global.monsterat[myself] * 5)
    return __dc;
}

