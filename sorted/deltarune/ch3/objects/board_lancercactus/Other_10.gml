var player = 0;
with (obj_mainchara_board)
{
    if (controlled == 1)
        player = id;
}
if (global.interact == 0 && player.canfreemove == true)
{
    if (triggered == false)
        triggered = true;
}
