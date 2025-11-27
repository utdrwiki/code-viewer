var pusher = -4;
with (obj_mainchara_board)
{
    if (controlled == 1)
        pusher = id;
}
if (pusher.canfreemove && global.interact == 0 && con == 0)
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
    con = 1;
    mp_grid_clear_cell(global.grid, x / 32, y / 32);
    with (obj_board_enemy_deer)
        blockinteract = 1;
}
