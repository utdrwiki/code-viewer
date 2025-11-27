scr_depth();
if (global.chapter > 1)
{
    with (obj_doorX)
        instance_destroy();
    var flower_sign = instance_create(1255, 70, obj_npc_sign);
    flower_sign.sprite_index = spr_flowershop_sign;
    with (flower_sign)
        visible = 0;
    var sign_collider = instance_create(1250, 96, obj_solidblock);
    sign_collider.image_xscale = 2;
    sign_collider.image_yscale = 1.1;
}
