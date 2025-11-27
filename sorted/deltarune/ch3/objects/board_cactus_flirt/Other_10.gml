var pusher = -4;
with (obj_mainchara_board)
{
    if (controlled == 1)
        pusher = id;
}
if (pusher.canfreemove && global.interact == 0 && con == 0 && pushed == false)
{
    x = floor(x / 32) * 32;
    y = floor(y / 32) * 32;
    switch (pusher.facing)
    {
        case 0:
            dir = "down";
            break;
        case 1:
            dir = "right";
            break;
        case 2:
            dir = "up";
            break;
        case 3:
            dir = "left";
            break;
    }
    global.interact = 1;
    pushed = 1;
    con = 1;
}
else
{
}
