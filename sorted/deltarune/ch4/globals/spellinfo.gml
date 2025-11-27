function scr_spellinfo(arg0)
{
    cost = -1;
    spelltarget = 1;
    spellname = stringsetloc(" ", "scr_spellinfo_slash_scr_spellinfo_gml_3_0");
    spellnameb = " ";
    spelldescb = stringsetloc(" ", "scr_spellinfo_slash_scr_spellinfo_gml_5_0");
    spelldesc = stringsetloc(" ", "scr_spellinfo_slash_scr_spellinfo_gml_6_0");
    spellanim = 0;
    spellusable = 0;
    spelltext = " ";
    switch (arg0)
    {
        case 0:
            spellname = stringsetloc(" ", "scr_spellinfo_slash_scr_spellinfo_gml_14_0");
            spellnameb = " ";
            spelltarget = 0;
            cost = -1;
            spelldescb = stringsetloc("None", "scr_spellinfo_slash_scr_spellinfo_gml_18_0");
            break;
        case 1:
            spellname = stringsetloc("Rude Sword", "scr_spellinfo_slash_scr_spellinfo_gml_21_0");
            spellnameb = stringsetloc("RudeSword", "scr_spellinfo_slash_scr_spellinfo_gml_22_0");
            spelldescb = stringsetloc("Rude#damage", "scr_spellinfo_slash_scr_spellinfo_gml_24_0_b");
            spelldesc = stringsetloc("Deals moderate Rude-elemental damage to#one foe. Depends on Attack & Magic.", "scr_spellinfo_slash_scr_spellinfo_gml_24_0");
            spelltarget = 2;
            cost = 125;
            spellusable = 0;
            break;
        case 2:
            spellname = stringsetloc("Heal Prayer", "scr_spellinfo_slash_scr_spellinfo_gml_31_0");
            spellnameb = stringsetloc("Heal Prayer", "scr_spellinfo_slash_scr_spellinfo_gml_32_0");
            spelldescb = stringsetloc("Heal#ally", "scr_spellinfo_slash_scr_spellinfo_gml_34_0_b");
            spelldesc = stringsetloc("Heavenly light restores a little HP to#one party member. Depends on Magic.", "scr_spellinfo_slash_scr_spellinfo_gml_34_0");
            spelltarget = 1;
            cost = 80;
            usable = 0;
            spellusable = 0;
            break;
        case 3:
            spellname = stringsetloc("Pacify", "scr_spellinfo_slash_scr_spellinfo_gml_42_0");
            spellnameb = stringsetloc("Pacify", "scr_spellinfo_slash_scr_spellinfo_gml_43_0");
            spelldescb = stringsetloc("Spare#TIRED foe", "scr_spellinfo_slash_scr_spellinfo_gml_45_0_b");
            spelldesc = stringsetloc("SPARE a tired enemy by putting them to sleep.", "scr_spellinfo_slash_scr_spellinfo_gml_45_0");
            spelltarget = 2;
            cost = 40;
            usable = 0;
            spellusable = 0;
            break;
        case 4:
            spellname = stringsetloc("Rude Buster", "scr_spellinfo_slash_scr_spellinfo_gml_52_0");
            spellnameb = stringsetloc("Rude Buster", "scr_spellinfo_slash_scr_spellinfo_gml_53_0");
            spelldescb = stringsetloc("Rude#damage", "scr_spellinfo_slash_scr_spellinfo_gml_55_0_b");
            spelldesc = stringsetloc("Deals moderate Rude-elemental damage to#one foe. Depends on Attack & Magic.", "scr_spellinfo_slash_scr_spellinfo_gml_55_0");
            spelltarget = 2;
            cost = 125;
            if (global.charweapon[2] == 7)
                cost = 100;
            spellusable = 0;
            break;
        case 5:
            spellname = stringsetloc("Red Buster", "scr_spellinfo_slash_scr_spellinfo_gml_64_0");
            spellnameb = stringsetloc("Red Buster", "scr_spellinfo_slash_scr_spellinfo_gml_65_0");
            spelldescb = stringsetloc("Red#damage", "scr_spellinfo_slash_scr_spellinfo_gml_67_0_b");
            spelldesc = stringsetloc(" ", "scr_spellinfo_slash_scr_spellinfo_gml_67_0");
            spelltarget = 2;
            cost = 0;
            spellusable = 0;
            break;
        case 6:
            spellname = stringsetloc("Dual Heal", "scr_spellinfo_slash_scr_spellinfo_gml_75_0");
            spellnameb = stringsetloc("Dual Heal", "scr_spellinfo_slash_scr_spellinfo_gml_76_0");
            spelldescb = stringsetloc("Heal All#30 HP", "scr_spellinfo_slash_scr_spellinfo_gml_77_0");
            spelldesc = stringsetloc(" ", "scr_spellinfo_slash_scr_spellinfo_gml_78_0");
            spelltarget = 0;
            cost = 0;
            spellusable = 0;
            break;
        case 7:
            spellname = stringsetloc("ACT", "scr_spellinfo_slash_scr_spellinfo_gml_86_0");
            spellnameb = stringsetloc("ACT", "scr_spellinfo_slash_scr_spellinfo_gml_87_0");
            spelldescb = stringsetloc("Use#action", "scr_spellinfo_slash_scr_spellinfo_gml_88_0");
            spelldesc = stringsetloc("Do all sorts of things.#It isn't magic.", "scr_spellinfo_slash_scr_spellinfo_gml_89_0");
            if (global.chapter == 4)
                spelldesc = stringsetloc("Execute various behaviors.#It can't be considered magic.", "scr_spellinfo_slash_scr_spellinfo_gml_93_0");
            spelltarget = 0;
            cost = 0;
            spellusable = 0;
            break;
        case 8:
            spellname = stringsetloc("SleepMist", "scr_spellinfo_slash_scr_spellinfo_gml_96_0");
            spellnameb = stringsetloc("Sleep Mist", "scr_spellinfo_slash_scr_spellinfo_gml_97_0");
            spelldescb = stringsetloc("Spare#TIRED foes", "scr_spellinfo_slash_scr_spellinfo_gml_98_0");
            spelldesc = stringsetloc("A cold mist sweeps through,#sparing all TIRED enemies.", "scr_spellinfo_slash_scr_spellinfo_gml_99_0");
            spelltarget = 0;
            cost = 80;
            spellusable = 0;
            break;
        case 9:
            spellname = stringsetloc("IceShock", "scr_spellinfo_slash_scr_spellinfo_gml_107_0");
            spellnameb = stringsetloc("IceShock", "scr_spellinfo_slash_scr_spellinfo_gml_108_0");
            spelldescb = stringsetloc("Damage#w/ ICE", "scr_spellinfo_slash_scr_spellinfo_gml_109_0");
            spelldesc = stringsetloc("Deals magical ICE damage to#one enemy.", "scr_spellinfo_slash_scr_spellinfo_gml_110_0");
            spelltarget = 2;
            cost = 40;
            if (global.charweapon[4] == 13)
                cost *= 0.5;
            spellusable = 0;
            break;
        case 10:
            spellname = stringsetloc("SnowGrave", "scr_spellinfo_slash_scr_spellinfo_gml_121_0");
            spellnameb = stringsetloc("SnowGrave", "scr_spellinfo_slash_scr_spellinfo_gml_122_0");
            spelldescb = stringsetloc("Fatal", "scr_spellinfo_slash_scr_spellinfo_gml_123_0");
            spelldesc = stringsetloc("Deals the fatal damage to#all of the enemies.", "scr_spellinfo_slash_scr_spellinfo_gml_124_0");
            spelltarget = 0;
            cost = global.maxtension * 2;
            if (global.charweapon[4] == 13)
                cost *= 0.5;
            spellusable = 0;
            break;
        case 11:
            spellname = stringsetloc("OKHeal", "scr_spellinfo_slash_scr_spellinfo_gml_152_0_b");
            spellnameb = stringsetloc("OKHeal", "scr_spellinfo_slash_scr_spellinfo_gml_153_0_b");
            spelldescb = stringsetloc("OK#healing", "scr_spellinfo_slash_scr_spellinfo_gml_154_0");
            spelldesc = stringsetloc("It's not the best healing spell, but#it may have its uses.", "scr_spellinfo_slash_scr_spellinfo_gml_155_0_b");
            spelltarget = 1;
            spellusable = 0;
            if (global.flag[1045] == 0)
                cost = 212.5;
            if (global.flag[1045] == 1)
                cost = 210;
            if (global.flag[1045] == 2)
                cost = 210;
            if (global.flag[1045] == 3)
                cost = 210;
            if (global.flag[1045] == 4)
                cost = 207.5;
            if (global.flag[1045] == 5)
                cost = 207.5;
            if (global.flag[1045] == 6)
                cost = 207.5;
            if (global.flag[1045] == 7)
                cost = 205;
            if (global.flag[1045] == 8)
                cost = 205;
            if (global.flag[1045] == 9)
                cost = 205;
            if (global.flag[1045] == 10)
                cost = 202.5;
            if (global.flag[1045] == 11)
                cost = 202.5;
            if (global.flag[1045] == 12)
                cost = 202.5;
            if (global.flag[1045] == 13)
                cost = 200;
            if (global.flag[1045] == 14)
                cost = 200;
            if (global.flag[1045] >= 15)
                cost = 200;
            if (global.plot >= 110 && global.flag[850] < 6)
            {
                spellname = stringsetloc("Heal", "scr_spellinfo_slash_scr_spellinfo_gml_161_0");
                spellnameb = stringsetloc("Heal", "scr_spellinfo_slash_scr_spellinfo_gml_162_0");
                spelldescb = stringsetloc("Can't#use", "scr_spellinfo_slash_scr_spellinfo_gml_163_0");
                spelldesc = stringsetloc("It seems the user doesn't#want to use this spell.", "scr_spellinfo_slash_scr_spellinfo_gml_164_0");
                cost = 255;
            }
            if (global.flag[1569] == 1 || global.flag[852] == 1)
            {
                if (global.flag[1045] == 0)
                    cost = 200;
                if (global.flag[1045] == 1)
                    cost = 197.5;
                if (global.flag[1045] == 2)
                    cost = 197.5;
                if (global.flag[1045] == 3)
                    cost = 197.5;
                if (global.flag[1045] == 4)
                    cost = 195;
                if (global.flag[1045] == 5)
                    cost = 195;
                if (global.flag[1045] == 6)
                    cost = 195;
                if (global.flag[1045] == 7)
                    cost = 192.5;
                if (global.flag[1045] == 8)
                    cost = 192.5;
                if (global.flag[1045] == 9)
                    cost = 192.5;
                if (global.flag[1045] == 10)
                    cost = 190;
                if (global.flag[1045] == 11)
                    cost = 190;
                if (global.flag[1045] == 12)
                    cost = 190;
                if (global.flag[1045] == 13)
                    cost = 187.5;
                if (global.flag[1045] == 14)
                    cost = 187.5;
                if (global.flag[1045] >= 15)
                    cost = 187.5;
                spellname = stringsetloc("BetterHeal", "scr_spellinfo_slash_scr_spellinfo_gml_169_0");
                spellnameb = stringsetloc("BetterHeal", "scr_spellinfo_slash_scr_spellinfo_gml_170_0");
                spelldescb = stringsetloc("Heal#ally", "scr_spellinfo_slash_scr_spellinfo_gml_171_0");
                spelldesc = stringsetloc("A healing spell that has grown#with practice and confidence.", "scr_spellinfo_slash_scr_spellinfo_gml_172_0");
            }
            break;
    }
}
