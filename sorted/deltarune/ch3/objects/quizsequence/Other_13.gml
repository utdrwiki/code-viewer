if (hurt_counter != 0)
{
    if (hurt_counter == -1)
    {
        hurt_counter = 0;
        if (kr_answer[0] == 0)
        {
            hurt_kr = true;
            hurt_counter++;
        }
        if (ra_answer[0] == 0)
        {
            hurt_ra = true;
            hurt_counter++;
        }
        if (su_answer[0] == 0)
        {
            hurt_su = true;
            hurt_counter++;
        }
    }
    var _target = -4;
    var _spritewidth = 0;
    target = 0;
    var _damage = irandom_range(30, 38);
    if (hurt_su)
    {
        hurt_su = false;
        quizzler.susie.x -= 8;
        _target = quizzler.susie;
        _damage = min(_damage, global.hp[2] - 1);
        global.hp[2] -= _damage;
        _spritewidth = _target.sprite_width;
        quizzler.susie.sprite_index = spr_susie_dw_landed;
        quizzler.susie.image_speed = 0;
        quizzler.susie.image_index = 0;
        quizzler.susie_punch = false;
        _target.x -= (_target.sprite_width - _spritewidth) / 2;
    }
    else if (hurt_kr)
    {
        hurt_kr = false;
        _target = quizzler.kris;
        _damage = min(_damage, global.hp[1] - 1);
        global.hp[1] -= _damage;
        _spritewidth = _target.sprite_width;
        quizzler.kris.sprite_index = spr_kris_dw_landed;
        _target.x -= (_target.sprite_width - _spritewidth) / 2;
    }
    else if (hurt_ra)
    {
        hurt_ra = false;
        _target = quizzler.ralsei;
        target = 2;
        _damage = min(_damage, global.hp[3] - 1);
        global.hp[3] -= _damage;
        _spritewidth = _target.sprite_width;
        quizzler.ralsei.sprite_index = spr_teacup_ralsei_land;
        quizzler.ralsei.image_speed = 0;
        quizzler.ralsei.image_index = 0;
        _target.x += (_target.sprite_width - _spritewidth) / 2;
    }
    if (_target != -4)
    {
        var _lightning = scr_dark_animation(_target.x + (_target.sprite_width / 2), _target.y, 3777, 1);
        _lightning.depth = _target.depth - 4;
        scr_shakeobj(_target);
        var _dmgwriter = instance_create(_target.x, (_target.y + _target.sprite_height) - 24, obj_dmgwriter);
        _dmgwriter.damage = _damage;
        scr_shakescreen();
        with (obj_darkcontroller)
            charcon = 1;
        with (_target)
        {
            var _flash = instance_create(x, y, obj_sprite_flasher);
            _flash.target = id;
            _flash.lifetime = 4;
        }
        snd_play(snd_punchheavythunder);
        hurt_counter--;
        if (hurt_counter == 0)
            endtimer += 30;
        else
            endtimer += 10;
    }
}
