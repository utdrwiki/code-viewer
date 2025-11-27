if (view_current == 0)
{
    if (active)
    {
        siner++;
        var drawstart = 0;
        var drawmidleft = 0;
        var drawmidright = 0;
        var drawend = 0;
        if (hintno == 0)
            drawstart = 1;
        if (hintno == 1 && hintslots == 3)
            drawmidleft = 1;
        if (hintno == 2 && hintslots == 3)
            drawmidright = 1;
        if (hintno == hintslots)
        {
            drawmidleft = 0;
            drawmidright = 0;
            drawend = 1;
        }
        var count = string_length(hint);
        var drawspace = 8;
        var spwid = 22;
        var width = (count - 1) * (drawspace + spwid);
        for (var i = 0; i < count; i++)
        {
            var sprangle = 0;
            var scale = 2;
            var spr = 2663;
            var num = real(string_char_at(hint, i + 1));
            var xloc = (x - (width / 2)) + ((spwid + drawspace) * i);
            var yloc = y + (sin((siner + (i * 4)) / 8) * 4);
            var col = merge_color(hintcol, c_white, clamp(0.5 + (sin((siner - (i * 30)) / 15) * 0.25), 0, 1));
            if (num != 0)
            {
                sprangle = (num * 45) - 180 - 45;
            }
            else
            {
                spr = 4059;
                scale = 2;
            }
            draw_sprite_ext(spr, 0, xloc, yloc, scale, scale, sprangle, col, alpha);
            if (i == 0 && drawstart)
                draw_sprite_ext(spr_church_musicstaff, 0, xloc - 40, (y + (sin((siner + ((i - 1) * 4)) / 8) * 4)) - 28, 2, 2, 0, col, alpha);
            if (i == (count - 1) && drawend)
                draw_sprite_ext(spr_church_musicstaff, 1, (xloc + 40) - 22, (y + (sin((siner + ((i + 1) * 4)) / 8) * 4)) - 28, 2, 2, 0, col, alpha);
            if (drawmidleft && i == (count - 1))
                draw_sprite_ext(spr_church_piano_slurmid, 0, xloc + 20, (y + (sin((siner + (i * 4) + 4) / 8) * 4)) - 26, 2, 2, 0, col, alpha);
            if (drawmidright && i == 0)
                draw_sprite_ext(spr_church_piano_slurmid, 0, (xloc + 20) - spwid - drawspace - 6, (y + (sin((siner + (i * 4) + 4) / 8) * 4)) - 26, -2, 2, 0, col, alpha);
        }
    }
}
