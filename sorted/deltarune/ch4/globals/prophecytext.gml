function scr_prophecytext(arg0 = "help")
{
    var thegirl = stringsetloc("THE GIRL", "scr_prophecytext_slash_scr_prophecytext_gml_13_0");
    var textstring = [];
    var textalign = "center";
    switch (arg0)
    {
        case "initial1":
            textstring[0] = stringsetloc("THE PROPHECY, WHICH WHISPERS#AMONG THE SHADOWS.", "scr_prophecytext_slash_scr_prophecytext_gml_20_0");
            break;
        case "initial2":
            textstring[0] = stringsetloc("THE LEGEND OF THIS WORLD.#<DELTARUNE.>", "scr_prophecytext_slash_scr_prophecytext_gml_23_0");
            break;
        case "main1":
            textstring[0] = stringsetloc("A WORLD BASKED IN PUREST LIGHT.#BENEATH IT, GREW ETERNAL NIGHT.", "scr_prophecytext_slash_scr_prophecytext_gml_26_0");
            break;
        case "main2":
            textstring[0] = stringsetloc("IF FOUNTAINS FREED, THE ROARING CRIES.#AND TITANS SHAPE FROM DARKENED EYES.", "scr_prophecytext_slash_scr_prophecytext_gml_29_0");
            break;
        case "main3":
            textstring[0] = stringsetloc("THE LIGHT AND DARK, BOTH BURNING DIRE.#A COUNTDOWN TO THE EARTH'S EXPIRE.", "scr_prophecytext_slash_scr_prophecytext_gml_32_0");
            break;
        case "heroes1":
            textstring[0] = stringsetloc("BUT LO, ON HOPES AND DREAMS THEY SEND.#THREE HEROES AT THE WORLD'S END.", "scr_prophecytext_slash_scr_prophecytext_gml_35_0");
            break;
        case "heroes2":
            textstring[0] = stringsetloc("THE GIRL, WITH HOPE CROSSED ON HER HEART.", "scr_prophecytext_slash_scr_prophecytext_gml_38_0");
            if (i_ex(obj_dw_churchb_rotatingtower))
                textstring[0] = stringsetloc("THE SECOND HERO.#THE GIRL, WITH HOPE CROSSED ON HER HEART.", "scr_prophecytext_slash_scr_prophecytext_gml_41_0");
            if (i_ex(obj_dw_churchb_darkclimb))
                textstring[0] = "";
            break;
        case "heroes3":
            textstring[0] = stringsetloc("THE PRINCE, ALONE IN DEEPEST DARK...", "scr_prophecytext_slash_scr_prophecytext_gml_49_0");
            if (i_ex(obj_dw_churchb_library))
                textstring[0] = stringsetloc("THE THIRD HERO.#THE PRINCE, ALONE IN DEEPEST DARK", "scr_prophecytext_slash_scr_prophecytext_gml_52_0");
            break;
        case "heroes4":
            textstring[0] = stringsetloc("THE CAGE, WITH HUMAN SOUL AND PARTS!", "scr_prophecytext_slash_scr_prophecytext_gml_56_0");
            if (i_ex(obj_dw_churchb_libraryconnector))
                textstring[0] = stringsetloc("THE FIRST HERO.#THE CAGE, WITH HUMAN SOUL AND PARTS!", "scr_prophecytext_slash_scr_prophecytext_gml_59_0");
            break;
        case "heavenandhell1":
            textstring[0] = stringsetloc("THEY'LL HEAR THE RING OF HEAVEN'S CALL.", "scr_prophecytext_slash_scr_prophecytext_gml_63_0");
            break;
        case "heavenandhell2":
            textstring[0] = stringsetloc("THEY'LL SEE THE TAIL OF HELL TAKE CRAWL.", "scr_prophecytext_slash_scr_prophecytext_gml_66_0");
            break;
        case "knight1":
            textstring[0] = stringsetloc("THE KNIGHT WHICH MAKES#WITH BLACKENED KNIFE.", "scr_prophecytext_slash_scr_prophecytext_gml_69_0");
            break;
        case "knight2":
            textstring[0] = stringsetloc("SHALL DUEL WITH HEROES#STRIFE BY STRIFE.", "scr_prophecytext_slash_scr_prophecytext_gml_72_0");
            break;
        case "boss1":
            textstring[0] = stringsetloc("THE QUEEN'S CHARIOT#CANNOT BE STOPPED.", "scr_prophecytext_slash_scr_prophecytext_gml_75_0");
            break;
        case "boss2":
            textstring[0] = stringsetloc("THE LORD OF SCREENS#CLEAVED RED BY BLADE.", "scr_prophecytext_slash_scr_prophecytext_gml_78_0");
            break;
        case "boss3":
            textstring[0] = stringsetloc("THE FLOWER MAN, #TRAPPED IN ASYLUM.", "scr_prophecytext_slash_scr_prophecytext_gml_81_0");
            break;
        case "joke1":
            textstring[0] = stringsetloc("JOCKINGTON GROWS THE BEARD.", "scr_prophecytext_slash_scr_prophecytext_gml_84_0");
            break;
        case "joke2":
            textstring[0] = stringsetloc("THE POINTY-HEADED WILL SAY#\"TOOTHPASTE,\" AND THEN  \"BOY.\"", "scr_prophecytext_slash_scr_prophecytext_gml_87_0");
            break;
        case "musicalprophecy1":
        case "leftpiece":
            textstring[0] = stringsetloc("A CONUNDRUM'S FIRST FOUR TONES.", "scr_prophecytext_slash_scr_prophecytext_gml_91_0");
            break;
        case "musicalprophecy2":
        case "rightpiece":
            textstring[0] = stringsetloc("A CONUNDRUM'S LAST FOUR TONES.", "scr_prophecytext_slash_scr_prophecytext_gml_95_0");
            break;
        case "musicalprophecybig":
            textstring[0] = stringsetloc("A CONUNDRUM'S MULTITUDE TONES.", "scr_prophecytext_slash_scr_prophecytext_gml_98_0");
            break;
        case "angel":
            textstring[0] = stringsetloc("THE ANGEL, BANISHED, WILL#FINALLY MEET WITH ITS DESIRE.", "scr_prophecytext_slash_scr_prophecytext_gml_101_0");
            break;
        case "end1":
            textstring[0] = stringsetloc("AND THEN. WHEN ALL HOPE#IS LOST FOR THE TALE", "scr_prophecytext_slash_scr_prophecytext_gml_104_0");
            break;
        case "end2":
            textstring[0] = stringsetloc("THE FINAL TRAGEDY UNVEILS.", "scr_prophecytext_slash_scr_prophecytext_gml_107_0");
            break;
        case "end3":
            textstring[0] = stringsetloc("FOR TO SAVE THE WORLDS,#WE LAST OF ALL SAY,", "scr_prophecytext_slash_scr_prophecytext_gml_110_0");
            break;
        case "end5":
            textstring[0] = stringsetloc("ONLY THEN,#WILL THE WORLDS BE SAVED.", "scr_prophecytext_slash_scr_prophecytext_gml_113_0");
            break;
        case "hammer":
            textstring[0] = stringsetloc("AXE CARVED BY THE#TORTOISE'S GRAND HAMMER.", "scr_prophecytext_slash_scr_prophecytext_gml_116_0");
            break;
        case "rudebuster":
            textstring[0] = stringsetloc("AND LAST, WAS THE GIRL.#AT LAST, WAS THE GIRL.", "scr_prophecytext_slash_scr_prophecytext_gml_119_0");
            break;
        case "snowflakes":
            textstring[0] = stringsetloc("COLDWATER FELL FROM THE#TOP OF THE SKY.", "scr_prophecytext_slash_scr_prophecytext_gml_122_0");
            break;
        case "roots":
            textstring[0] = stringsetloc("ROOTS", "scr_prophecytext_slash_scr_prophecytext_gml_125_0");
            break;
        case "gallery":
            textstring[0] = stringsetloc("GALLERY", "scr_prophecytext_slash_scr_prophecytext_gml_128_0");
            break;
        case "love":
            textstring[0] = stringsetloc("LOVE FINDS ITS WAY TO THE GIRL.", "scr_prophecytext_slash_scr_prophecytext_gml_131_0");
            break;
        case "laststory":
            textstring[0] = stringsetloc("THE LAST PROPHECY.#THE STORY'S END.", "scr_prophecytext_slash_scr_prophecytext_gml_134_0");
            break;
        case "savetheworlds":
            textstring[0] = stringsetloc("TO SAVE THE WORLDS,#THERE IS ONLY ONE WAY.", "scr_prophecytext_slash_scr_prophecytext_gml_137_0");
            break;
        default:
            textstring[0] = "";
            break;
    }
    if (instance_exists(obj_dw_churchb_bellroom))
        textstring[0] = thegirl;
    textstring[1] = textalign;
    return textstring;
}
