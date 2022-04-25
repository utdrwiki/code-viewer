if (dar == 1)
    scr_84_set_draw_font_ch1("main")
else
    scr_84_set_draw_font_ch1("mainbig")
textx = xx
texty = yy
for (i = 0; i < (choicetotal + 1); i += 1)
{
    draw_set_color(c_white)
    if (mychoice == i)
        draw_set_color(c_yellow)
    textx = textposx[i]
    texty = textposy[i]
    if (candraw == true)
        draw_text(textx, texty, string_hash_to_newline(global.choicemsg[i]))
}
if (global.lang == "ja")
{
    if (candraw == false && choicetotal == 2 && mychoice == -1)
        hy += (20 * dar)
}
candraw = true
draw_sprite_ext(spr_heartsmall_ch1, 0, hx, hy, image_xscale, image_yscale, 0, c_white, 1)
