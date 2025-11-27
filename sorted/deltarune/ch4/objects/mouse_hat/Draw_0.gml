draw_sprite_ext(sprite_index, image_index, x + xoff + ((1 - scale) * 20), y + yoff + ((1 - scale) * 20), image_xscale * scale, image_yscale * scale, 0, c_white, 1);
var off = sprite_height * 0.25;
for (var i = 0; i < array_length(spritestack); i++)
{
    draw_sprite_ext(spritestack[i], indexstack[i], x + xoff + ((1 - scale) * 20), (y + yoff + ((1 - scale) * 20)) - off, image_xscale * scale, image_yscale * scale, 0, c_white, 1);
    off += (sprite_get_height(spritestack[i]) * image_yscale * 0.25);
}
