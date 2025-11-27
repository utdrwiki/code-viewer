if (con == 1)
{
    timer += 2;
    if (timer == 2)
    {
        tile_grid[0][0] += 2;
        var newcol = 6365480;
        if (tile_grid[0][0] == 3)
            newcol = 6169907;
        if (tile_grid[0][0] == 5)
            newcol = 5446739;
        if (tile_grid[0][0] == 7)
            newcol = 595307;
        with (obj_gameshow_swordroute)
        {
            colorchange = 5;
            newcolor = newcol;
        }
    }
    if (timer == 4)
    {
        tile_grid[1][0] += 2;
        tile_grid[0][1] += 2;
    }
    if (timer == 6)
    {
        tile_grid[2][0] += 2;
        tile_grid[1][1] += 2;
        tile_grid[0][2] += 2;
    }
    if (timer == 8)
    {
        tile_grid[3][0] += 2;
        tile_grid[1][2] += 2;
        tile_grid[2][1] += 2;
        tile_grid[0][3] += 2;
    }
    if (timer == 10)
    {
        tile_grid[4][0] += 2;
        tile_grid[1][3] += 2;
        tile_grid[2][2] += 2;
        tile_grid[3][1] += 2;
        tile_grid[0][4] += 2;
    }
    if (timer == 12)
    {
        tile_grid[5][0] += 2;
        tile_grid[1][4] += 2;
        tile_grid[2][3] += 2;
        tile_grid[3][2] += 2;
        tile_grid[4][1] += 2;
        tile_grid[0][5] += 2;
    }
    if (timer == 14)
    {
        tile_grid[6][0] += 2;
        tile_grid[1][5] += 2;
        tile_grid[2][4] += 2;
        tile_grid[3][3] += 2;
        tile_grid[4][2] += 2;
        tile_grid[5][1] += 2;
        tile_grid[0][6] += 2;
    }
    if (timer == 16)
    {
        tile_grid[7][0] += 2;
        tile_grid[1][6] += 2;
        tile_grid[2][5] += 2;
        tile_grid[3][4] += 2;
        tile_grid[4][3] += 2;
        tile_grid[5][2] += 2;
        tile_grid[6][1] += 2;
        tile_grid[0][7] += 2;
    }
    if (timer == 18)
    {
        tile_grid[8][0] += 2;
        tile_grid[1][7] += 2;
        tile_grid[2][6] += 2;
        tile_grid[3][5] += 2;
        tile_grid[4][4] += 2;
        tile_grid[5][3] += 2;
        tile_grid[6][2] += 2;
        tile_grid[7][1] += 2;
    }
    if (timer == 20)
    {
        tile_grid[9][0] += 2;
        tile_grid[2][7] += 2;
        tile_grid[3][6] += 2;
        tile_grid[4][5] += 2;
        tile_grid[5][4] += 2;
        tile_grid[6][3] += 2;
        tile_grid[7][2] += 2;
        tile_grid[8][1] += 2;
    }
    if (timer == 22)
    {
        tile_grid[10][0] += 2;
        tile_grid[3][7] += 2;
        tile_grid[4][6] += 2;
        tile_grid[5][5] += 2;
        tile_grid[6][4] += 2;
        tile_grid[7][3] += 2;
        tile_grid[8][2] += 2;
        tile_grid[9][1] += 2;
    }
    if (timer == 24)
    {
        tile_grid[11][0] += 2;
        tile_grid[4][7] += 2;
        tile_grid[5][6] += 2;
        tile_grid[6][5] += 2;
        tile_grid[7][4] += 2;
        tile_grid[8][3] += 2;
        tile_grid[9][2] += 2;
        tile_grid[10][1] += 2;
    }
    if (timer == 26)
    {
        tile_grid[11][1] += 2;
        tile_grid[10][2] += 2;
        tile_grid[9][3] += 2;
        tile_grid[8][4] += 2;
        tile_grid[7][5] += 2;
        tile_grid[6][6] += 2;
        tile_grid[5][7] += 2;
    }
    if (timer == 28)
    {
        tile_grid[11][2] += 2;
        tile_grid[10][3] += 2;
        tile_grid[9][4] += 2;
        tile_grid[8][5] += 2;
        tile_grid[7][6] += 2;
        tile_grid[6][7] += 2;
    }
    if (timer == 30)
    {
        tile_grid[11][3] += 2;
        tile_grid[10][4] += 2;
        tile_grid[9][5] += 2;
        tile_grid[8][6] += 2;
        tile_grid[7][7] += 2;
    }
    if (timer == 32)
    {
        tile_grid[11][4] += 2;
        tile_grid[10][5] += 2;
        tile_grid[9][6] += 2;
        tile_grid[8][7] += 2;
    }
    if (timer == 34)
    {
        tile_grid[11][5] += 2;
        tile_grid[10][6] += 2;
        tile_grid[9][7] += 2;
    }
    if (timer == 34)
    {
        tile_grid[11][6] += 2;
        tile_grid[10][7] += 2;
    }
    if (timer == 36)
    {
        tile_grid[11][7] += 2;
        timer = 0;
        con = 0;
    }
}
if (con == 2)
{
    for (var i = 0; i < 12; i++)
    {
        for (var ii = 0; ii < 8; ii++)
            tile_grid[i][ii] += 2;
    }
    var newcol = 6365480;
    if (tile_grid[0][0] == 9)
        newcol = 3413854;
    if (tile_grid[0][0] == 11)
        newcol = 6102618;
    if (tile_grid[0][0] == 13)
        newcol = 16724736;
    with (obj_gameshow_swordroute)
    {
        colorchange = 5;
        newcolor = newcol;
    }
    con = 0;
}
index += 0.05;
var x_start = 128;
var y_start = 64;
var a = 0;
var b = 0;
repeat (12)
{
    repeat (8)
    {
        if (tile_grid[a][b] == 6)
            draw_sprite(spr_shadow_mantle_new_tiles_glow1, index, x_start + (a * 32), y_start + (b * 32));
        else if (tile_grid[a][b] == 7)
            draw_sprite(spr_shadow_mantle_new_tiles_glow2, index, x_start + (a * 32), y_start + (b * 32));
        else
            draw_sprite(spr_shadow_mantle_new_tiles, tile_grid[a][b], x_start + (a * 32), y_start + (b * 32));
        b++;
    }
    a++;
    b = 0;
}
