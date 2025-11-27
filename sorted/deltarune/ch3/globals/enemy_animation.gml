function scr_enemy_animation(arg0, arg1 = 0, arg2 = 0, arg3 = false)
{
    return scr_enemy_animation_custom(1035, arg0, arg1, arg2, arg3);
}

function scr_enemy_animation_custom(arg0, arg1, arg2 = 0, arg3 = 0, arg4 = false)
{
    if (arg4)
    {
        arg2 *= image_xscale;
        arg3 *= image_yscale;
    }
    var _monster = global.monsterinstance[creator];
    var _anim_obj = instance_create(x + arg2, y + arg3, arg0);
    _anim_obj.creator = creator;
    _monster.visible = 0;
    _anim_obj.sprite_index = arg1;
    _anim_obj.image_xscale = _monster.image_xscale;
    _anim_obj.image_yscale = _monster.image_yscale;
    return _anim_obj;
}
