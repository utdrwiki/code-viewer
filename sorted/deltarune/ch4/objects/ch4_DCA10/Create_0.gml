con = -1;
customcon = 0;
if (global.plot >= 185 && global.plot < 190)
{
    con = 0;
    paper_marker = scr_dark_marker(518, 810, spr_gerson_paper_floor);
    with (paper_marker)
        depth = 91260;
    paper_marker.visible = 0;
}
else
{
    instance_destroy();
}
