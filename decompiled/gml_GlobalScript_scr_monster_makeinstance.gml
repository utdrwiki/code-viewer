scr_monster_makeinstance = function(argument0) //gml_Script_scr_monster_makeinstance
{
    global.monster[argument0] = true
    with (global.monsterinstance[argument0])
        instance_destroy()
    global.monsterinstance[argument0] = instance_create(global.monstermakex[argument0], global.monstermakey[argument0], global.monsterinstancetype[argument0])
    global.monsterinstance[argument0].myself = argument0
    with (global.monsterinstance[argument0])
        event_user(12)
    with (global.monsterinstance[argument0])
        event_user(15)
    return;
}

