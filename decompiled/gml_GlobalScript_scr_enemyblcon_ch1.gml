scr_enemyblcon_ch1 = function(argument0, argument1, argument2) //gml_Script_scr_enemyblcon_ch1
{
    if (argument2 == 0)
    {
        mywriter = instance_create_ch1(argument0, argument1, obj_writer_ch1)
        return mywriter;
    }
    if (argument2 == 1)
    {
        myblcon = instance_create_ch1(argument0, argument1, obj_battleblcon_ch1)
        return myblcon;
    }
    if (argument2 == 2)
    {
        myblcon = instance_create_ch1(argument0, argument1, obj_battleblcon_ch1)
        myblcon.sprite_index = spr_battleblcon_v_ch1
        return myblcon;
    }
    if (argument2 == 3)
    {
        myblcon = instance_create_ch1(argument0, argument1, obj_battleblcon_ch1)
        myblcon.sprite_index = spr_battleblcon_long_ch1
        return myblcon;
    }
    if (argument2 == 4)
    {
        myblcon = instance_create_ch1(argument0, argument1, obj_battleblcon_ch1)
        myblcon.sprite_index = spr_battleblcon_clubs_ch1
        myblcon.image_index = 0
        myblcon.image_speed = 0
        return myblcon;
    }
    if (argument2 == 5)
    {
        myblcon = instance_create_ch1(argument0, argument1, obj_battleblcon_ch1)
        myblcon.sprite_index = spr_battleblcon_clubs_ch1
        myblcon.image_index = 1
        myblcon.image_speed = 0
        return myblcon;
    }
    if (argument2 == 6)
    {
        myblcon = instance_create_ch1(argument0, argument1, obj_battleblcon_ch1)
        myblcon.sprite_index = spr_battleblcon_clubs_ch1
        myblcon.image_index = 2
        myblcon.image_speed = 0
        return myblcon;
    }
    if (argument2 == 7)
    {
        myblcon = instance_create_ch1(argument0, argument1, obj_battleblcon_ch1)
        myblcon.sprite_index = spr_battleblcon_long_r_ch1
        myblcon.image_index = 2
        myblcon.image_speed = 0
        return myblcon;
    }
    if (argument2 == 8)
    {
        myblcon = instance_create_ch1(argument0, argument1, obj_battleblcon_ch1)
        myblcon.sprite_index = spr_battleblcon_long_tall_ch1
        return myblcon;
    }
    return;
}

