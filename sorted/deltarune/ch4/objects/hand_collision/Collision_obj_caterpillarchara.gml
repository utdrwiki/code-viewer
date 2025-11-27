if (!i_ex(obj_mike_battle) && global.interact == 0)
{
    with (other)
    {
        image_index = 0;
        fun = 1;
        global.interact = 1;
        switch (name)
        {
            case "ralsei":
                sprite_index = spr_ralsei_down_surprised2;
                break;
            case "susie":
                sprite_index = spr_susie_sheeh;
                break;
        }
    }
    with (obj_mike_controller)
        alarm[2] = 10;
    instance_destroy();
}
