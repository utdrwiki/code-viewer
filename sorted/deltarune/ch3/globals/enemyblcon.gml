function scr_enemyblcon(arg0, arg1, arg2)
{
    if (arg2 == 0)
    {
        mywriter = instance_create(arg0, arg1, obj_writer);
        return mywriter;
    }
    if (arg2 == 1)
    {
        myblcon = instance_create(arg0, arg1, obj_battleblcon);
        return myblcon;
    }
    if (arg2 == 2)
    {
        myblcon = instance_create(arg0, arg1, obj_battleblcon);
        myblcon.sprite_index = spr_battleblcon_v;
        return myblcon;
    }
    if (arg2 == 3)
    {
        myblcon = instance_create(arg0, arg1, obj_battleblcon);
        myblcon.sprite_index = spr_battleblcon_long;
        return myblcon;
    }
    if (arg2 == 4)
    {
        myblcon = instance_create(arg0, arg1, obj_battleblcon);
        myblcon.sprite_index = spr_battleblcon_long;
        myblcon.image_index = 0;
        myblcon.image_speed = 0;
        return myblcon;
    }
    if (arg2 == 5)
    {
        myblcon = instance_create(arg0, arg1, obj_battleblcon);
        myblcon.sprite_index = spr_battleblcon_long;
        myblcon.image_index = 1;
        myblcon.image_speed = 0;
        return myblcon;
    }
    if (arg2 == 6)
    {
        myblcon = instance_create(arg0, arg1, obj_battleblcon);
        myblcon.sprite_index = spr_battleblcon_clubs;
        myblcon.image_index = 2;
        myblcon.image_speed = 0;
        return myblcon;
    }
    if (arg2 == 7)
    {
        myblcon = instance_create(arg0, arg1, obj_battleblcon);
        myblcon.sprite_index = spr_battleblcon_long_r;
        myblcon.image_index = 2;
        myblcon.image_speed = 0;
        return myblcon;
    }
    if (arg2 == 8)
    {
        myblcon = instance_create(arg0, arg1, obj_battleblcon);
        myblcon.sprite_index = spr_battleblcon_long_tall;
        return myblcon;
    }
    if (arg2 == 10)
    {
        myblcon = instance_create(arg0, arg1, obj_battleblcon);
        myblcon.sprite_index = spr_battleblcon_long;
        myblcon.auto_length = 1;
        return myblcon;
    }
    if (arg2 == 11)
    {
        myblcon = instance_create(arg0, arg1, obj_battleblcon);
        myblcon.sprite_index = spr_battleblcon_v2_left;
        return myblcon;
    }
    if (arg2 == 12)
    {
        myblcon = instance_create(arg0, arg1, obj_battleblcon);
        myblcon.sprite_index = spr_battleblcon_v2_right;
        return myblcon;
    }
    if (arg2 == 12.1)
    {
        myblcon = instance_create(arg0, arg1, obj_battleblcon);
        myblcon.sprite_index = spr_battleblcon_v2_right2;
        return myblcon;
    }
    if (arg2 == 12.2)
    {
        myblcon = instance_create(arg0, arg1, obj_battleblcon);
        myblcon.sprite_index = spr_battleblcon_v2_right3;
        return myblcon;
    }
    if (arg2 == 12.3)
    {
        myblcon = instance_create(arg0, arg1, obj_battleblcon);
        myblcon.sprite_index = spr_battleblcon_v2_right4;
        return myblcon;
    }
    if (arg2 == 12.4)
    {
        myblcon = instance_create(arg0, arg1, obj_battleblcon);
        myblcon.sprite_index = spr_battleblcon_v2_right5;
        return myblcon;
    }
    if (arg2 == 13)
    {
        myblcon = instance_create(arg0, arg1, obj_battleblcon);
        myblcon.sprite_index = spr_battleblcon_long;
        myblcon.auto_length = 1;
        myblcon.side = 2;
        return myblcon;
    }
    if (arg2 == 14)
    {
        myblcon = instance_create(arg0, arg1, obj_battleblcon);
        myblcon.sprite_index = spr_battleblcon_long;
        myblcon.auto_length = 1;
        myblcon.side = -1;
        return myblcon;
    }
}
