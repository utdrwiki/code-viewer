if (turn_type == "full")
{
    local_turntimer = 230;
    scr_lerpvar("x", x, camerax() + 415, 20, 2, "out");
    scr_lerpvar("y", y, cameray() + 87, 20, 2, "out");
}
if (turn_type == "start")
{
    local_turntimer = 172;
    spawn_speed = 16;
    scr_lerpvar("x", x, camerax() + 415, 20, 2, "out");
    scr_lerpvar("y", y, cameray() + 87, 20, 2, "out");
}
if (turn_type == "end")
{
    local_turntimer = 160;
    spawn_speed = 12;
    scr_lerpvar("x", x, camerax() + 417, 20, 2, "out");
    scr_lerpvar("y", y, cameray() + 87, 20, 2, "out");
}
if (turn_type == "short start")
{
    local_turntimer = 160;
    spawn_speed = 12;
    scr_lerpvar("x", x, camerax() + 415, 20, 2, "out");
    scr_lerpvar("y", y, cameray() + 87, 20, 2, "out");
}
if (turn_type == "short mid")
{
    local_turntimer = 160;
    spawn_speed = 12;
    scr_lerpvar("x", x, camerax() + 415, 20, 2, "out");
    scr_lerpvar("y", y, cameray() + 87, 20, 2, "out");
}
if (turn_type == "short end")
{
    local_turntimer = 160;
    spawn_speed = 10;
}
