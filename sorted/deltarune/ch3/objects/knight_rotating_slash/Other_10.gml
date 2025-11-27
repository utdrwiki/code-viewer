if (difficulty == 1)
{
    slash_offset = 6;
    slash_number = 3;
    slash_array[0] = 2;
    slash_array[1] = 3;
    slash_array[2] = 4;
    slash_array[3] = 4;
    slash_array[4] = 4;
    slash_array[5] = 4;
}
if (difficulty == 2)
{
    slash_offset = 0;
    slash_number = 3;
    slash_array[0] = 3;
    slash_array[1] = 4;
    slash_array[2] = 4;
    slash_array[3] = 4;
    slash_array[4] = 4;
    slash_array[5] = 4;
}
if (turn_type == "full")
    local_turntimer = 400;
if (turn_type == "start")
    local_turntimer = 320;
if (turn_type == "end")
{
    local_turntimer = 300;
    timer = 15;
}
if (turn_type == "short start")
{
    local_turntimer = 270;
    timer = 12;
    turn_limit_4 = 250;
}
if (turn_type == "short mid")
{
    local_turntimer = 260;
    timer = 15;
    turn_limit_4 = 250;
}
if (turn_type == "short end")
{
    local_turntimer = 260;
    timer = 15;
}
