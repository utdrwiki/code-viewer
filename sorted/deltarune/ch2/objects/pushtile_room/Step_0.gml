var checktype = 0;
if (room == room_dw_city_postbaseball_2)
    checktype = 1;
if (pushedoverride < 0)
{
    pushed = 0;
    for (var i = 0; i < 3; i++)
    {
        if (checktype == 0)
        {
            if (place_meeting(x, y, pushChar[i]))
                pushed = 1;
        }
        if (checktype == 1)
        {
            var col = instance_place(x, y, pushChar[i]);
            if (instance_exists(col))
            {
                if (col.visible && col.image_alpha > 0)
                    pushed = 1;
            }
        }
    }
}
else
{
    pushed = pushedoverride;
}
var pushchanged = -1;
if (pushed != rempushed)
    pushchanged = pushed;
if (pushchanged == 0)
    variable_instance_set(instance_find(bossObject, 0), pushVariableName, pushVariableUp);
if (pushchanged == 1)
{
    snd_play(pushSound);
    variable_instance_set(instance_find(bossObject, 0), pushVariableName, pushVariableDown);
}
if (pushType == 1)
{
    if (pushed == 1)
        pushedoverride = 1;
}
image_index = pushed;
rempushed = pushed;
