var _anim = instance_create(x + (obj_susiezilla.image_xscale * 20), y - 30, obj_animation);
_anim.sprite_index = spr_susiezilla_impact;
_anim.image_xscale = choose(-2, 2);
_anim.image_yscale = choose(-2, 2);
_anim.image_angle = irandom(3) * 90;
_anim.image_speed = 0.5;
_anim.depth = obj_susiezilla.depth - 20;
if (slideAttack && obj_susiezilla.hitstun == 0)
    obj_susiezilla.hitstun = 1;
