if (hp <= 0)
    exit;
if (state == UnknownEnum.Value_6 || state == UnknownEnum.Value_7)
    exit;
hp -= other.damage;
event_user(1);
with (other)
    event_user(0);
if (other.sprite_index == spr_susiezilla_tail_hitbox)
    image_xscale = sign(obj_susiezilla.image_xscale) * -2;
else
    image_xscale = sign(other.x - x) * 2;

enum UnknownEnum
{
    Value_6 = 6,
    Value_7
}
