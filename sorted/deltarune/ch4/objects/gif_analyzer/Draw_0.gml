draw_set_color(c_red);
draw_set_font(fnt_mainbig);
if (sprite_exists(mygif))
{
    sprite_index = mygif;
    draw_self();
    timer++;
    if (sunkus_kb_check(37))
        image_index -= 1;
    if (sunkus_kb_check(39))
        image_index += 1;
    if (sunkus_kb_check_pressed(38))
        image_index++;
    if (sunkus_kb_check_pressed(40))
        image_index++;
}
else
{
    draw_text(20, cameray() + 460, "GIF not found.");
}
