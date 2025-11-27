siner++;
smallerLight = (sin(siner / 30) * 10) + radius;
biggerLight = (sin((siner - 10) / 30) * 10) + radius + 40;
var _followLight = -4;
_followLight = collision_circle(x, y, smallerLight, obj_followinglight, false, true);
if (_followLight != -4)
    _followLight.timer += 1.1;
