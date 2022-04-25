scr_actor_setup_nofacing = function(argument0, argument1, argument2) //gml_Script_scr_actor_setup_nofacing
{
    _actorid = argument0
    _actorinstance = argument1
    _actorname = argument2
    obj_cutscene_master.actor_id[_actorid] = _actorinstance
    obj_cutscene_master.actor_name[_actorid] = _actorname
    _actorinstance.name = _actorname
    return;
}

