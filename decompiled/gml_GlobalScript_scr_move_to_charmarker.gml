scr_move_to_charmarker = function(argument0, argument1, argument2) //gml_Script_scr_move_to_charmarker
{
    var __myid = id
    __arg0 = argument0
    if (argument0 == "last" || argument0 == -1)
    {
        with (obj_charmarker)
        {
            if (lastmarker == 1)
                __myid.__arg0 = group
        }
    }
    if instance_exists(obj_charmarker)
        obj_charmarker.__arg0 = __arg0
    __marker[0] = self
    __marker[1] = self
    __marker[2] = self
    with (obj_charmarker)
    {
        if (group == __arg0 && char == 0)
            __myid.__marker[0] = id
        if (group == __arg0 && char == 1)
            __myid.__marker[1] = id
        if (group == __arg0 && char == 2)
            __myid.__marker[2] = id
    }
    if (__marker[0] != self && __marker[1] == self)
        __marker[1] = __marker[0]
    if (__marker[1] != self && __marker[2] == self)
        __marker[2] = __marker[1]
    if (instance_exists(obj_mainchara) && __marker[0] != self && argument1 == 0)
    {
        obj_mainchara.__marker = __marker[0]
        with (obj_mainchara)
        {
            fun = true
            __mover = scr_move_to_point_over_time(__marker.x, __marker.goal_y_pos, argument2)
            __mover.charmarker = 1
        }
    }
    for (__ii = 0; __ii < 2; __ii++)
    {
        if (i_ex(global.cinstance[__ii]) && __marker[(__ii + 1)] != self)
        {
            global.cinstance[__ii].__marker = __marker[(__ii + 1)]
            with (global.cinstance[__ii])
            {
                fun = true
                follow = 0
                goaly = __marker.goal_y_pos
                if (name == "susie")
                {
                    if (global.darkzone == true)
                        goaly -= 16
                    if (global.darkzone == false)
                        goaly -= 6
                }
                else
                    goaly -= 12
                __mover = scr_move_to_point_over_time(__marker.x, goaly, argument2)
                __mover.charmarker = 2
            }
        }
    }
    return;
}

