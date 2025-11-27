if (falling)
{
    can_push = false;
    exit;
}
var _px = obj_homealone_heart.px;
if (place_meeting(x + _px, y, obj_solidblock) || place_meeting(x + _px, y, obj_traintrack_parent))
    can_push = false;
else
    can_push = true;
