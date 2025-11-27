lastState = state;
timer = 0;
con = 0;
if (state == UnknownEnum.Value_0)
{
    image_speed = 0;
    image_index = 0;
    sprite_index = spr_susiezilla_shadowguy_idle;
}
else if (state == UnknownEnum.Value_2 || state == UnknownEnum.Value_1)
{
    sprite_index = spr_susiezilla_shadowguy_idle;
    image_index = 1;
    image_speed = 0.16666666666666666;
}
else if (state == UnknownEnum.Value_4)
{
    sprite_index = spr_susiezilla_shadowguy_punch;
    image_speed = 0;
    image_index = 0;
}
else if (state == UnknownEnum.Value_5)
{
    sprite_index = spr_susiezilla_shadowguy_kick;
    image_speed = 0;
    image_index = 0;
}
else if (state == UnknownEnum.Value_3)
{
    sprite_index = spr_susiezilla_shadowguy_grabbed;
}
else if (state == UnknownEnum.Value_6)
{
    image_speed = 0;
    sprite_index = spr_susiezilla_shadowguy_hurt;
    image_index = 0;
}
else if (state == UnknownEnum.Value_7)
{
    image_speed = 0;
    sprite_index = spr_susiezilla_shadowguy_hurt;
    image_index = 1;
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7
}
