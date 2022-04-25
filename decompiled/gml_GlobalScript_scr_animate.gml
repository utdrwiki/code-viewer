scr_animate = function(argument0, argument1, argument2) //gml_Script_scr_animate
{
    __animator = instance_create(x, y, obj_animator)
    __animator.target = id
    __animator.initframe = argument0
    __animator.endframe = argument1
    __animator.fake_image_speed = argument2
    return __animator;
}

