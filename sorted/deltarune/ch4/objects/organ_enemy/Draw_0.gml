scr_enemy_drawhurt_generic();
if (state == 0)
{
    fsiner += 1;
    siner2 += 0.16666666666666666;
    siner += clamp(0.25 + (sin(siner2 / 6) * 0.3), 0, 0.5);
    thissprite = idlesprite;
    if (global.mercymod[myself] >= global.mercymax[myself] && global.turntimer < 1)
        thissprite = sparedsprite;
    draw_monster_body_part(thissprite, siner, x, y);
    if (thissprite == idlesprite)
        draw_monster_body_part(spr_organik_head, siner, x, y);
    if (thissprite != sparedsprite)
        x = xstart + (sin(siner2 / 1.5) * 3);
}
if (becomeflash == 0)
    flash = 0;
becomeflash = 0;
if (harmonize_highlight > 0)
{
    harmonize_highlight--;
    if (!i_ex(obj_organ_enemy_highlight))
    {
        instance_create(x + 58, y + 136, obj_organ_enemy_highlight);
        obj_organ_enemy_highlight.depth = depth - 2;
    }
    else
    {
        obj_organ_enemy_highlight.alarm[0] = 2;
    }
    particletimer++;
    if (particletimer >= 1)
    {
        part = instance_create(x + 8 + random(60), y + 117, obj_organ_enemy_particle);
        part.depth = depth - 1;
        particletimer = 0;
    }
}
