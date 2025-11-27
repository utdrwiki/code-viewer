var face = spr_jackenpumpkinlaugh_nomouth;
var mouth = 1809;
var animindex = 0;
idealmouthscale = 2 + (imgindex * 1.5);
mouthscale = lerp(mouthscale, idealmouthscale, 0.5);
idealwidth = 2 - (imgindex * 0.2);
image_yscale = lerp(image_yscale, idealwidth, 0.6);
myangle = 0 + ((idealwidth - 2) * 8);
drawy = lerp(y, y + ((2 - image_yscale) * 20), 0.6);
if (mouthscale > 2.5)
    animindex = 1;
draw_sprite_ext(face, animindex, x, drawy, image_xscale, image_yscale, myangle, c_white, 1);
draw_sprite_ext(mouth, 0, x, drawy + 40, 2, mouthscale, mouthangle, c_white, 1);
