preset = 0;
shoulders = 4525;
legs = 4005;
chest = 3079;
head = 2590;
leftarm = 3840;
lefthand = 1331;
shouldersx = x + 40;
shouldersy = y + 56;
shoulderflameindex += 0.125;
legsx = x + 42;
legsy = y + 122;
chestx = x + 40;
chesty = y + 76;
headx = x + 48;
heady = y + 50;
leftarmx = x + 34;
leftarmy = y + 58;
animsiner++;
if (preset == 0)
{
    var boby = abs(sin(animsiner / 6) * -2) * -1;
    chesty += (boby * 1.5);
    shouldersy += (boby * 1.5);
    leftarmy += (-8 + (boby * 6));
    heady += (boby * 0.5);
}
lefthandx = leftarmx - 24;
lefthandy = leftarmy + 12;
if (!keyboard_check(ord("H")))
{
    draw_sprite_ext(leftarm, 0, leftarmx, leftarmy, 2, 2, 0, image_blend, image_alpha);
    draw_sprite_ext(legs, 0, legsx, legsy, 2, 2, 0, image_blend, image_alpha);
    draw_sprite_ext(chest, 0, chestx, chesty, 2, 2, 0, image_blend, image_alpha);
    draw_sprite_ext(shoulders, shoulderflameindex, shouldersx, shouldersy, 2, 2, 0, image_blend, image_alpha);
    draw_sprite_ext(head, 0, headx, heady, 2, 2, 0, image_blend, image_alpha);
    draw_sprite_ext(lefthand, 0, lefthandx, lefthandy, 2, 2, 0, image_blend, image_alpha);
}
