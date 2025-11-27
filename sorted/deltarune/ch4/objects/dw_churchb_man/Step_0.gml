scr_populatechars();
if (!init)
{
    with (obj_trigger_interact)
    {
        strict = true;
        issolid = true;
        talked = 0;
        switch (extflag)
        {
            case "man":
                other.man = id;
                break;
            case "tree":
                other.tree = id;
                break;
            case "canvas":
                other.canvas = id;
                break;
            case "canvas2":
                other.canvas2 = id;
                break;
            case "sink":
                other.sink = id;
                break;
            case "artclubperson":
                other.artclubperson = id;
                break;
        }
    }
    canvas.x = room_width;
    init = 1;
}
var minY = 564;
var maxY = 670;
var open = 0;
if (obj_mainchara.x < 970)
{
    if (obj_mainchara.y < 670 && obj_mainchara.y >= 564)
        open = 1;
}
if (lastopen != open)
{
    if (open)
        snd_play(snd_dooropen);
    else
        snd_play(snd_doorclose);
}
lastopen = open;
treedoor.image_index = open;
if (obj_mainchara.x < 1144)
{
    var ind = 1 - ((obj_mainchara.y - minY) / (maxY - minY));
    var targ = merge_color(c_white, c_black, clamp(ind, 0, 1));
    obj_mainchara.image_blend = targ;
}
else
{
    obj_mainchara.image_blend = c_white;
}
with (npc)
{
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* KRIS^1, THERE YOU ARE. THE PATIENTS ARE WAITING FOR YOU./%", "obj_dw_churchb_man_slash_Step_0_gml_69_0");
        if (talked)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* YES^1, I KNOW I'M QUITE SMALL FOR A SECRETARY./", "obj_dw_churchb_man_slash_Step_0_gml_74_0");
            msgnextloc("* BUT^1, KNOCKOFFS DON'T HAVE THE RIGHT TO COMPLAIN.../%", "obj_dw_churchb_man_slash_Step_0_gml_75_0");
        }
        if (other.gotegg)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* WELL? HOW DID THE SESSION GO?/", "obj_dw_churchb_man_slash_Step_0_gml_81_0");
            msgnextloc("* THEY SAY ART IS THERAPEUTIC./", "obj_dw_churchb_man_slash_Step_0_gml_82_0");
            msgnextloc("* ..^1. WHICH ONE OF YOU WAS THE PATIENT^1, ANYWAY?/%", "obj_dw_churchb_man_slash_Step_0_gml_83_0");
            if (talked)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* WELL^1, YOU GOT PAID^1, DIDN'T YOU?/%", "obj_dw_churchb_man_slash_Step_0_gml_88_0");
            }
        }
        bw_make();
        myinteract = 999;
        talked++;
    }
    if (myinteract == 999 && !bw_ex())
    {
        myinteract = 0;
        marker.image_index = 0;
        global.interact = 0;
    }
}
with (tree)
{
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* (He is behind the tree...)/%", "obj_dw_churchb_man_slash_Step_0_gml_112_0");
        if (other.man.x != other.man.xstart)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Well^1, there is not a man here.)/%", "obj_dw_churchb_man_slash_Step_0_gml_117_0");
        }
        d_make();
        myinteract = 4;
    }
    if (myinteract == 4 && !d_ex())
    {
        myinteract = 0;
        global.interact = 0;
    }
}
with (man)
{
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* (Well^1, there is a man here.)/", "obj_dw_churchb_man_slash_Step_0_gml_137_0");
        msgnextloc("* (Well^1, he seems to be pointing at something and nodding.)/%", "obj_dw_churchb_man_slash_Step_0_gml_138_0");
        if (other.con == 0)
            other.con = 1;
        d_make();
        myinteract = 4;
    }
    if (myinteract == 4 && !d_ex())
    {
        myinteract = 0;
        global.interact = 0;
    }
}
with (canvas)
{
    if (myinteract == 3)
    {
        global.interact = 1;
        global.msc = -99;
        global.choice = -1;
        global.choicemsg[0] = stringsetloc("#Yes", "obj_dw_churchb_man_slash_Step_0_gml_161_0");
        global.choicemsg[1] = stringsetloc("#No", "obj_dw_churchb_man_slash_Step_0_gml_162_0");
        global.choicemsg[2] = stringset("");
        global.choicemsg[3] = stringset("");
        scr_speaker("no_name");
        msgsetloc(0, "* (Well^1, there is a canvas here.)/", "obj_dw_churchb_man_slash_Step_0_gml_167_0");
        msgnextloc("* (Will you draw?)/", "obj_dw_churchb_man_slash_Step_0_gml_168_0");
        msgnext("\\C2 ");
        d_make();
        myinteract = 4;
    }
    if (myinteract == 4 && global.choice != -1)
    {
        k_d(1);
        if (global.choice == 0)
        {
            blackout = scr_marker_ext(camerax() - 80, cameray() - 80, spr_pxwhite, 800, 640, undefined, undefined, c_black, 5000, undefined, undefined, 0);
            with (blackout)
                scr_lerpvar("image_alpha", 0, 1, 30);
            scr_speaker("no_name");
            msgsetloc(0, "* (Kris picked up a pencil.)/", "obj_dw_churchb_man_slash_Step_0_gml_182_0");
            msgnextloc("* (They began by sketching what they had seen behind the tree.)/", "obj_dw_churchb_man_slash_Step_0_gml_183_0");
            msgnextloc("* (But^1, as they sketched^1, the line began to err^1, as if the pencil had lost its way.)/", "obj_dw_churchb_man_slash_Step_0_gml_184_0");
            msgnextloc("* (So they started again^1, drawing over the lines they had already made.)/", "obj_dw_churchb_man_slash_Step_0_gml_185_0");
            msgnextloc("* (Many times^1, they would suddenly halt^1, or the pencil drifted into a new drawing...)/", "obj_dw_churchb_man_slash_Step_0_gml_186_0");
            msgnextloc("* (So^1, they started over^1, over^1, over again.)/", "obj_dw_churchb_man_slash_Step_0_gml_187_0");
            msgnextloc("* (Through many repetitions^1, their movements became faster and smoother...)/", "obj_dw_churchb_man_slash_Step_0_gml_188_0");
            msgnextloc("* (..^1. until without looking^1, they had completed a sketch in a single^1, wild line.)/", "obj_dw_churchb_man_slash_Step_0_gml_189_0");
            msgnextloc("* (...)/", "obj_dw_churchb_man_slash_Step_0_gml_190_0");
            msgnextloc("* (In the end^1, as a result of layering the sketches on top of each other...)/", "obj_dw_churchb_man_slash_Step_0_gml_191_0");
            msgnextloc("* (..^1. The surface of the canvas was nothing more than a monochrome smear.)/", "obj_dw_churchb_man_slash_Step_0_gml_192_0");
            msgnextloc("* (...)/", "obj_dw_churchb_man_slash_Step_0_gml_193_0");
            msgnextloc("* (Next^1, a tree was painted over it...)/", "obj_dw_churchb_man_slash_Step_0_gml_194_0");
            msgnextloc("* (..^1. painted over everything...)/", "obj_dw_churchb_man_slash_Step_0_gml_195_0");
            msgnextloc("* (..^1. leaving nothing but a simple still life.)/", "obj_dw_churchb_man_slash_Step_0_gml_196_0");
            msgnextloc("* (..^1. After all^1, there wasn't anything to look at in the room besides a single tree.)/", "obj_dw_churchb_man_slash_Step_0_gml_197_0");
            msgnextloc("* (...)/", "obj_dw_churchb_man_slash_Step_0_gml_198_0");
            msgnextloc("* (Kris got up. It seemed the painting was complete.)/", "obj_dw_churchb_man_slash_Step_0_gml_199_0");
            msgnextloc("* (...)/", "obj_dw_churchb_man_slash_Step_0_gml_200_0");
            msgnextloc("* (But^1, their hand^1, smudged with graphite...)/", "obj_dw_churchb_man_slash_Step_0_gml_201_0");
            msgnextloc("* (..^1. was still moving^1, as if to trace some unseen shape.)/%", "obj_dw_churchb_man_slash_Step_0_gml_202_0");
            d_make(undefined, undefined, 5);
            myinteract = 5;
        }
        if (global.choice == 1)
        {
            myinteract = 99;
            scr_speaker("no_name");
            msgsetloc(0, "* (You admired the texture of the canvas.)/%", "obj_dw_churchb_man_slash_Step_0_gml_210_0");
            d_make();
        }
    }
    if (myinteract == 5 && !d_ex())
    {
        snd_play(snd_egg);
        global.flag[931] = 1;
        other.gotegg = true;
        other.npc.talked = 0;
        other.con = 4;
        other.sink.talked = 0;
        scr_keyitemget(2);
        scr_speaker("no_name");
        msgsetloc(0, "* (An Egg was picked up from a nearby easel.)/%", "obj_dw_churchb_man_slash_Step_0_gml_227_0");
        d_make();
        myinteract = 99;
    }
    if (myinteract == 99 && !d_ex())
    {
        if (variable_instance_exists(id, "blackout"))
        {
            if (i_ex(blackout))
            {
                with (blackout)
                    scr_lerpvar("image_alpha", 1, 0, 30);
                scr_doom(blackout, 30);
            }
        }
        x = room_width;
        other.man.x = room_width;
        other.artclubperson.x = room_width;
        other.canvas2.x = room_width;
        global.interact = 0;
        myinteract = 0;
    }
}
with (canvas2)
{
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* (Someone seems to be making a painting of a tree.)/", "obj_dw_churchb_man_slash_Step_0_gml_260_0");
        msgnextloc("* (However^1, strangely^1, it seems that they haven't drawn the bark yet.)/%", "obj_dw_churchb_man_slash_Step_0_gml_261_0");
        d_make();
        myinteract = 4;
    }
    if (myinteract == 4 && !d_ex())
    {
        myinteract = 0;
        global.interact = 0;
    }
}
with (sink)
{
    var itsasink = stringsetloc("* (It's a sink.)/", "obj_dw_churchb_man_slash_Step_0_gml_276_0");
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgset(0, itsasink);
        msgnextloc("* (It would be ridiculous if you painted something and there was nowhere to wash your hands.)/%", "obj_dw_churchb_man_slash_Step_0_gml_282_0");
        if (other.con == 4)
        {
            scr_speaker("no_name");
            msgset(0, itsasink);
            msgnextloc("* (You ran water over your hands^1, and dried them.)/", "obj_dw_churchb_man_slash_Step_0_gml_288_0");
            msgnextloc("* (Between your fingers^1, a faint grey crease glittered stubbornly.)/", "obj_dw_churchb_man_slash_Step_0_gml_289_0");
            msgnextloc("* (..^1. You can never wash it all away.)/%", "obj_dw_churchb_man_slash_Step_0_gml_290_0");
            global.flag[1622] = 1;
        }
        if (other.con == 5)
        {
            scr_speaker("no_name");
            msgset(0, itsasink + "%");
        }
        d_make();
        myinteract = 4;
    }
    if (myinteract == 4 && !d_ex())
    {
        if (other.con == 4)
            other.con = 5;
        myinteract = 0;
        global.interact = 0;
    }
}
with (artclubperson)
{
    if (myinteract == 3)
    {
        global.interact = 1;
        scr_speaker("no_name");
        msgsetloc(0, "* Oh...^1! I'm sorry. I was so into drawing I didn't notice you!/", "obj_dw_churchb_man_slash_Step_0_gml_318_0");
        msgnextloc("* Are you here for Art Club?/", "obj_dw_churchb_man_slash_Step_0_gml_319_0");
        msgnextloc("* Right^1, this is where we draw pictures^1, and don't kill each other!/", "obj_dw_churchb_man_slash_Step_0_gml_320_0");
        msgnextloc("* ..^1. What am I drawing? Oh^1, don't look. I'm not finished yet.../%", "obj_dw_churchb_man_slash_Step_0_gml_321_0");
        if (talked)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* How did I get here? Hmm.../", "obj_dw_churchb_man_slash_Step_0_gml_327_0");
            msgnextloc("* I can't say I remember./", "obj_dw_churchb_man_slash_Step_0_gml_328_0");
            msgnextloc("* ..^1. I was in such a rush^1, I didn't look where I was going at all!/%", "obj_dw_churchb_man_slash_Step_0_gml_329_0");
        }
        talked++;
        d_make();
        myinteract = 4;
    }
    if (myinteract == 4 && !d_ex())
    {
        myinteract = 0;
        global.interact = 0;
    }
}
if (occucon == 0)
{
    var trig = 0;
    with (obj_trigger_interact)
    {
        if (extflag == "occupied")
        {
            if (myinteract == 3)
                trig = 1;
        }
    }
    if (trig == 1)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It seems to be occupied.)/%", "obj_dw_churchb_man_slash_Step_0_gml_361_0");
        d_make();
        global.interact = 1;
        occucon = 1;
    }
}
if (occucon == 1 && !d_ex())
{
    with (obj_trigger_interact)
    {
        if (extflag == "occupied")
            myinteract = 0;
    }
    global.interact = 0;
    occucon = 0;
}
if (con == 1)
{
    canvas.x = canvas.xstart;
    con = 2;
}
