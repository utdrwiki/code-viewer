draw_set_color(c_white)
draw_set_font(fnt_mainbig)
for (i = (current - 10); i < (current + 10); i++)
{
    if (i < soundtotal && i > 0)
    {
        if (i == current)
            draw_sprite(spr_heart, 0, 20, (200 + ((i - current) * 20)))
        draw_text(40, (190 + ((i - current) * 20)), ((string(i) + " ") + soundName[i]))
    }
}
draw_text(360, 80, "Z:Play\nArrows:Move\nM:Mute\nJ:Jump to sound\nD:Dump sound list\nPgUp:Top\nPgDown:End")
if (auto == 1)
    draw_text(360, 320, "A:Auto (On)")
if (auto == 0)
    draw_text(360, 320, "A:Auto (Off)")
draw_text(360, 340, "Y / U: Change Pitch")
draw_text(360, 360, ("Pitch=" + string(pitch)))
