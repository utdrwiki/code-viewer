timer++;
var fistmod = round(abs(sin(timer / 8) * 20) / 2) * 2;
tilerate = 8;
if ((timer % tilerate) == 0)
{
    for (var i = 0; i < tilenum; i++)
        tilecolor[i] = palcolor[choose(0, 0, 0, 1, 1)];
}
if ((timer % 4) == 0)
    tileindex++;
if (tileindex > tilenum)
    tileindex = 0;
draw_sprite_ext(spr_castle_dojo_fist, 1, x + 186 + fistmod, y + 42, 2, 2, 0, c_white, 1);
draw_sprite_ext(spr_castle_dojo_base, 0, x, y, 2, 2, 0, c_white, 1);
for (var i = 0; i < tilenum; i++)
{
    draw_sprite_ext(spr_castle_dojo_discoball, i, x + 2, y + 2, 2, 2, 0, tilecolor[i], 1);
    if (i == tileindex)
        draw_sprite_ext(spr_castle_dojo_discoball, i, x + 2, y + 2, 2, 2, 0, c_white, 1);
}
draw_sprite_ext(spr_castle_dojo_fist, 0, x + 186 + fistmod, y + 42, 2, 2, 0, c_white, 1);
image_blend = c_red;
