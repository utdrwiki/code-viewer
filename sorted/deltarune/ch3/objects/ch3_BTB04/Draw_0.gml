if (facestatic)
{
    facestaticindex++;
    draw_sprite_ext(spr_ch3_BTB04_tennafacestatic, facestaticindex, tenna.x - 12, tenna.y - 154, tennafacescale, tennafacescale, 0, c_white, 1 * staticalpha);
    draw_sprite_ext(spr_ch3_BTB04_tennafacestatic, facestaticindex - 0.5, tenna.x - 12, tenna.y - 154, tennafacescale, tennafacescale, 0, c_white, 0.5 * staticalpha);
}
if (tennaface && i_ex(tenna))
    draw_sprite_ext(spr_ch3_BTB04_tennalight, 0, tenna.x - 12, tenna.y - 154, tennafacescale, tennafacescale, 0, c_white, tennafacealpha);
drawstaticregion = true;
if (drawstaticregion)
{
}
draw_set_alpha(whiteoverlayindex);
draw_set_color(c_white);
ossafe_fill_rectangle(camerax() - 20, cameray() - 20, camerax() + 640 + 20, cameray() + 480 + 20, 0);
draw_set_alpha(1);
