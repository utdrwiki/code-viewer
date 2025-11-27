with (obj_dmgwriter_boogie)
{
    killtimer = 0;
    killactive = 0;
    kill = 0;
}
if (!i_ex(obj_growtangle))
    event_inherited();
touchingplayer--;
if (touchingplayer > 0)
{
    with (parentid)
        idlesprite = spr_organik_body;
    highlight += 10;
    var _highlight = highlight;
    if (_highlight > 70)
        _highlight = 70;
    with (parentid)
        harmonize_highlight = 2;
    particletimer++;
    if (particletimer == 3)
    {
        particletimer = 0;
        part = instance_create(obj_heart.x + random(20), obj_heart.y + random(20), obj_organ_enemy_particle);
        part.depth = obj_heart.depth - 100;
        part.image_alpha = 1;
    }
}
else if (green == 1)
{
    highlight = 0;
    image_blend = c_lime;
    with (obj_organ_enemy)
        snd_volume(harmon_sound, 0, 10);
}
else
{
    with (obj_organ_enemy)
        snd_volume(harmon_sound, 0, 10);
}
