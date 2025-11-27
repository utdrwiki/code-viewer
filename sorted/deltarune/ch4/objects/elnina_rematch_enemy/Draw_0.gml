if (state == 3 && hurttimer >= 0)
    draw_sprite_ext(spr_elnina_hurt2, 0, x + shakex, y - 7, 2, 2, 0, c_white, 1);
preset = 0;
hairx = x + 42;
hairy = y + 50;
waistx = x + 42;
waisty = y + 112;
rightarmx = x + 46;
rightarmy = y + 58;
headx = x + 44;
heady = y + 62;
leftarmx = x + 36;
leftarmy = y + 60;
skirtx = x + 42;
skirty = y + 70;
animsiner++;
laughtimer--;
if (laughtimer == 0)
{
    talking = 0;
    head = 1066;
}
if (preset == 0)
{
    hairx += (sin(animsiner / 12) * 2);
    var boby = abs(sin(animsiner / 6) * -2) * -1;
    hairy += (boby * 1.5);
    heady += boby;
    leftarmy += (boby * 4);
    if (pose == 3)
        rightarmy += boby;
    else
        rightarmy += (boby * 1.5);
    skirty += boby;
}
lefthandx = leftarmx - 24;
lefthandy = leftarmy + 4;
if (state == 0)
{
    fsiner += 1;
    if (talking == false)
        talkingframe = 0;
    if (talking == true)
        talkingframe += 0.16666666666666666;
    if (pose == 0)
    {
        draw_sprite_ext(hairtufts, 0, hairx, hairy, 2, 2, 0, image_blend, 1);
        draw_sprite_ext(leftarm, 0, leftarmx, leftarmy, 2, 2, 0, image_blend, 1);
        draw_sprite_ext(waist, 0, waistx, waisty, 2, 2, 0, image_blend, 1);
        draw_sprite_ext(skirt, 0, skirtx, skirty, 2, 2, 0, image_blend, 1);
        draw_sprite_ext(rightarm, rightarmindex, rightarmx, rightarmy, 2, 2, 0, image_blend, 1);
        draw_sprite_ext(head, talkingframe, headx, heady, 2, 2, 0, image_blend, 1);
        draw_sprite_ext(lefthand, 0, lefthandx, lefthandy, 2, 2, 0, image_blend, 1);
        if (flash == 1)
        {
            draw_sprite_ext_flash(hairtufts, 0, hairx, hairy, 2, 2, 0, flashcolor, (-cos(fsiner / 5) * 0.4) + 0.6);
            draw_sprite_ext_flash(leftarm, 0, leftarmx, leftarmy, 2, 2, 0, flashcolor, (-cos(fsiner / 5) * 0.4) + 0.6);
            draw_sprite_ext_flash(waist, 0, waistx, waisty, 2, 2, 0, flashcolor, (-cos(fsiner / 5) * 0.4) + 0.6);
            draw_sprite_ext_flash(skirt, 0, skirtx, skirty, 2, 2, 0, flashcolor, (-cos(fsiner / 5) * 0.4) + 0.6);
            draw_sprite_ext_flash(rightarm, rightarmindex, rightarmx, rightarmy, 2, 2, 0, flashcolor, (-cos(fsiner / 5) * 0.4) + 0.6);
            draw_sprite_ext_flash(head, talkingframe, headx, heady, 2, 2, 0, flashcolor, (-cos(fsiner / 5) * 0.4) + 0.6);
            draw_sprite_ext_flash(lefthand, 0, lefthandx, lefthandy, 2, 2, 0, flashcolor, (-cos(fsiner / 5) * 0.4) + 0.6);
        }
    }
    if (pose == 1)
    {
        if (poseindex >= 2)
            poseindex = 0;
        if (poseindex < 1.5)
            poseindex += 0.25;
        draw_sprite_ext(head, talkingframe, headx + 2, heady, 2, 2, 0, image_blend, image_alpha);
        draw_sprite_ext(spr_elnina_cool2, poseindex, waistx, waisty, 2, 2, 0, image_blend, image_alpha);
    }
    if (pose == 2)
    {
        if (poseindex < 2)
            poseindex = 2;
        if (poseindex < 3)
            poseindex += 0.25;
        draw_sprite_ext(head, talkingframe, headx, heady, 2, 2, 0, image_blend, image_alpha);
        draw_sprite_ext(spr_elnina_cool2, poseindex, waistx, waisty, 2, 2, 0, image_blend, image_alpha);
    }
    if (pose == 3)
    {
        draw_sprite_ext(hairtufts, 0, hairx, hairy, 2, 2, 0, c_white, 1);
        draw_sprite_ext(leftarm, 0, leftarmx, leftarmy, 2, 2, 0, c_white, 1);
        draw_sprite_ext(waist, 0, waistx, waisty, 2, 2, 0, c_white, 1);
        draw_sprite_ext(skirt, 0, skirtx, skirty, 2, 2, 0, c_white, 1);
        draw_sprite_ext(head, talkingframe, headx, heady, 2, 2, 0, c_white, 1);
        draw_sprite_ext(lefthand, 0, lefthandx, lefthandy, 2, 2, 0, c_white, 1);
        draw_sprite_ext(rightarm, rightarmindex, rightarmx, rightarmy, 2, 2, 0, c_white, 1);
    }
}
if (becomeflash == 0)
{
    flash = 0;
}
else
{
    becomeflash--;
    flash = 1;
}
