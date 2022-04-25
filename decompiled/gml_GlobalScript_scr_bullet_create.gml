scr_bullet_create = function(argument0, argument1, argument2) //gml_Script_scr_bullet_create
{
    var __newbullet = instance_create(argument0, argument1, argument2)
    __newbullet.damage = damage
    __newbullet.target = target
    if variable_instance_exists(self, "element")
        __newbullet.element = element
    return __newbullet;
}

