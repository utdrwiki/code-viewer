var finalxoff = (xoff % spritewidth) / 2;
var finalyoff = (yoff % spriteheight) / 2;
draw_sprite_part_ext(windowbg, 0, finalxoff, finalyoff, 29, 49, x + (2 * image_xscale), y + (23 * image_yscale), image_xscale, image_yscale, c_white, 1);
draw_sprite_part_ext(windowbg, 0, finalxoff + spritewidth, finalyoff, 29, 49, x + (2 * image_xscale), y + (23 * image_yscale), image_xscale, image_yscale, c_white, 1);
draw_sprite_part_ext(windowbg, 0, finalxoff + spritewidth, finalyoff + spriteheight, 29, 49, x + (2 * image_xscale), y + (23 * image_yscale), image_xscale, image_yscale, c_white, 1);
draw_sprite_part_ext(windowbg, 0, finalxoff, finalyoff + spriteheight, 29, 49, x + (2 * image_xscale), y + (23 * image_yscale), image_xscale, image_yscale, c_white, 1);
draw_self();
