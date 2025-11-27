preset = 0;
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
if (pose == -1)
{
    leftarmx = x + 54;
    leftarmy = y + 64;
}
if (preset == 0)
{
    var boby = abs(sin(animsiner / 6) * -2) * -1;
    if (pose == 3)
    {
        chesty += (boby * 0.5);
        shouldersy += (boby * 0.5);
    }
    else
    {
        chesty += (boby * 1.5);
        shouldersy += (boby * 1.5);
    }
    leftarmy += (-7 + (boby * 4));
    heady += (boby * 0.5);
}
lefthandx = leftarmx - 24;
lefthandy = leftarmy + 12;
if (pose == -1)
{
    lefthandx = leftarmx + 24;
    lefthandy = leftarmy + 12;
}
if (state == 0)
{
    fsiner += 1;
    if (talking == false)
        talkingframe = 0;
    if (talking == true)
        talkingframe += 0.16666666666666666;
    if (pose == 0)
    {
        draw_sprite_ext(leftarm, 0, leftarmx, leftarmy, 2, 2, 0, image_blend, image_alpha);
        draw_sprite_ext(legs, 0, legsx, legsy, 2, 2, 0, image_blend, image_alpha);
        draw_sprite_ext(chest, chestindex, chestx, chesty, 2, 2, 0, image_blend, image_alpha);
        draw_sprite_ext(shoulders, shoulderflameindex, shouldersx, shouldersy, 2, 2, 0, image_blend, image_alpha);
        draw_sprite_ext(head, talkingframe, headx, heady, 2, 2, 0, image_blend, image_alpha);
        draw_sprite_ext(lefthand, 0, lefthandx, lefthandy, 2, 2, 0, image_blend, image_alpha);
        if (flash == 1)
        {
            draw_sprite_ext_flash(leftarm, 0, leftarmx, leftarmy, 2, 2, 0, flashcolor, (-cos(fsiner / 5) * 0.4) + 0.6);
            draw_sprite_ext_flash(legs, 0, legsx, legsy, 2, 2, 0, flashcolor, (-cos(fsiner / 5) * 0.4) + 0.6);
            draw_sprite_ext_flash(chest, chestindex, chestx, chesty, 2, 2, 0, flashcolor, (-cos(fsiner / 5) * 0.4) + 0.6);
            draw_sprite_ext_flash(shoulders, shoulderflameindex, shouldersx, shouldersy, 2, 2, 0, flashcolor, (-cos(fsiner / 5) * 0.4) + 0.6);
            draw_sprite_ext_flash(head, talkingframe, headx, heady, 2, 2, 0, flashcolor, (-cos(fsiner / 5) * 0.4) + 0.6);
            draw_sprite_ext_flash(lefthand, 0, lefthandx, lefthandy, 2, 2, 0, flashcolor, (-cos(fsiner / 5) * 0.4) + 0.6);
        }
    }
    if (pose == -1)
    {
        draw_sprite_ext(leftarm, 0, leftarmx, leftarmy, -2, 2, 0, image_blend, image_alpha);
        draw_sprite_ext(legs, 0, legsx, legsy, -2, 2, 0, image_blend, image_alpha);
        draw_sprite_ext(chest, chestindex, chestx, chesty, -2, 2, 0, image_blend, image_alpha);
        draw_sprite_ext(shoulders, shoulderflameindex, shouldersx, shouldersy, -2, 2, 0, image_blend, image_alpha);
        draw_sprite_ext(head, talkingframe, headx - 16, heady, -2, 2, 0, image_blend, image_alpha);
        draw_sprite_ext(lefthand, 0, lefthandx, lefthandy, -2, 2, 0, image_blend, image_alpha);
    }
    if (pose == 1)
    {
        if (poseindex >= 2)
            poseindex = 0;
        if (poseindex < 1.5)
            poseindex += 0.25;
        draw_sprite_ext(head, talkingframe, headx - 8, heady + 13, 2, 2, 0, image_blend, image_alpha);
        draw_sprite_ext(spr_lanino_cool2, poseindex, legsx, legsy, 2, 2, 0, image_blend, image_alpha);
    }
    if (pose == 2)
    {
        if (poseindex < 2)
            poseindex = 2;
        if (poseindex < 3)
            poseindex += 0.25;
        draw_sprite_ext(head, talkingframe, headx - 8, heady + 13, 2, 2, 0, image_blend, image_alpha);
        draw_sprite_ext(spr_lanino_cool2, poseindex, legsx, legsy, 2, 2, 0, image_blend, image_alpha);
    }
    if (pose == 3)
    {
        draw_sprite_ext(leftarm, 0, leftarmx, leftarmy, 2, 2, 0, image_blend, image_alpha);
        draw_sprite_ext(legs, 0, legsx, legsy, 2, 2, 0, image_blend, image_alpha);
        draw_sprite_ext(chest, chestindex, chestx, chesty, 2, 2, 0, image_blend, image_alpha);
        draw_sprite_ext(shoulders, shoulderflameindex, shouldersx, shouldersy, 2, 2, 0, image_blend, image_alpha);
        draw_sprite_ext(head, talkingframe, headx, heady, 2, 2, 0, image_blend, image_alpha);
        draw_sprite_ext(lefthand, 0, lefthandx, lefthandy, 2, 2, 0, image_blend, image_alpha);
        draw_sprite_ext(spr_enemy_lanino_removeglasses_front, chestindex, chestx, chesty, 2, 2, 0, image_blend, image_alpha);
    }
}
if (state == 3 && hurttimer >= 0)
    draw_sprite_ext(hurtsprite, 0, x + shakex + hurtspriteoffx, y + hurtspriteoffy, 2, 2, 0, image_blend, 1);
if (becomeflash == 0)
{
    flash = 0;
}
else
{
    becomeflash--;
    flash = 1;
}
