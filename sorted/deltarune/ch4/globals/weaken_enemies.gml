function scr_weaken_enemies()
{
    for (i = 0; i < 3; i++)
    {
        if (!global.monster[i])
            continue;
        dm = instance_create(global.monsterx[i], (global.monstery[i] + 20) - (global.hittarget[i] * 20), obj_dmgwriter);
        dm.damage = global.monsterhp[i] - 1;
        var _miss = global.monsterhp[i] == 1;
        global.monsterhp[i] = 1;
        with (global.monsterinstance[i])
        {
            var _ex = instance_create(x + (sprite_width / 2), y + (sprite_height / 2), obj_animation_dx);
            _ex.sprite_index = spr_realisticexplosion;
            _ex.image_xscale = 2;
            _ex.image_yscale = 2;
            _ex.depth = obj_dmgwriter.depth + 1;
            if (!_miss)
            {
                shakex = 9;
                state = 3;
                hurttimer = 30;
            }
        }
    }
}
