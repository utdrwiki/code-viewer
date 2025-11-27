if (difficulty == 0)
{
}
if (difficulty == 1)
{
}
if (difficulty == 2)
{
}
if (difficulty == 3)
{
}
if (turn_type == "full")
{
    local_turntimer = 340;
    x += 200;
    scr_script_delayed(scr_lerpvar, 8, "image_index", 8, 5, 8);
    scr_script_delayed(scr_var, 16, "image_alpha", 0);
}
if (turn_type == "start")
{
    local_turntimer = 200;
    scr_lerpvar("x", x, x + 96, 16, 1, "out");
    scr_script_delayed(scr_var, 16, "image_alpha", 0);
}
if (turn_type == "end")
{
    init_start = 2;
    init = 1;
    snd_play(snd_knight_teleport);
    local_turntimer = 200;
    image_alpha = 0;
    image_index = 5;
}
if (turn_type == "short start")
{
    local_turntimer = 170;
    scr_lerpvar("x", x, x + 96, 16, 1, "out");
    scr_script_delayed(scr_var, 16, "image_alpha", 0);
}
if (turn_type == "short mid")
{
    init_start = 2;
    init = 1;
    snd_play(snd_knight_teleport);
    local_turntimer = 170;
    image_alpha = 0;
    image_index = 5;
}
if (turn_type == "short end")
{
    init_start = 2;
    init = 1;
    snd_play(snd_knight_teleport);
    local_turntimer = 170;
    image_alpha = 0;
    image_index = 5;
}
