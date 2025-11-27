var controlledPlayer = 0;
with (obj_mainchara_board)
{
    if (controlled == 1)
        controlledPlayer = id;
}
with (controlledPlayer)
{
    if (place_meeting(x, y, obj_board_dock))
        other.dock = instance_place(x, y, obj_board_dock);
}
if (engaged == 0 && buffer < 0 && disembark == 0 && i_ex(dock) && global.interact == 0)
{
    buffer = 5;
    myinteract = 3;
}
