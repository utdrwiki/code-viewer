event_inherited();
state = UnknownEnum.Value_1;
lastState = UnknownEnum.Value_0;
con = 0;
timer = 0;
conTime = 0;
stateChange = false;
shuffleCount = 0;
shuffleX = 0;
shuffleY = 0;
px = 0;
py = 0;
punchCount = 0;
punchCooldown = 0;
fall_speed = 0;
image_yscale = 2;
image_xscale = 2;
recoil = 0;
redflashtimer = 0;
hp = 30;
shadow = instance_create(x, y, obj_marker);
shadow.sprite_index = spr_susiezilla_shadow;
shadow.visible = false;
shadow.depth = depth + 1000;
shadow.image_xscale /= 2;

enum UnknownEnum
{
    Value_0,
    Value_1
}
