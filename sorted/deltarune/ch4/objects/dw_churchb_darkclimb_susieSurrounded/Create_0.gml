enem = [];
count = 3;
repeat (count)
{
    var disenem = instance_create(x, y, obj_climb_enemy);
    with (disenem)
    {
        sprite_index = spr_climb_chaseenemy_40;
        image_blend = c_white;
        mask_index = spr_trigger_10;
    }
    array_push(enem, disenem);
}
siner = 0;
timer = 0;
con = 0;
