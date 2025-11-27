x = floor(x / 32) * 32;
y = floor(y / 32) * 32;
switch (remotepush)
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
remotepush = -1;
con = 1;
mp_grid_clear_cell(global.grid, x / 32, y / 32);
