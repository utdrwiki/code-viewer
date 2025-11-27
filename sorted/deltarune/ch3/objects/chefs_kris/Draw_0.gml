var _x = x;
var _y = y;
if (throwing && image_index < 1)
{
    _x += 24;
    _y += 40;
}
for (var i = 0; i < stack_height; i++)
{
    if (instance_exists(food[i]))
    {
        food[i].y = _y - 44 - (i * 12);
        food[i].x = _x;
        var _wobble = 1.125 + (2 * (stack_height / 6));
        food[i].x += sin((t - (i * 2)) * 0.2) * ((i * _wobble) / 2);
        food[i].depth = depth - i - 1;
    }
    else if (i == 0)
    {
        stack_height = 0;
    }
}
draw_self();
