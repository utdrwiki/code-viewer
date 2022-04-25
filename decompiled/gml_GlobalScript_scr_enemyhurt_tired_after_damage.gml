scr_enemyhurt_tired_after_damage = function(argument0) //gml_Script_scr_enemyhurt_tired_after_damage
{
    if (global.monsterhp[myself] <= (global.monstermaxhp[myself] * argument0))
        scr_monster_make_tired(myself)
    return;
}

