if (!i_ex(obj_shootout_controller))
{
    instance_destroy();
    exit;
}
var chosen_window = obj_shootout_controller.windows[0][0];
var shoot = 0;
var a = 3;
var patternreset = 0;
timer++;
if (pattern == -1)
{
    pattern = irandom(9);
    if (difficulty == 2)
        pattern = choose(13, 14, 15, 16, 17, 18, 19, 20, 21);
    patternprev = pattern;
}
if ((difficulty == 0 || difficulty == 1) && timer == 39)
{
    if (obj_shootout_controller.current_window_column == 0 && obj_shootout_controller.current_window_row == 0)
        pattern = choose(0, 1, 9);
    if (obj_shootout_controller.current_window_column == 1 && obj_shootout_controller.current_window_row == 0)
        pattern = choose(2, 5, 8);
    if (obj_shootout_controller.current_window_column == 2 && obj_shootout_controller.current_window_row == 0)
        pattern = choose(3, 4, 5, 6);
    if (obj_shootout_controller.current_window_column == 0 && obj_shootout_controller.current_window_row == 1)
        pattern = choose(1, 6, 8);
    if (obj_shootout_controller.current_window_column == 1 && obj_shootout_controller.current_window_row == 1)
        pattern = choose(0, 2, 4, 6, 8, 9);
    if (obj_shootout_controller.current_window_column == 2 && obj_shootout_controller.current_window_row == 1)
        pattern = choose(3, 6, 8);
    if (obj_shootout_controller.current_window_column == 0 && obj_shootout_controller.current_window_row == 2)
        pattern = choose(1, 4, 7, 9);
    if (obj_shootout_controller.current_window_column == 1 && obj_shootout_controller.current_window_row == 2)
        pattern = choose(2, 7, 8);
    if (obj_shootout_controller.current_window_column == 2 && obj_shootout_controller.current_window_row == 2)
        pattern = choose(0, 3, 7, 9);
}
if (pattern == 0)
{
    if (timer == 40)
    {
        chosen_window = obj_shootout_controller.windows[0][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 1)))
    {
        chosen_window = obj_shootout_controller.windows[1][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 2)))
    {
        chosen_window = obj_shootout_controller.windows[2][2];
        shoot = 1;
        patternreset = 1;
    }
}
if (pattern == 1)
{
    if (timer == 40)
    {
        chosen_window = obj_shootout_controller.windows[0][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 1)))
    {
        chosen_window = obj_shootout_controller.windows[0][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 2)))
    {
        chosen_window = obj_shootout_controller.windows[0][2];
        shoot = 1;
        patternreset = 1;
    }
}
if (pattern == 2)
{
    if (timer == 40)
    {
        chosen_window = obj_shootout_controller.windows[1][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 1)))
    {
        chosen_window = obj_shootout_controller.windows[1][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 2)))
    {
        chosen_window = obj_shootout_controller.windows[1][2];
        shoot = 1;
        patternreset = 1;
    }
}
if (pattern == 3)
{
    if (timer == 40)
    {
        chosen_window = obj_shootout_controller.windows[2][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 1)))
    {
        chosen_window = obj_shootout_controller.windows[2][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 2)))
    {
        chosen_window = obj_shootout_controller.windows[2][2];
        shoot = 1;
        patternreset = 1;
    }
}
if (pattern == 4)
{
    if (timer == 40)
    {
        chosen_window = obj_shootout_controller.windows[2][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 1)))
    {
        chosen_window = obj_shootout_controller.windows[1][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 2)))
    {
        chosen_window = obj_shootout_controller.windows[0][2];
        shoot = 1;
        patternreset = 1;
    }
}
if (pattern == 5)
{
    if (timer == 40)
    {
        chosen_window = obj_shootout_controller.windows[0][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 1)))
    {
        chosen_window = obj_shootout_controller.windows[1][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 2)))
    {
        chosen_window = obj_shootout_controller.windows[2][0];
        shoot = 1;
        patternreset = 1;
    }
}
if (pattern == 6)
{
    if (timer == 40)
    {
        chosen_window = obj_shootout_controller.windows[0][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 1)))
    {
        chosen_window = obj_shootout_controller.windows[1][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 2)))
    {
        chosen_window = obj_shootout_controller.windows[2][1];
        shoot = 1;
        patternreset = 1;
    }
}
if (pattern == 7)
{
    if (timer == 40)
    {
        chosen_window = obj_shootout_controller.windows[0][2];
        shoot = 1;
    }
    if (timer == (40 + (a * 1)))
    {
        chosen_window = obj_shootout_controller.windows[1][2];
        shoot = 1;
    }
    if (timer == (40 + (a * 2)))
    {
        chosen_window = obj_shootout_controller.windows[2][2];
        shoot = 1;
        patternreset = 1;
    }
}
if (pattern == 8)
{
    if (timer == 40)
    {
        chosen_window = obj_shootout_controller.windows[1][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 1)))
    {
        chosen_window = obj_shootout_controller.windows[0][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 2)))
    {
        chosen_window = obj_shootout_controller.windows[1][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 3)))
    {
        chosen_window = obj_shootout_controller.windows[2][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 4)))
    {
        chosen_window = obj_shootout_controller.windows[1][2];
        shoot = 1;
        patternreset = 1;
    }
}
if (pattern == 9)
{
    if (timer == 40)
    {
        chosen_window = obj_shootout_controller.windows[0][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 1)))
    {
        chosen_window = obj_shootout_controller.windows[2][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 2)))
    {
        chosen_window = obj_shootout_controller.windows[1][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 3)))
    {
        chosen_window = obj_shootout_controller.windows[0][2];
        shoot = 1;
    }
    if (timer == (40 + (a * 4)))
    {
        chosen_window = obj_shootout_controller.windows[2][2];
        shoot = 1;
        patternreset = 1;
    }
}
if (pattern == 10)
{
    if (timer == 40)
    {
        chosen_window = obj_shootout_controller.windows[0][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 1)))
    {
        chosen_window = obj_shootout_controller.windows[1][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 2)))
    {
        chosen_window = obj_shootout_controller.windows[2][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 3)))
    {
        chosen_window = obj_shootout_controller.windows[0][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 4)))
    {
        chosen_window = obj_shootout_controller.windows[1][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 5)))
    {
        chosen_window = obj_shootout_controller.windows[2][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 6)))
    {
        chosen_window = obj_shootout_controller.windows[0][2];
        shoot = 1;
    }
    if (timer == (40 + (a * 7)))
    {
        chosen_window = obj_shootout_controller.windows[1][2];
        shoot = 1;
    }
    if (timer == (40 + (a * 8)))
    {
        chosen_window = obj_shootout_controller.windows[2][2];
        shoot = 1;
        patternreset = 1;
    }
}
if (pattern == 11)
{
    if (timer == 40)
    {
        chosen_window = obj_shootout_controller.windows[2][2];
        shoot = 1;
    }
    if (timer == (40 + (a * 1)))
    {
        chosen_window = obj_shootout_controller.windows[1][2];
        shoot = 1;
    }
    if (timer == (40 + (a * 2)))
    {
        chosen_window = obj_shootout_controller.windows[0][2];
        shoot = 1;
    }
    if (timer == (40 + (a * 3)))
    {
        chosen_window = obj_shootout_controller.windows[2][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 4)))
    {
        chosen_window = obj_shootout_controller.windows[1][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 5)))
    {
        chosen_window = obj_shootout_controller.windows[0][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 6)))
    {
        chosen_window = obj_shootout_controller.windows[2][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 7)))
    {
        chosen_window = obj_shootout_controller.windows[1][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 8)))
    {
        chosen_window = obj_shootout_controller.windows[0][0];
        shoot = 1;
        patternreset = 1;
    }
}
if (pattern == 12)
{
    if (timer == 40)
    {
        chosen_window = obj_shootout_controller.windows[2][2];
        shoot = 1;
    }
    if (timer == (40 + (a * 1)))
    {
        chosen_window = obj_shootout_controller.windows[1][2];
        shoot = 1;
    }
    if (timer == (40 + (a * 2)))
    {
        chosen_window = obj_shootout_controller.windows[0][2];
        shoot = 1;
    }
    if (timer == (40 + (a * 3)))
    {
        chosen_window = obj_shootout_controller.windows[2][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 4)))
    {
        chosen_window = obj_shootout_controller.windows[1][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 5)))
    {
        chosen_window = obj_shootout_controller.windows[0][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 6)))
    {
        chosen_window = obj_shootout_controller.windows[2][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 7)))
    {
        chosen_window = obj_shootout_controller.windows[1][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 8)))
    {
        chosen_window = obj_shootout_controller.windows[0][0];
        shoot = 1;
        patternreset = 1;
    }
}
if (pattern == 13)
{
    if (timer == 40)
    {
        chosen_window = obj_shootout_controller.windows[2][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 1)))
    {
        chosen_window = obj_shootout_controller.windows[2][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 2)))
    {
        chosen_window = obj_shootout_controller.windows[2][2];
        shoot = 1;
    }
    if (timer == (40 + (a * 3)))
    {
        chosen_window = obj_shootout_controller.windows[0][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 4)))
    {
        chosen_window = obj_shootout_controller.windows[0][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 5)))
    {
        chosen_window = obj_shootout_controller.windows[0][2];
        shoot = 1;
    }
    if (timer == (40 + (a * 6)))
    {
        chosen_window = obj_shootout_controller.windows[1][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 7)))
    {
        chosen_window = obj_shootout_controller.windows[1][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 8)))
    {
        chosen_window = obj_shootout_controller.windows[1][2];
        shoot = 1;
        patternreset = 1;
    }
}
if (pattern == 14)
{
    if (timer == 40)
    {
        chosen_window = obj_shootout_controller.windows[0][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 1)))
    {
        chosen_window = obj_shootout_controller.windows[1][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 2)))
    {
        chosen_window = obj_shootout_controller.windows[2][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 3)))
    {
        chosen_window = obj_shootout_controller.windows[0][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 4)))
    {
        chosen_window = obj_shootout_controller.windows[1][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 5)))
    {
        chosen_window = obj_shootout_controller.windows[2][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 6)))
    {
        chosen_window = obj_shootout_controller.windows[0][2];
        shoot = 1;
    }
    if (timer == (40 + (a * 7)))
    {
        chosen_window = obj_shootout_controller.windows[1][2];
        shoot = 1;
    }
    if (timer == (40 + (a * 8)))
    {
        chosen_window = obj_shootout_controller.windows[2][2];
        shoot = 1;
        patternreset = 1;
    }
}
if (pattern == 15)
{
    if (timer == 40)
    {
        chosen_window = obj_shootout_controller.windows[0][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 1)))
    {
        chosen_window = obj_shootout_controller.windows[1][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 2)))
    {
        chosen_window = obj_shootout_controller.windows[2][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 3)))
    {
        chosen_window = obj_shootout_controller.windows[0][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 4)))
    {
        chosen_window = obj_shootout_controller.windows[1][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 5)))
    {
        chosen_window = obj_shootout_controller.windows[2][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 6)))
    {
        chosen_window = obj_shootout_controller.windows[0][2];
        shoot = 1;
    }
    if (timer == (40 + (a * 7)))
    {
        chosen_window = obj_shootout_controller.windows[1][2];
        shoot = 1;
    }
    if (timer == (40 + (a * 8)))
    {
        chosen_window = obj_shootout_controller.windows[2][2];
        shoot = 1;
        patternreset = 1;
    }
}
if (pattern == 16)
{
    if (timer == 40)
    {
        chosen_window = obj_shootout_controller.windows[0][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 1)))
    {
        chosen_window = obj_shootout_controller.windows[1][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 2)))
    {
        chosen_window = obj_shootout_controller.windows[2][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 3)))
    {
        chosen_window = obj_shootout_controller.windows[0][2];
        shoot = 1;
    }
    if (timer == (40 + (a * 4)))
    {
        chosen_window = obj_shootout_controller.windows[1][2];
        shoot = 1;
    }
    if (timer == (40 + (a * 5)))
    {
        chosen_window = obj_shootout_controller.windows[2][2];
        shoot = 1;
    }
    if (timer == (40 + (a * 6)))
    {
        chosen_window = obj_shootout_controller.windows[0][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 7)))
    {
        chosen_window = obj_shootout_controller.windows[1][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 8)))
    {
        chosen_window = obj_shootout_controller.windows[2][1];
        shoot = 1;
        patternreset = 1;
    }
}
if (pattern == 17)
{
    if (timer == 40)
    {
        chosen_window = obj_shootout_controller.windows[1][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 1)))
    {
        chosen_window = obj_shootout_controller.windows[2][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 2)))
    {
        chosen_window = obj_shootout_controller.windows[2][2];
        shoot = 1;
    }
    if (timer == (40 + (a * 3)))
    {
        chosen_window = obj_shootout_controller.windows[1][2];
        shoot = 1;
    }
    if (timer == (40 + (a * 4)))
    {
        chosen_window = obj_shootout_controller.windows[0][2];
        shoot = 1;
    }
    if (timer == (40 + (a * 5)))
    {
        chosen_window = obj_shootout_controller.windows[0][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 6)))
    {
        chosen_window = obj_shootout_controller.windows[0][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 7)))
    {
        chosen_window = obj_shootout_controller.windows[1][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 8)))
    {
        chosen_window = obj_shootout_controller.windows[2][0];
        shoot = 1;
        patternreset = 1;
    }
}
if (pattern == 18)
{
    if (timer == 40)
    {
        chosen_window = obj_shootout_controller.windows[2][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 1)))
    {
        chosen_window = obj_shootout_controller.windows[1][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 2)))
    {
        chosen_window = obj_shootout_controller.windows[0][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 3)))
    {
        chosen_window = obj_shootout_controller.windows[0][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 4)))
    {
        chosen_window = obj_shootout_controller.windows[0][2];
        shoot = 1;
    }
    if (timer == (40 + (a * 5)))
    {
        chosen_window = obj_shootout_controller.windows[1][2];
        shoot = 1;
    }
    if (timer == (40 + (a * 6)))
    {
        chosen_window = obj_shootout_controller.windows[2][2];
        shoot = 1;
    }
    if (timer == (40 + (a * 7)))
    {
        chosen_window = obj_shootout_controller.windows[2][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 8)))
    {
        chosen_window = obj_shootout_controller.windows[1][1];
        shoot = 1;
        patternreset = 1;
    }
}
if (pattern == 19)
{
    if (timer == 40)
    {
        chosen_window = obj_shootout_controller.windows[1][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 1)))
    {
        chosen_window = obj_shootout_controller.windows[0][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 2)))
    {
        chosen_window = obj_shootout_controller.windows[0][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 3)))
    {
        chosen_window = obj_shootout_controller.windows[1][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 4)))
    {
        chosen_window = obj_shootout_controller.windows[2][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 5)))
    {
        chosen_window = obj_shootout_controller.windows[2][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 6)))
    {
        chosen_window = obj_shootout_controller.windows[2][2];
        shoot = 1;
    }
    if (timer == (40 + (a * 7)))
    {
        chosen_window = obj_shootout_controller.windows[1][2];
        shoot = 1;
    }
    if (timer == (40 + (a * 8)))
    {
        chosen_window = obj_shootout_controller.windows[0][2];
        shoot = 1;
        patternreset = 1;
    }
}
if (pattern == 20)
{
    if (timer == 40)
    {
        chosen_window = obj_shootout_controller.windows[0][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 1)))
    {
        chosen_window = obj_shootout_controller.windows[1][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 2)))
    {
        chosen_window = obj_shootout_controller.windows[2][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 3)))
    {
        chosen_window = obj_shootout_controller.windows[0][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 4)))
    {
        chosen_window = obj_shootout_controller.windows[1][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 5)))
    {
        chosen_window = obj_shootout_controller.windows[2][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 6)))
    {
        chosen_window = obj_shootout_controller.windows[0][2];
        shoot = 1;
    }
    if (timer == (40 + (a * 7)))
    {
        chosen_window = obj_shootout_controller.windows[1][2];
        shoot = 1;
    }
    if (timer == (40 + (a * 8)))
    {
        chosen_window = obj_shootout_controller.windows[2][2];
        shoot = 1;
        patternreset = 1;
    }
}
if (pattern == 21)
{
    if (timer == 40)
    {
        chosen_window = obj_shootout_controller.windows[0][2];
        shoot = 1;
    }
    if (timer == (40 + (a * 1)))
    {
        chosen_window = obj_shootout_controller.windows[1][2];
        shoot = 1;
    }
    if (timer == (40 + (a * 2)))
    {
        chosen_window = obj_shootout_controller.windows[2][2];
        shoot = 1;
    }
    if (timer == (40 + (a * 3)))
    {
        chosen_window = obj_shootout_controller.windows[0][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 4)))
    {
        chosen_window = obj_shootout_controller.windows[1][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 5)))
    {
        chosen_window = obj_shootout_controller.windows[2][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 6)))
    {
        chosen_window = obj_shootout_controller.windows[0][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 7)))
    {
        chosen_window = obj_shootout_controller.windows[1][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 8)))
    {
        chosen_window = obj_shootout_controller.windows[2][1];
        shoot = 1;
        patternreset = 1;
    }
}
if (pattern == -2)
{
    a = 1;
    if (timer == 39)
        con = irandom(8);
    if (timer == 40 && con != 0)
    {
        chosen_window = obj_shootout_controller.windows[2][2];
        shoot = 1;
    }
    if (timer == (40 + (a * 1)) && con != 1)
    {
        chosen_window = obj_shootout_controller.windows[1][2];
        shoot = 1;
    }
    if (timer == (40 + (a * 2)) && con != 2)
    {
        chosen_window = obj_shootout_controller.windows[0][2];
        shoot = 1;
    }
    if (timer == (40 + (a * 3)) && con != 3)
    {
        chosen_window = obj_shootout_controller.windows[2][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 4)) && con != 4)
    {
        chosen_window = obj_shootout_controller.windows[1][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 5)) && con != 5)
    {
        chosen_window = obj_shootout_controller.windows[0][1];
        shoot = 1;
    }
    if (timer == (40 + (a * 6)) && con != 6)
    {
        chosen_window = obj_shootout_controller.windows[2][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 7)) && con != 7)
    {
        chosen_window = obj_shootout_controller.windows[1][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 8)) && con != 8)
    {
        chosen_window = obj_shootout_controller.windows[0][0];
        shoot = 1;
    }
    if (timer == (40 + (a * 8)))
        patternreset = 1;
}
if (i_ex(obj_tenna_minigame_ui) && obj_tenna_minigame_ui.timer > 190)
    difficulty = 1;
if (i_ex(obj_tenna_minigame_ui) && obj_tenna_minigame_ui.timer > 220)
{
}
else if (patternreset == 1)
{
    timer = 16;
    if (difficulty == 0)
    {
        pattern = irandom(9);
        if (patternprev == pattern)
        {
            pattern++;
            if (pattern > 9)
                pattern = 0;
        }
    }
    if (difficulty == 1)
    {
        timer = 16;
        pattern = irandom(9);
        if (patternprev == pattern)
        {
            pattern++;
            if (pattern > 9)
                pattern = 0;
        }
        con++;
        if (con == 4)
            difficulty = 2;
    }
    if (difficulty == 2)
    {
        pattern = choose(13, 14, 15, 16, 17, 18, 19, 20, 21);
        if (patternprev == pattern)
        {
            pattern++;
            if (pattern > 21)
                pattern = 13;
        }
        timer = 16;
        con++;
        if (con == 6)
        {
            difficulty = 1;
            con = 2;
        }
    }
    patternprev = pattern;
}
if (shoot == 1)
{
    reticle = instance_create_depth(chosen_window.x, chosen_window.y, depth + 1, obj_shootout_tenna_reticle);
    reticle.window = chosen_window;
    if (difficulty == 1)
        reticle.duration = 18;
    if (difficulty == 2)
        reticle.duration = 18;
}
with (obj_tenna_enemy_minigametext)
    depth = obj_shootout_big_tenna.depth - 10;
siner++;
if (!i_ex(obj_shakeobj))
    x = camerax() + 20;
y = ystart + (sin(siner / 6) * 3);
if (firefx > 0)
{
    draw_sprite_ext(spr_tenna_shooutout2, 0, x + 260, y + 150, 2, 2, image_angle, c_white, 0.8);
    firefx--;
}
draw_self();
