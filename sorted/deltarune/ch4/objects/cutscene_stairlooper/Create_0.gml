loop = 1;
enteredloop = 0;
dialogue_finish = true;
legend_finish = true;
xgobackamount = -120;
ygobackamount = 120;
type = 0;
xpoint = 560;
ypoint = 0;
parallel_cutscene = true;
cutscene_object = -4;
if (room == room_dw_church_intro3)
{
    xpoint = 640;
    cutscene_object = 681;
}
if (room == room_dw_church_intro_guei)
{
    xpoint = 1800;
    xgobackamount = -80;
    ygobackamount = 0;
    parallel_cutscene = false;
}
if (room == room_dw_church_stairs_topleft)
{
    xpoint = 580;
    ygobackamount = -120;
}
if (room == room_dw_church_stairs_topright)
    xpoint = 1520;
if (room == room_dw_church_stairs_west_bell)
    xpoint = 720;
if (room == room_dw_church_fountainconnection)
    xpoint = 720;
if (room == room_dw_church_lantern_hallway)
{
    type = 1;
    ypoint = 600;
    xgobackamount = 0;
    ygobackamount = -120;
}
con = 0;
preventmenu = 0;
