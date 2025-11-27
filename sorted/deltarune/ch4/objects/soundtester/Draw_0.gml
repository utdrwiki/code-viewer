draw_set_color(c_white);
draw_set_font(fnt_mainbig);
var xpos = 24;
var ypos = 180;
var space = 28;
i = current - 10;
while (i < (current + 10))
{
    if (i < soundtotal && i > 0)
    {
        draw_set_halign(fa_right);
        if (i == current)
        {
            draw_sprite(spr_heart, 0, xpos - 20, ypos + ((i - current) * space) + 8);
            draw_set_color(c_yellow);
        }
        draw_set_font(fnt_main);
        draw_text((xpos + 40) - 5, ypos + ((i - current) * space) + 7, "#" + string(i));
        draw_set_font(fnt_small);
        draw_text((xpos + 40) - 5, ypos + ((i - current) * space) + 21, "id: " + string(asset_get_index(soundName[i])));
        draw_set_font(fnt_mainbig);
        draw_set_halign(fa_left);
        draw_text(xpos + 40, ypos + ((i - current) * space), soundName[i]);
        draw_set_color(c_white);
    }
    i++;
}
xpos = 480;
ypos = 300;
space = 16;
var counter = 0;
draw_sprite_ext(spr_pxwhite, 0, xpos, 0, 320, 480, 0, c_black, 0.8);
draw_set_font(fnt_main);
draw_text(xpos + 8, ypos + (space * counter), "Z:Play");
counter++;
draw_text(xpos + 8, ypos + (space * counter), "Arrows:Move");
counter++;
draw_text(xpos + 8, ypos + (space * counter), "M:Mute");
counter++;
draw_text(xpos + 8, ypos + (space * counter), "J:Jump to sound");
counter++;
draw_text(xpos + 8, ypos + (space * counter), "D:Dump sound list");
counter++;
draw_text(xpos + 8, ypos + (space * counter), "PgUp:Top");
counter++;
draw_text(xpos + 8, ypos + (space * counter), "PgDown:End");
counter++;
draw_text(xpos + 8, ypos + (space * counter), "A:Auto (" + string(auto) + ")");
counter++;
draw_text(xpos + 8, ypos + (space * counter), "Y / U: Change Pitch");
counter++;
draw_text(xpos + 8, ypos + (space * counter), "Pitch=" + string(pitch));
counter++;
