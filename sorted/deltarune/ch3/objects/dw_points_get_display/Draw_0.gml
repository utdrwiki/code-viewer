timer++;
if (timer >= 30)
    instance_destroy();
if (amount <= 0)
    exit;
draw_set_color(c_white);
var gridx = round(x / 2) * 2;
var gridy = round(y / 2) * 2;
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var signer = "+";
draw_set_font(fnt_8bit);
draw_set_color(c_black);
draw_text(gridx - 2, gridy, signer + string(amount));
draw_text(gridx - 2, gridy - 2, signer + string(amount));
draw_text(gridx - 2, gridy + 2, signer + string(amount));
draw_text(gridx + 2, gridy, signer + string(amount));
draw_text(gridx + 2, gridy - 2, signer + string(amount));
draw_text(gridx + 2, gridy + 2, signer + string(amount));
draw_text(gridx, gridy, signer + string(amount));
draw_text(gridx, gridy - 2, signer + string(amount));
draw_text(gridx, gridy + 2, signer + string(amount));
draw_set_color(c_white);
draw_text(gridx, gridy, signer + string(amount));
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
