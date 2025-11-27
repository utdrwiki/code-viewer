with (obj_floorshadow)
    instance_destroy();
with (npc1)
{
    marker.image_index += 0.125;
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* Ah^1! Soldiers^1, brimming with youth. Seek you to join the ranks of the Cuptains?/", "obj_dw_church_rightconnect_slash_Step_0_gml_16_0");
        msgnextloc("* Heave ho^1! Together we shall stack in crimson tower^1, to the Savior of our Princesses./", "obj_dw_church_rightconnect_slash_Step_0_gml_17_0");
        msgnextloc("* Now then^1, get climbing^1! To the eaves^1, to the eaves!/%", "obj_dw_church_rightconnect_slash_Step_0_gml_18_0");
        if (talked)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* What? Can't you climb?/", "obj_dw_church_rightconnect_slash_Step_0_gml_23_0");
            msgnextloc("* Ah^1, neither can us all; just some bravery will do^1, just some bravery./%", "obj_dw_church_rightconnect_slash_Step_0_gml_24_0");
        }
        d_make();
        myinteract = 999;
        talked++;
    }
    if (myinteract == 999 && !d_ex())
    {
        myinteract = 0;
        global.interact = 0;
    }
}
with (npc2)
{
    marker.image_index += 0.125;
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* They say a pianolike organ rests above^1, opening the way for those who play it./", "obj_dw_church_rightconnect_slash_Step_0_gml_48_0");
        msgnextloc("* Unfortunately^1, I lack the grip strength to reach such a place..^1. But do you?/%", "obj_dw_church_rightconnect_slash_Step_0_gml_49_0");
        if (talked)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* I cannot grip^1, nor can I sip. ..^1. Trouble is brewing for a man like me./%", "obj_dw_church_rightconnect_slash_Step_0_gml_54_0");
        }
        d_make();
        myinteract = 999;
        talked++;
    }
    if (myinteract == 999 && !d_ex())
    {
        myinteract = 0;
        global.interact = 0;
    }
}
with (npc3)
{
    marker.image_index += 0.125;
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* Our Princesses^1, the water fairies^1, wait for us in the high above./", "obj_dw_church_rightconnect_slash_Step_0_gml_78_0");
        msgnextloc("* Climb^1, climb we must!/", "obj_dw_church_rightconnect_slash_Step_0_gml_79_0");
        msgnextloc("* ..^1. Yes^1, there's one down here^1, too.../", "obj_dw_church_rightconnect_slash_Step_0_gml_80_0");
        msgnextloc("* But any good Cup knows a Princess's value is equal to their height./%", "obj_dw_church_rightconnect_slash_Step_0_gml_81_0");
        if (talked)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* A ground-bound Princess is not worth washing your hands with./%", "obj_dw_church_rightconnect_slash_Step_0_gml_86_0");
        }
        d_make();
        myinteract = 999;
        talked++;
    }
    if (myinteract == 999 && !d_ex())
    {
        myinteract = 0;
        global.interact = 0;
    }
}
with (npc4)
{
    marker.image_index += 0.125;
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* I did clamber my best^1, but I found no Princess here./", "obj_dw_church_rightconnect_slash_Step_0_gml_110_0");
        msgnextloc("* Unless^1, perhaps^1, this pillar itself is the Princess.../%", "obj_dw_church_rightconnect_slash_Step_0_gml_111_0");
        if (talked)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Yes^1, this Princess must be shy^1, or sleeping. I will wait. I will wait./%", "obj_dw_church_rightconnect_slash_Step_0_gml_116_0");
        }
        d_make();
        myinteract = 999;
        talked++;
    }
    if (myinteract == 999 && !d_ex())
    {
        myinteract = 0;
        global.interact = 0;
    }
}
with (npc5)
{
    marker.image_index += 0.125;
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* This is a Kingdom without King or Prince./", "obj_dw_church_rightconnect_slash_Step_0_gml_140_0");
        msgnextloc("* Flaky disciples^1, lost in meaningless worship./", "obj_dw_church_rightconnect_slash_Step_0_gml_141_0");
        msgnextloc("* Old scholars^1, greyed by research forgotten./", "obj_dw_church_rightconnect_slash_Step_0_gml_142_0");
        msgnextloc("* Fairies^1, princesses^1, soldiers../", "obj_dw_church_rightconnect_slash_Step_0_gml_143_0");
        msgnextloc("* On the outskirts^1, ghasts^1, wild beasts of horror and sloth.../", "obj_dw_church_rightconnect_slash_Step_0_gml_144_0");
        msgnextloc("* ..^1. And^1, of course^1, a Dark Knight!/%", "obj_dw_church_rightconnect_slash_Step_0_gml_145_0");
        if (talked)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* I shan't seek my fortune here. 'tis a doomed place./", "obj_dw_church_rightconnect_slash_Step_0_gml_150_0");
            msgnextloc("* Should you fancy me to join your court^1, I would be but brimming with pleasure./%", "obj_dw_church_rightconnect_slash_Step_0_gml_151_0");
        }
        d_make();
        myinteract = 999;
        talked++;
    }
    if (myinteract == 999 && !d_ex())
    {
        myinteract = 0;
        global.interact = 0;
    }
}
