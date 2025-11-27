function scr_monster_make_tired(arg0)
{
    if (image_alpha > 0)
    {
        if (global.monsterstatus[arg0] == 0)
        {
            __tiredwriter = instance_create(global.monsterx[arg0], (global.monstery[arg0] - (global.hittarget[arg0] * 20)) + 20, obj_dmgwriter);
            __tiredwriter.type = 13;
            global.hittarget[arg0] += 1;
            snd_play_x(snd_spellcast, 0.5, 0.9);
        }
        global.monstercomment[arg0] = stringsetloc("(Tired)", "scr_monster_make_tired_slash_scr_monster_make_tired_gml_1_0");
        global.monsterstatus[arg0] = 1;
    }
}
