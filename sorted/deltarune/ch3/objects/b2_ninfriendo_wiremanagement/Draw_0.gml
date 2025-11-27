var cablecolor = #230A16;
if (i_ex(cont[1]) && i_ex(favored))
{
    var xpos = favored.x + xoff[1] + 4;
    if (stick[1] == false)
    {
        if (ver == 0)
            xpos = 584;
        else
            xpos = 500;
    }
    var ypos = favored.y + yoff[1] + 20;
    var ylength = abs(376 - ypos);
    draw_sprite_ext(spr_pxwhite, 0, xpos, ypos, 2, ylength, 0, cablecolor, 1);
    draw_sprite_ext(spr_pxwhite, 0, xpos + 2, 376, 2, 2, 0, cablecolor, 1);
    draw_sprite_ext(spr_pxwhite, 0, xpos + 4, 378, 2, 2, 0, cablecolor, 1);
    for (var i = 0; i < 8; i++)
        draw_sprite_ext(spr_controllerwire_sinwave, 0, xpos + (i * 28) + 4, 378, 2, 2, 0, cablecolor, 1);
}
if (i_ex(cont[2]) && i_ex(rouxls))
{
    var xpos = rouxls.x + xoff[2] + 4;
    var ypos = favored.y + yoff[1] + 20;
    var ylength = abs(376 - ypos);
    for (var i = 0; i < 5; i++)
        draw_sprite_ext(spr_controllerwire_sinwave, 0, xpos + (i * 26) + 4 + 10, 362, 2, 2, 0, cablecolor, 1);
}
cablecolor = #230A16;
if (i_ex(cont[0]) && i_ex(unfavored))
{
    var xpos = unfavored.x + xoff[0] + 4;
    if (stick[0] == false)
    {
        xpos = 492;
        if (ver == 1)
            xpos = 584;
        else
            xpos = 502;
    }
    var ypos = unfavored.y + yoff[0] + 20;
    var ylength = abs(376 - ypos);
    draw_sprite_ext(spr_pxwhite, 0, xpos, ypos, 2, ylength, 0, cablecolor, 1);
    draw_sprite_ext(spr_pxwhite, 0, xpos - 2, 376, 2, 4, 0, cablecolor, 1);
    draw_sprite_ext(spr_pxwhite, 0, xpos - 4, 380, 2, 2, 0, cablecolor, 1);
    draw_sprite_ext(spr_pxwhite, 0, xpos - 4 - 2, 382, 2, 2, 0, cablecolor, 1);
    for (var i = 1; i < 24; i++)
        draw_sprite_ext(spr_controllerwire_sinwave, 0, xpos - (i * 28) - 6, 384, 2, 2, 0, cablecolor, 1);
}
