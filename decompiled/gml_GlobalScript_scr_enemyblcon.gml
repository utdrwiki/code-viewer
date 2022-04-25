scr_enemyblcon = function(argument0, argument1, argument2) //gml_Script_scr_enemyblcon
{
    if (argument2 == 0)
    {
        mywriter = instance_create(argument0, argument1, obj_writer)
        return mywriter;
    }
    if (argument2 == 1)
    {
        myblcon = instance_create(argument0, argument1, obj_battleblcon)
        return myblcon;
    }
    if (argument2 == 2)
    {
        myblcon = instance_create(argument0, argument1, obj_battleblcon)
        myblcon.sprite_index = spr_battleblcon_v
        return myblcon;
    }
    if (argument2 == 3)
    {
        myblcon = instance_create(argument0, argument1, obj_battleblcon)
        myblcon.sprite_index = spr_battleblcon_long
        return myblcon;
    }
    if (argument2 == 4)
    {
        myblcon = instance_create(argument0, argument1, obj_battleblcon)
        myblcon.sprite_index = spr_battleblcon_clubs
        myblcon.image_index = 0
        myblcon.image_speed = 0
        return myblcon;
    }
    if (argument2 == 5)
    {
        myblcon = instance_create(argument0, argument1, obj_battleblcon)
        myblcon.sprite_index = spr_battleblcon_clubs
        myblcon.image_index = 1
        myblcon.image_speed = 0
        return myblcon;
    }
    if (argument2 == 6)
    {
        myblcon = instance_create(argument0, argument1, obj_battleblcon)
        myblcon.sprite_index = spr_battleblcon_clubs
        myblcon.image_index = 2
        myblcon.image_speed = 0
        return myblcon;
    }
    if (argument2 == 7)
    {
        myblcon = instance_create(argument0, argument1, obj_battleblcon)
        myblcon.sprite_index = spr_battleblcon_long_r
        myblcon.image_index = 2
        myblcon.image_speed = 0
        return myblcon;
    }
    if (argument2 == 8)
    {
        myblcon = instance_create(argument0, argument1, obj_battleblcon)
        myblcon.sprite_index = spr_battleblcon_long_tall
        return myblcon;
    }
    if (argument2 == 10)
    {
        myblcon = instance_create(argument0, argument1, obj_battleblcon)
        myblcon.sprite_index = spr_battleblcon_long
        myblcon.auto_length = true
        return myblcon;
    }
    return;
}

