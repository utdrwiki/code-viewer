var stayer = 0;
myinteract = 3;
global.msc = 0;
global.typer = 5;
if (global.darkzone == 1)
    global.typer = 6;
global.fe = 0;
global.fc = 0;
global.interact = 1;
with (obj_darkcontroller)
    charcon = 0;
global.msg[0] = stringsetloc("* Suddenly^1, your body seizes up^1.&* What are you looking at?/%", "obj_readable_room1_slash_Other_10_gml_13_0");
if (scr_debug())
    global.msg[0] = stringset("* [NO TEXT] (obj_readable_room1)/%");
if (room == room_krisroom)
{
    if (y < 150)
    {
        if (global.chapter == 1)
        {
            global.msg[0] = stringsetloc("* There are CDs under the bed^1.&* Classical^1, jazz^1, religious ska.../", "obj_readable_room1_slash_Other_10_gml_21_0");
            global.msg[1] = stringsetloc("* There's also a game console^1.&* It has one normal controller^1, and one knock-off one./%", "obj_readable_room1_slash_Other_10_gml_22_0");
        }
        if (global.chapter >= 2)
        {
            msgsetloc(0, "* Underneath the bed is an old cartridge of \"Cat Petters RPG\"./", "obj_readable_room1_slash_Other_10_gml_28_0");
            msgnextloc("* \"catti `& catty\" can be seen faintly written on it in worn gel pen./%", "obj_readable_room1_slash_Other_10_gml_29_0");
        }
    }
    else
    {
        if (global.chapter == 1)
            global.msg[0] = stringsetloc("* It's a computer desk^1.&* There are many boxes under it filled with old books./%", "obj_readable_room1_slash_Other_10_gml_36_0");
        if (global.chapter >= 2)
        {
            msgsetloc(0, "* On the computer's desktop is a folder called \"EPIC games Stuff!!!!\"/", "obj_readable_room1_slash_Other_10_gml_42_0");
            msgnextloc("* It's a poorly-drawn design for a game.../", "obj_readable_room1_slash_Other_10_gml_43_0");
            msgnextloc("* Seems the last boss is a creature with giant rainbow wings./", "obj_readable_room1_slash_Other_10_gml_44_0");
            msgnextloc("* Doesn't seem like this game ever saw the light of day.../%", "obj_readable_room1_slash_Other_10_gml_45_0");
        }
    }
    if (x > 100)
    {
        if (global.chapter == 1)
        {
            global.msg[0] = stringsetloc("* The drawer is mostly empty^1, except for.../", "obj_readable_room1_slash_Other_10_gml_54_0");
            global.msg[1] = stringsetloc("* A school cross country shirt with a tear in it./%", "obj_readable_room1_slash_Other_10_gml_55_0");
            if (global.filechoice == 1)
                global.msg[1] = stringsetloc("* A very old school ID with an embarrassing haircut./%", "obj_readable_room1_slash_Other_10_gml_56_0");
            if (global.filechoice == 2)
            {
                global.msg[1] = stringsetloc("* A coupon book^1.&* Every coupon is for half-off a large pizza./", "obj_readable_room1_slash_Other_10_gml_59_0");
                global.msg[2] = stringsetloc("* All the coupons expired before the book's print date./%", "obj_readable_room1_slash_Other_10_gml_60_0");
            }
            if (read > 0)
                global.msg[0] = stringsetloc("* There's nothing useful in the drawer./%", "obj_readable_room1_slash_Other_10_gml_64_0");
        }
        if (global.chapter >= 2)
        {
            global.msc = 1049;
            scr_text(global.msc);
        }
    }
    if (x > 136)
    {
        if (global.chapter == 1)
            global.msg[0] = stringsetloc("* It's a beautiful day outside./%", "obj_readable_room1_slash_Other_10_gml_80_0");
        if (global.chapter >= 2)
            msgsetloc(0, "* Even after a long night^1, the sunrise is the same as always./%", "obj_readable_room1_slash_Other_10_gml_86_0");
    }
    if (x > 192)
        global.msg[0] = stringsetloc("* Clothes drawer./%", "obj_readable_room1_slash_Other_10_gml_91_0");
    if (x > 220)
    {
        global.msg[0] = stringsetloc("* Your bed./%", "obj_readable_room1_slash_Other_10_gml_96_0");
        if (global.chapter == 1)
        {
            if (global.tempflag[10] == 1 && global.plot < 10)
            {
                global.msc = 402;
                scr_text(global.msc);
            }
            if (global.plot >= 250)
            {
                global.msc = 400;
                scr_text(global.msc);
            }
        }
        if (global.chapter == 2)
        {
            if (global.tempflag[39] == 1 && global.plot < 10)
            {
                global.msc = 402;
                scr_text(global.msc);
            }
        }
    }
    if (x > 250)
        global.msg[0] = stringsetloc("* It's stained./%", "obj_readable_room1_slash_Other_10_gml_112_0");
}
if (room == room_debug_loc)
{
    global.msg[0] = stringsetloc("* The door is locked./%", "obj_readable_room1_slash_Other_10_gml_120_0");
    if (x > 120)
    {
        if (global.chapter == 1)
            global.msg[0] = stringsetloc("* It's only you./%", "obj_readable_room1_slash_Other_10_gml_127_0");
        if (global.chapter >= 2)
            msgsetloc(0, "* (It's what they call \"you.\")/%", "obj_readable_room1_slash_Other_10_gml_133_0");
    }
    if (x > 160)
    {
        if (global.chapter == 1)
            global.msg[0] = stringsetloc("* There are crayons in the drawer^1. Their labels have long faded^1, and there's no green./%", "obj_readable_room1_slash_Other_10_gml_141_0");
        if (global.chapter >= 2)
        {
            msgsetloc(0, "* (..^1. How to Draw Dragons is at the bottom of the drawer.)/", "obj_readable_room1_slash_Other_10_gml_147_0");
            msgnextloc("* (The purple character on the cover is dressed..^1. immodestly.)/", "obj_readable_room1_slash_Other_10_gml_148_0_b");
            msgnextloc("* (...)/", "obj_readable_room1_slash_Other_10_gml_148_0");
            msgnextloc("* (Your brother will never return this book.)/%", "obj_readable_room1_slash_Other_10_gml_150_0");
        }
    }
    if (x > 220)
        global.msg[0] = stringsetloc("* A cactus^1.&* There's not much to say about it./%", "obj_readable_room1_slash_Other_10_gml_169_0");
    if (x > 320)
    {
        if (global.chapter == 1)
        {
            global.msg[0] = stringsetloc("* There are many books./", "obj_readable_room1_slash_Other_10_gml_177_0");
            global.msg[1] = stringsetloc("* Tales of Snails - A Story Book./", "obj_readable_room1_slash_Other_10_gml_178_0");
            global.msg[2] = stringsetloc("* Snails Do Not Have Tails -&A Scientific Refutation./", "obj_readable_room1_slash_Other_10_gml_179_0");
            global.msg[3] = stringsetloc("* Can Snails Help Your Garden? Um, Not Really./", "obj_readable_room1_slash_Other_10_gml_180_0");
            global.msg[4] = stringsetloc("* And a signed copy of The History of Humans and Monsters, by Gerson Boom./%", "obj_readable_room1_slash_Other_10_gml_181_0");
            if (read > 0)
                global.msg[0] = stringsetloc("* There's no time to read anything right now./%", "obj_readable_room1_slash_Other_10_gml_184_0");
        }
        if (global.chapter >= 2)
            msgsetloc(0, "* (There's no time to read books. Just generally.)/%", "obj_readable_room1_slash_Other_10_gml_175_0");
    }
}
if (room == room_krishallway)
{
    global.msg[0] = stringsetloc("* The door is locked./%", "obj_readable_room1_slash_Other_10_gml_120_0");
    if (x > 120)
    {
        if (global.chapter == 1)
            global.msg[0] = stringsetloc("* It's only you./%", "obj_readable_room1_slash_Other_10_gml_127_0");
        if (global.chapter >= 2)
            msgsetloc(0, "* (It's what they call \"you.\")/%", "obj_readable_room1_slash_Other_10_gml_196_0");
    }
    if (x > 160)
    {
        if (global.chapter == 1)
            global.msg[0] = stringsetloc("* There are crayons in the drawer^1. Their labels have long faded^1, and there's no green./%", "obj_readable_room1_slash_Other_10_gml_141_0");
        if (global.chapter >= 2)
        {
            msgsetloc(0, "* (..^1. How to Draw Dragons is at the bottom of the drawer.)/", "obj_readable_room1_slash_Other_10_gml_210_0");
            msgnextloc("* (The purple character on the cover is dressed..^1. immodestly.)/", "obj_readable_room1_slash_Other_10_gml_211_0_b");
            msgnextloc("* (...)/", "obj_readable_room1_slash_Other_10_gml_148_0");
            msgnextloc("* (Your brother will never return this book.)/%", "obj_readable_room1_slash_Other_10_gml_213_0");
        }
    }
    if (x > 220)
        global.msg[0] = stringsetloc("* A cactus^1.&* There's not much to say about it./%", "obj_readable_room1_slash_Other_10_gml_169_0");
    if (x > 320)
    {
        if (global.chapter == 1)
        {
            global.msg[0] = stringsetloc("* There are many books./", "obj_readable_room1_slash_Other_10_gml_177_0");
            global.msg[1] = stringsetloc("* Tales of Snails - A Story Book./", "obj_readable_room1_slash_Other_10_gml_178_0");
            global.msg[2] = stringsetloc("* Snails Do Not Have Tails -&A Scientific Refutation./", "obj_readable_room1_slash_Other_10_gml_179_0");
            global.msg[3] = stringsetloc("* Can Snails Help Your Garden? Um, Not Really./", "obj_readable_room1_slash_Other_10_gml_180_0");
            global.msg[4] = stringsetloc("* And a signed copy of The History of Humans and Monsters, by Gerson Boom./%", "obj_readable_room1_slash_Other_10_gml_181_0");
            if (read > 0)
                global.msg[0] = stringsetloc("* There's no time to read anything right now./%", "obj_readable_room1_slash_Other_10_gml_184_0");
        }
        if (global.chapter >= 2)
            msgsetloc(0, "* (There's no time to read books. Just generally.)/%", "obj_readable_room1_slash_Other_10_gml_253_0");
    }
}
if (room == room_torhouse)
{
    if (x > 190)
        global.msg[0] = stringsetloc("* There's a photo on the fridge^1. It's of you^1, your mother, and your brother./%", "obj_readable_room1_slash_Other_10_gml_200_0");
    if (x > 220)
        global.msg[0] = stringsetloc("* There is some white fur stuck in the drain./%", "obj_readable_room1_slash_Other_10_gml_211_0");
    if (x > 260)
    {
        global.msg[0] = stringsetloc("* There's some cinnamony batter caked on the stovetop./%", "obj_readable_room1_slash_Other_10_gml_217_0");
        if (global.plot >= 250)
            global.msg[0] = stringsetloc("* (It's a butterscotch-cinnamon pie.^1)&* (It's still cooling.)/%", "obj_readable_room1_slash_Other_10_gml_220_0");
    }
    if (x > 300)
        global.msg[0] = stringsetloc("* (Cookie cutters for gingerbread monsters and gingerbread humans.)/%", "obj_readable_room1_slash_Other_10_gml_226_0");
    if (x > 340)
    {
        global.msg[0] = stringsetloc("* It's a trashcan^1.&* Somehow^1, it's emitting a pleasant floral scent./%", "obj_readable_room1_slash_Other_10_gml_231_0");
        if (global.flag[262] >= 4)
            global.msg[0] = stringsetloc("* It's a trashcan^1.&* Somehow^1, its floral scent has increased./%", "obj_readable_room1_slash_Other_10_gml_234_0");
    }
    if (x > 369)
        global.msg[0] = stringsetloc("* It's a landline phone^1.&* But you already have a cell phone./%", "obj_readable_room1_slash_Other_10_gml_240_0");
    if (x > 440)
    {
        if (global.chapter == 1)
            global.msg[0] = stringsetloc("* It's the TV^1.&* Doesn't seem to even be plugged in anymore./%", "obj_readable_room1_slash_Other_10_gml_245_0");
        else
            msgsetloc(0, "* (It's the TV^1.)&* (Looks like it's plugged in, but it's dusty.)/%", "obj_readable_room1_slash_Other_10_gml_320_0");
    }
    if (x > 560)
        global.msg[0] = stringsetloc("* It's a book of hymns./%", "obj_readable_room1_slash_Other_10_gml_251_0");
}
if (room == room_torbathroom)
{
    if (global.chapter == 1)
    {
        if (x >= 100)
        {
            global.msg[0] = stringsetloc("* On the shower ledge^1, there's a small container of apple-scented shampoo./", "obj_readable_room1_slash_Other_10_gml_263_0");
            global.msg[1] = stringsetloc("* ... and a gallon-sized container of pet shampoo./%", "obj_readable_room1_slash_Other_10_gml_264_0");
        }
        if (x >= 160 && x <= 190)
        {
            global.msc = 355;
            scr_text(global.msc);
        }
        if (x >= 190)
        {
            global.msg[0] = stringsetloc("* You looked inside the sink cupboard^1.&* There's.../", "obj_readable_room1_slash_Other_10_gml_273_0");
            global.msg[1] = stringsetloc("* A can of Ice-E's Cool Boys Body Spray \"Spray For The Boys,\" Flamin' Hot Pizza Flavor./", "obj_readable_room1_slash_Other_10_gml_274_0");
            global.msg[2] = stringsetloc("* It seems to be almost entirely full./%", "obj_readable_room1_slash_Other_10_gml_275_0");
        }
    }
    if (global.chapter >= 2)
    {
        if (x >= 100)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (The apple-scented shampoo feels lighter than usual.)/%", "obj_readable_room1_slash_Other_10_gml_354_0");
        }
        if (x >= 160 && x <= 190)
        {
            global.msc = 355;
            scr_text(global.msc);
        }
        if (x >= 190)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Your hands are clean.)/%", "obj_readable_room1_slash_Other_10_gml_392_0");
        }
    }
}
if (room == room_schoollobby)
{
    if (x >= 140 && x < 240)
    {
        if (tempvar == 0)
            global.msg[0] = stringsetloc("* The locker is locked./%", "obj_readable_room1_slash_Other_10_gml_335_0");
        if (tempvar == 1)
            global.msg[0] = stringsetloc("* The locker's lock is locked./%", "obj_readable_room1_slash_Other_10_gml_336_0");
        if (tempvar == 2)
            global.msg[0] = stringsetloc("* The lock's locker is locked./%", "obj_readable_room1_slash_Other_10_gml_337_0");
        if (tempvar == 3)
            global.msg[0] = stringsetloc("* The locker's lock's locker is locked./%", "obj_readable_room1_slash_Other_10_gml_338_0");
        if (tempvar >= 4)
            global.msg[0] = stringsetloc("* The locker is locked./%", "obj_readable_room1_slash_Other_10_gml_339_0");
        with (obj_readable_room1)
            tempvar += 1;
    }
    if (x == 240)
        global.msg[0] = stringsetloc("* (The locker is covered in Jockington memorabilia.)/%", "obj_readable_room1_slash_Other_10_gml_344_0");
    if (x >= 280)
    {
        global.msg[0] = stringsetloc("* (Are you ready for the Sadie Hawkman's dance?)/", "obj_readable_room1_slash_Other_10_gml_349_0");
        global.msg[1] = stringsetloc("* (At this dance^1, all the chaperones wear giant hawk heads...)/", "obj_readable_room1_slash_Other_10_gml_350_0");
        global.msg[2] = stringsetloc("* (... and screech at any students that make contact while dancing.)/%", "obj_readable_room1_slash_Other_10_gml_351_0");
    }
    if (x < 140)
    {
        global.msg[0] = stringsetloc("* (You look through the frosted window.)/", "obj_readable_room1_slash_Other_10_gml_356_0");
        global.msg[1] = stringsetloc("* (A blurry yellow object is teaching a bunch of blurry bored-looking objects.)/%", "obj_readable_room1_slash_Other_10_gml_357_0");
    }
    if (x >= 520)
    {
        global.msg[0] = stringsetloc("* (You ran the water fountain.^1)&* (It's lukewarm.)/%", "obj_readable_room1_slash_Other_10_gml_362_0");
        if (read == 1)
            global.msg[0] = stringsetloc("* (You ran the water fountain.^1)&* (It's tepid.)/%", "obj_readable_room1_slash_Other_10_gml_363_0");
        if (read >= 2)
            global.msg[0] = stringsetloc("* (You ran the water fountain.^1)&* (It's refreshingly cool.)/%", "obj_readable_room1_slash_Other_10_gml_364_0");
        if (global.plot < 8)
        {
            global.msg[0] = stringsetloc("* (You drank from the water fountain.)/", "obj_readable_room1_slash_Other_10_gml_368_0");
            scr_susface(1, 1);
            global.msg[2] = stringsetloc("* Heheh^1, people put their mouth on that^1, ya know./%", "obj_readable_room1_slash_Other_10_gml_370_0");
            if (read >= 1)
            {
                scr_susface(0, 9);
                global.msg[1] = stringsetloc("* That wasn't ENCOURAGEMENT^1, dumbass!/%", "obj_readable_room1_slash_Other_10_gml_375_0");
            }
        }
    }
    if (x >= 560)
    {
        global.msg[0] = stringsetloc("* Do you like^1, breathing^1? Moving fast^1, with or without^1, legs?/", "obj_readable_room1_slash_Other_10_gml_382_0");
        global.msg[1] = stringsetloc("* But usually^1, with legs?/", "obj_readable_room1_slash_Other_10_gml_383_0");
        global.msg[2] = stringsetloc("* Join the Cross Country Team with Jockington^1, and Noelle!/%", "obj_readable_room1_slash_Other_10_gml_384_0");
    }
    if (x >= 690)
        global.msg[0] = stringsetloc("* (Locker^1. It's locked.)/%", "obj_readable_room1_slash_Other_10_gml_390_0");
    if (x == 760)
        global.msg[0] = stringsetloc("* (This used to be your brother's locker.)/%", "obj_readable_room1_slash_Other_10_gml_396_0");
    if (x == 780)
        global.msg[0] = stringsetloc("* (It's your locker.^1)&* (It's empty.)/%", "obj_readable_room1_slash_Other_10_gml_400_0");
}
if (room == room_alphysclass)
{
    global.msg[0] = stringsetloc("* (You checked the time.)/", "obj_readable_room1_slash_Other_10_gml_409_0");
    global.msg[1] = stringsetloc("* (... It seems to be time for class.)/%", "obj_readable_room1_slash_Other_10_gml_410_0");
    if (global.plot >= 0)
    {
        global.msg[0] = stringsetloc("* (You checked the time.)/", "obj_readable_room1_slash_Other_10_gml_414_0");
        global.msg[1] = stringsetloc("* (... It seems to not be time for class.)/%", "obj_readable_room1_slash_Other_10_gml_415_0");
    }
    if (x > 240)
    {
        global.fe = 1;
        global.fc = 11;
        global.typer = 20;
        global.msg[0] = stringsetloc("* Um^1, Kris^1, the hope is that you.../", "obj_readable_room1_slash_Other_10_gml_423_0");
        global.msg[1] = stringsetloc("\\E0* ... choose someone in the class?/%", "obj_readable_room1_slash_Other_10_gml_424_0");
    }
    if (x < 200)
    {
        if (global.chapter == 1)
        {
            global.msg[0] = stringsetloc("* (The computer's wallpaper is a rotating slideshow of nature images.)/", "obj_readable_room1_slash_Other_10_gml_431_0");
            global.msg[1] = stringsetloc("* (... and^1, rarely, an image of two buff superheroes embracing^1, blushing.)/%", "obj_readable_room1_slash_Other_10_gml_432_0");
            if (global.plot >= 250)
            {
                global.msg[0] = stringsetloc("* (The computer is turned off.)/", "obj_readable_room1_slash_Other_10_gml_436_0");
                global.msg[1] = stringsetloc("* (Everything felt peaceful for a moment.)/%", "obj_readable_room1_slash_Other_10_gml_437_0");
            }
        }
        if (global.chapter >= 2)
        {
            msgsetloc(0, "* (The computer wallpaper is updated.)/", "obj_readable_room1_slash_Other_10_gml_511_0");
            msgnextloc("* (The buff embracing heroes are now edited to be 4 inches apart.)/", "obj_readable_room1_slash_Other_10_gml_512_0");
            msgnextloc("* (There's dialogue about proper distancing at the school dance.)/", "obj_readable_room1_slash_Other_10_gml_513_0");
            msgnextloc("* (You wonder if your mother had some influence on this change.)/%", "obj_readable_room1_slash_Other_10_gml_514_0");
        }
    }
    if (x < 150)
        global.msg[0] = stringsetloc("* (It's a bunch of roses.)/%", "obj_readable_room1_slash_Other_10_gml_453_0");
    if (x < 80)
    {
        global.msg[0] = stringsetloc("* (Looks like motivational quotes from various literature.)/", "obj_readable_room1_slash_Other_10_gml_459_0");
        global.msg[1] = stringsetloc("* \"Try your best^1, Astral Wolf^1!\"&* \"Even in your darkest hour...!\"/", "obj_readable_room1_slash_Other_10_gml_460_0");
        global.msg[2] = stringsetloc("* (... that one seems to be from a video game.)/%", "obj_readable_room1_slash_Other_10_gml_461_0");
    }
}
if (room == room_torielclass)
{
    if (y <= (room_height / 2))
    {
        if (x >= 100)
        {
            global.msg[0] = stringsetloc("* (\"Ms. Toriel\" is written in cursive on the dry-erase board.)/", "obj_readable_room1_slash_Other_10_gml_473_0");
            global.msg[1] = stringsetloc("* (Seems like it hasn't been erased in a very long time.)/%", "obj_readable_room1_slash_Other_10_gml_474_0");
        }
        if (x >= 130)
        {
            if (global.chapter == 1)
            {
                global.msg[0] = stringsetloc("* (It's a computer.)/", "obj_readable_room1_slash_Other_10_gml_480_0");
                global.msg[1] = stringsetloc("* (Its desktop wallpaper is you and your brother dressed up for Halloween 8 years ago.)/%", "obj_readable_room1_slash_Other_10_gml_481_0");
            }
            if (global.chapter >= 2)
            {
                msgsetloc(0, "* (The computer wallpaper is updated.)/", "obj_readable_room1_slash_Other_10_gml_554_0");
                msgnextloc("* (It's a picture of your brother and you playing video games.)/", "obj_readable_room1_slash_Other_10_gml_555_0");
                msgnextloc("* (Your brother is using the knockoff controller.)/%", "obj_readable_room1_slash_Other_10_gml_556_0");
            }
        }
        if (x >= 170)
        {
            if (global.chapter == 1)
            {
                global.msc = 350;
                scr_text(global.msc);
            }
            if (global.chapter >= 2)
            {
                msgsetloc(0, "* (You uncapped the scented green marker.)/", "obj_readable_room1_slash_Other_10_gml_570_0");
                msgnextloc("* (It's almost dry^1, but that gives it a refined^1, aged apple bouquet.)/%", "obj_readable_room1_slash_Other_10_gml_571_0");
            }
        }
        if (x >= 198)
        {
            if (global.chapter == 1)
                global.msg[0] = stringsetloc("* (Some kind of teacher food.)/%", "obj_readable_room1_slash_Other_10_gml_510_0");
            if (global.chapter >= 2)
                msgsetloc(0, "* (It's an orange. It's unknown if it's safe for teachers to eat this.)/%", "obj_readable_room1_slash_Other_10_gml_583_0");
        }
        if (x >= 204)
        {
            global.msg[0] = stringsetloc("* (It's a poster of several basic shapes.^1)&* (Circle, Oval, Square...)/", "obj_readable_room1_slash_Other_10_gml_521_0");
            global.msg[1] = stringsetloc("* (Hyperdodecahedron...)/%", "obj_readable_room1_slash_Other_10_gml_522_0");
        }
        if (x >= 230)
            global.msg[0] = stringsetloc("* (Kids' books.^1)&* (Some of them used to be yours.)/%", "obj_readable_room1_slash_Other_10_gml_526_0");
        if (x >= 256)
            global.msg[0] = stringsetloc("* (It's a primitive drawing of your mom.)/%", "obj_readable_room1_slash_Other_10_gml_530_0");
    }
    else if (x <= (room_width / 2))
    {
        global.msg[0] = stringsetloc("* (Some kind of primitive sculpture.)&* (Who knows what it represents?)/%", "obj_readable_room1_slash_Other_10_gml_537_0");
    }
    else
    {
        if (global.chapter == 1)
            global.msg[0] = stringsetloc("* (The Throne of the Gods.)/%", "obj_readable_room1_slash_Other_10_gml_543_0");
        if (global.chapter >= 2)
            msgsetloc(0, "* (The Throne of the Gods grows higher.)&* (Is this hubris...?)/%", "obj_readable_room1_slash_Other_10_gml_616_0");
    }
}
if (room == room_schooldoor)
    global.msg[0] = stringsetloc("* (The door is locked.)/%", "obj_readable_room1_slash_Other_10_gml_626_0");
if (room == room_school_unusedroom)
{
    if (x < 80)
        global.msg[0] = stringsetloc("* (The door is locked.)/%", "obj_readable_room1_slash_Other_10_gml_631_0");
    if (x > 100)
        global.msg[0] = stringsetloc("* (It's a worn-down stuffed animal.)/%", "obj_readable_room1_slash_Other_10_gml_632_0");
    if (x > 160 && y < 100)
        global.msg[0] = stringsetloc("* (It's a lightswitch.)/%", "obj_readable_room1_slash_Other_10_gml_633_0");
    if (x > 160 && y > 100)
        global.msg[0] = stringsetloc("* (It's a checkerboard.^1)&* (There are pawns strewn on it.)/%", "obj_readable_room1_slash_Other_10_gml_634_0");
    if (x > 220)
        global.msg[0] = stringsetloc("* (Playing cards spill out of a deck in the closet.)/%", "obj_readable_room1_slash_Other_10_gml_635_0");
    if (x > 250)
    {
        global.msg[0] = stringsetloc("* (It's a yellowed, poorly-drawn picture of a green turtle.)/", "obj_readable_room1_slash_Other_10_gml_638_0");
        global.msg[1] = stringsetloc("* (It's signed 'Alvin.')/%", "obj_readable_room1_slash_Other_10_gml_639_0");
    }
    if (global.chapter >= 2)
    {
        if (x > 160 && y > 100)
            msgsetloc(0, "* (You stared at the checkerboard from the doorway.)/%", "obj_readable_room1_slash_Other_10_gml_644_0");
        if (x > 220)
            msgsetloc(0, "* (Managed to cram everything into the closet^1. Even the rug.)/%", "obj_readable_room1_slash_Other_10_gml_645_0");
    }
}
if (room == room_hospital_lobby)
{
    if (x <= 160)
    {
        if (global.chapter == 1)
        {
            global.msg[0] = stringsetloc("* (It's one of those sliding bead toys that naturally spawns inside doctors' offices.)/", "obj_readable_room1_slash_Other_10_gml_586_0");
            global.msg[1] = stringsetloc("* (The beads march grimly along their set path.)/%", "obj_readable_room1_slash_Other_10_gml_587_0");
        }
        if (global.chapter >= 2)
        {
            if (scr_sideb_get_phase() > 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (It's a toy with beads on a track.)/", "obj_readable_room1_slash_Other_10_gml_667_0_b");
                msgnextloc("* (One of the blue beads is broken and torn off.)/%", "obj_readable_room1_slash_Other_10_gml_668_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (The beads of the toy march on.)/%", "obj_readable_room1_slash_Other_10_gml_672_0");
            }
        }
    }
    if (x >= 160)
    {
        if (global.chapter == 1)
        {
            global.msc = 360;
            scr_text(global.msc);
        }
        if (global.chapter >= 2)
        {
            global.msc = 1155;
            scr_text(global.msc);
        }
    }
}
if (room == room_dw_castle_west_cliff)
{
    if (global.chapter == 1)
    {
        global.typer = 31;
        global.fc = 2;
        global.fe = 1;
        global.msg[0] = stringsetloc("* Come to think of it^1, how did Lancer get up there...?/", "obj_readable_room1_slash_Other_10_gml_614_0");
        global.msg[1] = stringsetloc("\\E6* I suppose he rode his bike up the side of the cliff...?/%", "obj_readable_room1_slash_Other_10_gml_615_0");
    }
    if (global.chapter >= 2)
    {
        scr_speaker("none");
        msgsetloc(0, "* (The rubble on the ground seems to have been dusted and polished.)/", "obj_readable_room1_slash_Other_10_gml_716_0");
        msgnextloc("* (Someone around here really cares about the details.)/%", "obj_readable_room1_slash_Other_10_gml_717_0");
        if (global.chapter == 2 && global.plot >= 10)
        {
            if (obj_mainchara.x > 280 && obj_mainchara.x < 360)
            {
                if (global.plot >= 200 && global.flag[309] < 9)
                    global.tempflag[36] = 3;
                if (global.tempflag[36] == 1 || global.tempflag[36] == 2)
                {
                    global.msc = 1240;
                    scr_text(global.msc);
                }
                else
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* (There's a hole in the wall...)/", "obj_readable_room1_slash_Other_10_gml_740_0");
                    msgnextloc("* (There's nothing inside.)/%", "obj_readable_room1_slash_Other_10_gml_741_0");
                }
            }
        }
    }
}
if (room == room_dw_castle_east_door)
{
    if (global.chapter >= 2)
    {
        scr_speaker("none");
        msgsetloc(0, "* (It seems to be locked.^1)&* (It may never open again.)/%", "obj_readable_room1_slash_Other_10_gml_727_0");
    }
}
if (room == room_cc_clover)
{
    if (x < 90)
    {
        if (global.flag[412] == 0)
            global.flag[412] = 1;
    }
    global.msg[0] = stringsetloc("* (It's a bed for three people^1, or one three-headed person.)/%", "obj_readable_room1_slash_Other_10_gml_662_0");
    if (x > (room_width / 2))
    {
        if (y < (room_height / 2))
        {
            global.msg[0] = stringsetloc("* (It's a giant baseball.^1)&* (For parties.)/%", "obj_readable_room1_slash_Other_10_gml_667_0");
            if (read >= 1)
            {
                global.msg[0] = stringsetloc("* (Actually^1, seems the giant baseball is a soccer ball that's been painted over.)/", "obj_readable_room1_slash_Other_10_gml_670_0");
                global.msg[1] = stringsetloc("* (It would be easier to draw that way.)/%", "obj_readable_room1_slash_Other_10_gml_671_0");
            }
        }
        else
        {
            global.msg[0] = stringsetloc("* (It's a tree.^1)&* (For parties.)/%", "obj_readable_room1_slash_Other_10_gml_676_0");
        }
    }
}
if (room == room_cc_lancer)
{
    if (y <= 220)
    {
        if (x < 200)
        {
            if (global.flag[411] == 0)
                global.flag[411] = 1;
            if (i_ex(obj_npc_room))
            {
                scr_speaker("lancer");
                msgsetloc(0, "\\E1* Wow!^1! It's better than I remember!!!!!/", "obj_readable_room1_slash_Other_10_gml_789_0");
                msgnextloc("\\E2* I even have my own bed now!!!/", "obj_readable_room1_slash_Other_10_gml_790_0");
                msgnextloc("\\E3* Now I don't have to sleep in a hole anymore!!!/", "obj_readable_room1_slash_Other_10_gml_791_0_b");
                scr_anyface_next("ralsei", "K");
                msgnextloc("\\EK* I thought you..^1. already had a bed./", "obj_readable_room1_slash_Other_10_gml_793_0_b");
                scr_anyface_next("lancer", "3");
                msgnextloc("\\E3* No^1, that was for the bike./%", "obj_readable_room1_slash_Other_10_gml_795_0");
            }
            else
            {
                scr_speaker("no one");
                msgsetloc(0, "* (It's a bikeless bed.)/%", "obj_readable_room1_slash_Other_10_gml_812_0");
            }
        }
        if (x > 300 && x < 350)
            global.msg[0] = stringsetloc("* (It's a hole^1. Presumably dug for fun.)/%", "obj_readable_room1_slash_Other_10_gml_698_0");
        if (x > 350 && x < 400)
        {
            global.msc = 430;
            scr_text(global.msc);
        }
        if (x >= 400)
            global.msg[0] = stringsetloc("* (It's some kind of digging implement.)/%", "obj_readable_room1_slash_Other_10_gml_707_0");
    }
    else
    {
        if (x < 200)
        {
            global.msg[0] = stringsetloc("* (You found 20 Rupys in the hole!)/", "obj_readable_room1_slash_Other_10_gml_714_0");
            global.msg[1] = stringsetloc("* (Unfortunately^1, that's not a useful currency here...)/%", "obj_readable_room1_slash_Other_10_gml_715_0");
        }
        if (x > 250 && x < 320)
            global.msg[0] = stringsetloc("* (It's a hole made recreationally.)/%", "obj_readable_room1_slash_Other_10_gml_719_0");
        if (x > 320)
            global.msg[0] = stringsetloc("* (There's salsa buried in the ground here.)/%", "obj_readable_room1_slash_Other_10_gml_723_0");
    }
}
if (room == room_hospital_rudy)
{
    if (x <= 75 && y < 160)
    {
        if (global.chapter == 1)
        {
            global.msg[0] = stringsetloc("* (It's an angel doll.^1)&* (Its lack of facial features is unsettling.)/", "obj_readable_room1_slash_Other_10_gml_734_0");
            scr_rudface(1, 0);
            global.msg[2] = stringsetloc("* That angel^1?&* Noelle n' Dess made it in youth group./", "obj_readable_room1_slash_Other_10_gml_736_0");
            global.msg[3] = stringsetloc("\\E2* It's kind of like a good luck charm to me now./", "obj_readable_room1_slash_Other_10_gml_737_0");
            global.msg[4] = stringsetloc("\\E4* Oh^1, right^1, you and Azzy tried to make one too.../", "obj_readable_room1_slash_Other_10_gml_738_0");
            global.msg[5] = stringsetloc("\\E7* But you wasted the whole time making huge wings for it!/%", "obj_readable_room1_slash_Other_10_gml_739_0");
            if (read >= 1)
                global.msg[0] = stringsetloc("* (It's an angel doll.^1)&* (Its lack of facial features is unsettling.)/%", "obj_readable_room1_slash_Other_10_gml_742_0");
        }
        if (global.chapter >= 2)
        {
            if (read == 0)
            {
                scr_speaker("susie");
                msgsetloc(0, "\\EC* ..^1. so why do you collect creepy dolls?/", "obj_readable_room1_slash_Other_10_gml_855_0_b");
                scr_anyface_next("rudy", "0");
                msgnextloc("\\E0* Hey^1, Noelle and her sister made that. Respect it!/", "obj_readable_room1_slash_Other_10_gml_857_0");
                scr_anyface_next("susie", "K");
                msgnextloc("\\E0* (Noelle's sister...)/%", "obj_readable_room1_slash_Other_10_gml_859_0");
            }
            else
            {
                scr_speaker("susie");
                msgsetloc(0, "\\EC* (...)/%", "obj_readable_room1_slash_Other_10_gml_863_0");
            }
        }
    }
    if (x <= 75 && y > 160)
    {
        if (global.chapter == 1)
        {
            if (global.flag[255] < 2)
            {
                global.typer = 55;
                global.fc = 15;
                global.fe = 4;
                global.msg[0] = stringsetloc("* Oh^1, so you're just here to use the sink^1, huh?/", "obj_readable_room1_slash_Other_10_gml_754_0");
                global.msg[1] = stringsetloc("\\E7* Come on^1, Kris^1!&* Be a little friendlier!/%", "obj_readable_room1_slash_Other_10_gml_755_0");
            }
            else
            {
                global.msg[0] = stringsetloc("* (It's a sink.)/", "obj_readable_room1_slash_Other_10_gml_759_0");
                scr_rudface(1, 2);
                global.msg[2] = stringsetloc("* Hey^1, Kris^1, is that sink really more interesting than me?/%", "obj_readable_room1_slash_Other_10_gml_761_0");
            }
        }
        if (global.chapter >= 2)
        {
            if (global.flag[461] == 0)
                global.flag[461] = 1;
            var sinkcheck = global.flag[278] == 1;
            if (sinkcheck)
            {
                scr_speaker("rudy");
                msgsetloc(0, "\\E2* Dammit all^1, Kris^1! You really love that sink^1, huh?/", "obj_readable_room1_slash_Other_10_gml_895_0");
                msgnextloc("\\E0* That's Sink 2^1, Rudy 0./", "obj_readable_room1_slash_Other_10_gml_896_0");
                msgnextloc("\\E2* Don't worry^1, I'm gonna pull it back^1! You wait!/%", "obj_readable_room1_slash_Other_10_gml_897_0_b");
            }
            else if (read == 0)
            {
                scr_speaker("susie");
                msgsetloc(0, "\\E0* ..^1. hey^1, Kris^1, why are you checking the sink?/", "obj_readable_room1_slash_Other_10_gml_903_0");
                scr_anyface_next("rudy", "7");
                msgnextloc("\\E7* That's what I'M asking^1, sweetheart!/%", "obj_readable_room1_slash_Other_10_gml_905_0_b");
            }
            else
            {
                scr_speaker("rudy");
                msgsetloc(0, "\\E0* Practicing for tonight's.../", "obj_readable_room1_slash_Other_10_gml_909_0");
                msgnextloc("\\E2* Handwashing marathon^1, Kris?/%", "obj_readable_room1_slash_Other_10_gml_910_0");
            }
        }
    }
    if (x >= 95 && x <= 105)
    {
        global.msg[0] = stringsetloc("* (Patient Name:)&* (Rudolph \"Rudy\" Holiday)/", "obj_readable_room1_slash_Other_10_gml_771_0");
        scr_rudface(1, 2);
        global.msg[2] = stringsetloc("* Hey Kris^1, you forget my name or something!?/%", "obj_readable_room1_slash_Other_10_gml_773_0");
        if (read >= 1)
        {
            scr_rudface(1, 2);
            global.msg[2] = stringsetloc("* Kris^1, you jealous you don't have your own wall plaque?/", "obj_readable_room1_slash_Other_10_gml_777_0");
            global.msg[3] = stringsetloc("* Amazing what's being done with our taxpayer dollars^1, huh?/%", "obj_readable_room1_slash_Other_10_gml_778_0");
        }
    }
    if (x == 205)
    {
        if (global.chapter == 1)
        {
            global.msg[0] = stringsetloc("* (It's a bunch of roses in a glass container.)/", "obj_readable_room1_slash_Other_10_gml_784_0");
            scr_rudface(1, 4);
            global.msg[2] = stringsetloc("* Hey^1, I'm happy your dad brought me flowers^1, but.../", "obj_readable_room1_slash_Other_10_gml_786_0");
            global.msg[3] = stringsetloc("\\E2* Roses!^1? What is this^1, man^1? Beauty and the Beast?/", "obj_readable_room1_slash_Other_10_gml_787_0");
            global.msg[4] = stringsetloc("\\E7* That ain't gonna work^1, man^1! We're both beasts!/%", "obj_readable_room1_slash_Other_10_gml_788_0");
            if (read >= 1)
            {
                global.msg[0] = stringsetloc("* (It's a bunch of roses.^1)&* (They seem healthy.)/", "obj_readable_room1_slash_Other_10_gml_791_0");
                scr_rudface(1, 0);
                global.msg[2] = stringsetloc("* Kris^1, I love your dad^1, but.../", "obj_readable_room1_slash_Other_10_gml_793_0");
                global.msg[3] = stringsetloc("\\E7* Asgore^1, if you wanna go to prom with me^1, just ask!/%", "obj_readable_room1_slash_Other_10_gml_794_0");
            }
        }
        if (global.chapter >= 2)
        {
            if (read == 0)
            {
                scr_speaker("susie");
                msgsetloc(0, "\\EA* Woah^1, the hell is bringing you flowers?/", "obj_readable_room1_slash_Other_10_gml_952_0");
                scr_anyface_next("rudy", "3");
                msgnextloc("\\E3* Hey^1, what's wrong with a married man getting flowers?/", "obj_readable_room1_slash_Other_10_gml_954_0");
                scr_anyface_next("susie", "K");
                msgnextloc("\\EK* ..^1. So your^1, uh^1, wife gave them to you?/", "obj_readable_room1_slash_Other_10_gml_956_0");
                scr_anyface_next("rudy", 2);
                msgnextloc("\\E2* Nah^1, HAHAHA^1! I'm messin with ya^1! Kris's dad did!/", "obj_readable_room1_slash_Other_10_gml_958_0");
                scr_anyface_next("susie", "K");
                msgnextloc("\\EK* (Not gonna try to understand this.)/%", "obj_readable_room1_slash_Other_10_gml_960_0");
            }
            else
            {
                scr_speaker("rudy");
                msgsetloc(0, "\\E7* Flowers? I'm trying to heal^1, man^1! Not get hayfever!/", "obj_readable_room1_slash_Other_10_gml_964_0");
                scr_anyface_next("susie", 12);
                msgnextloc("\\EC* ..^1. Should Kris tell him to stop?/", "obj_readable_room1_slash_Other_10_gml_966_0");
                scr_anyface_next("rudy", 2);
                msgnextloc("\\E2* What? Hell no^1! When did I say that? Hahaha!/%", "obj_readable_room1_slash_Other_10_gml_968_0");
            }
        }
    }
    if (x > 215)
    {
        global.msg[0] = stringsetloc("* (It's a get well soon card from your mom.^1)&* (It's signed inside.)/", "obj_readable_room1_slash_Other_10_gml_801_0");
        scr_rudface(1, 0);
        global.msg[2] = stringsetloc("* Hey^1, Kris^1, you KNOW you signed the inside^1, right?/", "obj_readable_room1_slash_Other_10_gml_803_0");
        global.msg[3] = stringsetloc("\\E2* Why are you staring at it like you haven't seen it before?/", "obj_readable_room1_slash_Other_10_gml_804_0");
        global.msg[4] = stringsetloc("\\E7* Is your penmanship that good??? Was I not moved enough???/%", "obj_readable_room1_slash_Other_10_gml_805_0");
    }
    if (x > 230)
        global.msg[0] = stringsetloc("* (It's a chair.)/%", "obj_readable_room1_slash_Other_10_gml_813_0");
}
if (room == room_hospital_hallway)
    global.msg[0] = stringsetloc("* (It's a diagram showing a bunch of lines and a circle.)/%", "obj_readable_room1_slash_Other_10_gml_819_0");
if (room == room_hospital_room2)
{
    if (y >= 160)
    {
        global.msg[0] = stringsetloc("* (It's a regular sink.)/%", "obj_readable_room1_slash_Other_10_gml_826_0");
        if (tempvar >= 1)
        {
            global.msg[0] = stringsetloc("* (It's a clone of the other sink.)/", "obj_readable_room1_slash_Other_10_gml_829_0");
            global.msg[1] = stringsetloc("* (Perhaps there was originally one tall sink that was cut in half to create both of them.)/%", "obj_readable_room1_slash_Other_10_gml_830_0");
        }
        with (obj_readable_room1)
        {
            if (y >= 160)
                tempvar += 1;
        }
    }
    else
    {
        if (x <= 140)
        {
            global.msg[0] = stringsetloc("* (You looked inside the cupboard.)/", "obj_readable_room1_slash_Other_10_gml_843_0");
            global.msg[1] = stringsetloc("* (... a very small obligatory piano is hiding inside.)/%", "obj_readable_room1_slash_Other_10_gml_844_0");
        }
        if (x >= 150)
        {
            global.msg[0] = stringsetloc("* (It's a classic 1-to-10 pain scale^1, using ICE-E as a model.)/", "obj_readable_room1_slash_Other_10_gml_848_0");
            global.msg[1] = stringsetloc("* (At 0 pain^1, he's happy.^1)&* (At 10 pain^1, he's happy and sweating.)/%", "obj_readable_room1_slash_Other_10_gml_849_0");
        }
        if (x >= 200)
        {
            if (global.chapter == 1)
            {
                global.msg[0] = stringsetloc("* This castle's WHITE WIZARDs relegated me to this HEALING CHAMBER.../", "obj_readable_room1_slash_Other_10_gml_855_0");
                global.msg[1] = stringsetloc("* But my BLOOD is BOILING FOR BATTLE!!!/%", "obj_readable_room1_slash_Other_10_gml_856_0");
            }
            if (global.chapter >= 2)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (Looks like she's resting her voice.)/%", "obj_readable_room1_slash_Other_10_gml_1036_0");
            }
        }
    }
}
if (room == room_library)
{
    if (x < 80)
    {
        if (global.chapter == 1)
        {
            global.msg[0] = stringsetloc("* \"Lord of the Hammer\"/", "obj_readable_room1_slash_Other_10_gml_875_0");
            global.msg[1] = stringsetloc("* (First in the award-winning fiction series by lauded historian Gerson Boom.)/%", "obj_readable_room1_slash_Other_10_gml_876_0");
        }
        if (global.chapter >= 2)
        {
            if (scr_havechar(2))
            {
                if (read == 0)
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* (It's the Lord of the Hammer series.)/", "obj_readable_room1_slash_Other_10_gml_1062_0");
                    scr_anyface_next("susie", "Y");
                    msgnextloc("\\EY* Hahaha^1, Kris^1, you READ that nerdy stuff? Heh!/", "obj_readable_room1_slash_Other_10_gml_1064_0");
                    msgnextloc("\\EA* Giant swords^1, hammers^1, bloody battles.../", "obj_readable_room1_slash_Other_10_gml_1065_0");
                    msgnextloc("\\EK* ..^1. uh^1, so if there's any cool parts^1, you'd tell me^1, right?/%", "obj_readable_room1_slash_Other_10_gml_1066_0");
                }
                else
                {
                    scr_speaker("susie");
                    msgsetloc(0, "\\EK* Heh^1, can't believe you read things with^1, uh..^1. words./%", "obj_readable_room1_slash_Other_10_gml_1070_0");
                }
            }
            else
            {
                global.msg[0] = stringsetloc("* \"Lord of the Hammer\"/", "obj_readable_room1_slash_Other_10_gml_875_0");
                global.msg[1] = stringsetloc("* (First in the award-winning fiction series by lauded historian Gerson Boom.)/%", "obj_readable_room1_slash_Other_10_gml_876_0");
            }
        }
        if (y > 80)
        {
            if (global.chapter == 1)
            {
                global.msg[0] = stringsetloc("* (It's an unlabelled book. You look inside...)/", "obj_readable_room1_slash_Other_10_gml_881_0");
                global.msg[1] = stringsetloc("* oh.... i accidentally returned my personal journal instead of my book.../", "obj_readable_room1_slash_Other_10_gml_882_0");
                global.msg[2] = stringsetloc("* oh no.... they're putting it into their catalogue.../", "obj_readable_room1_slash_Other_10_gml_883_0");
                global.msg[3] = stringsetloc("* oh no... i have to take it out every time i want to write a new entry.../%", "obj_readable_room1_slash_Other_10_gml_884_0");
            }
            if (global.chapter >= 2)
            {
                global.msc = 1159;
                scr_text(global.msc);
            }
        }
    }
    if (x > 70)
    {
        if (global.chapter == 1)
        {
            global.msg[0] = stringsetloc("* \"Please remember my name. Please. I wrote a book to help you remember.\"/", "obj_readable_room1_slash_Other_10_gml_892_0");
            global.msg[1] = stringsetloc("* (By Hots Fireguy)/%", "obj_readable_room1_slash_Other_10_gml_893_0");
        }
        if (global.chapter >= 2)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (It's a book of magic tricks.)/", "obj_readable_room1_slash_Other_10_gml_1110_0");
            msgnextloc("* (Most of them require orbs or floating hands.)/%", "obj_readable_room1_slash_Other_10_gml_1111_0_b");
        }
        if (y > 80)
        {
            var have_susie = global.chapter >= 2 && scr_havechar(2);
            if (have_susie)
            {
                if (read == 0)
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* (There's a book here.^1)&* (You licked the page...)/", "obj_readable_room1_slash_Other_10_gml_1124_0");
                    scr_anyface_next("susie", 0);
                    msgnextloc("* Hey^1, Kris^1, what the HELL are you doing?/", "obj_readable_room1_slash_Other_10_gml_1126_0_b");
                    msgnextloc("\\E5* There's a thing called sharing^1, dumbass. Heard of it?/%", "obj_readable_room1_slash_Other_10_gml_1127_0");
                }
                else
                {
                    scr_speaker("susie");
                    msgsetloc(0, "\\E2* Look^1, the books are public for a reason./%", "obj_readable_room1_slash_Other_10_gml_1131_0");
                }
            }
            else
            {
                global.msg[0] = stringsetloc("* (There's a book here.^1)&* (You lick the page...^1)&* (It's delicious!)/", "obj_readable_room1_slash_Other_10_gml_897_0");
                global.msg[1] = stringsetloc("* (This must be what they meant by flavor text.)/%", "obj_readable_room1_slash_Other_10_gml_898_0");
            }
        }
    }
    if (x > 110)
    {
        global.msg[0] = stringsetloc("* (Computer Lab.^1)&* (Please surf the web responsibly.)/", "obj_readable_room1_slash_Other_10_gml_905_0");
        global.msg[1] = stringsetloc("* (In fact^1, maybe don't do it at all.)/%", "obj_readable_room1_slash_Other_10_gml_906_0");
    }
    if (x > 135)
    {
        if (global.chapter == 1)
        {
            global.msg[0] = stringsetloc("* (You looked through the window to the computer lab...)/", "obj_readable_room1_slash_Other_10_gml_911_0");
            global.msg[1] = stringsetloc("* (There seems to be a dog inside working at a computer...)/", "obj_readable_room1_slash_Other_10_gml_912_0");
            global.msg[2] = stringsetloc("* (Seems like it's making a game...)/", "obj_readable_room1_slash_Other_10_gml_913_0");
            global.msg[3] = stringsetloc("* (Seems like you shouldn't interrupt it...)/", "obj_readable_room1_slash_Other_10_gml_914_0");
            global.msg[4] = stringsetloc("* (Seems like when the game's finished^1, you can go in...)/", "obj_readable_room1_slash_Other_10_gml_915_0");
            global.msg[5] = stringsetloc("* (You just have to trust the dog...)/%", "obj_readable_room1_slash_Other_10_gml_916_0");
            if (read >= 1)
            {
                global.msg[0] = stringsetloc("* (You looked through the window to the computer lab...)/", "obj_readable_room1_slash_Other_10_gml_920_0");
                global.msg[1] = stringsetloc("* (Now the dog is just playing the maracas...)/", "obj_readable_room1_slash_Other_10_gml_921_0");
                global.msg[2] = stringsetloc("* (It's not doing any work...)/", "obj_readable_room1_slash_Other_10_gml_922_0");
                global.msg[3] = stringsetloc("* (This might take a while...)/%", "obj_readable_room1_slash_Other_10_gml_923_0");
            }
        }
        if (global.chapter == 2)
        {
            if (global.plot <= 205)
                global.msg[0] = stringsetloc("* No reason to go back in there./%", "obj_readable_room1_slash_Other_10_gml_1172_0_b");
        }
    }
    if (x > 190)
    {
        if (global.chapter >= 1)
        {
            scr_speaker("no_name");
            global.msg[0] = stringsetloc("* (There's a crude drawing of an ice-cube wearing a headband.)/", "obj_readable_room1_slash_Other_10_gml_931_0");
            global.msg[1] = stringsetloc("* (\"The TeenZone: Where Teen's Can Be Kid's.\")/", "obj_readable_room1_slash_Other_10_gml_932_0");
            global.msg[2] = stringsetloc("* (A feeling of immense relief washes over you.)/%", "obj_readable_room1_slash_Other_10_gml_933_0");
        }
    }
    if (x > 220)
    {
        if (global.chapter == 1)
        {
            scr_speaker("no_name");
            global.msc = 185;
            scr_text(global.msc);
        }
        if (global.chapter >= 2)
        {
            if (scr_havechar(2))
            {
                scr_speaker("susie");
                msgsetloc(0, "* (Kris^1, we could go anywhere...)/", "obj_readable_room1_slash_Other_10_gml_1193_0");
                msgnextloc("\\E1* (And you brought us to the Teen Zone.)/%", "obj_readable_room1_slash_Other_10_gml_1194_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (It's the weekly cartoon review.)/", "obj_readable_room1_slash_Other_10_gml_1198_0");
                msgnextloc("* (Just looking at cartoon criticism is sapping your energy rapidly.)/%", "obj_readable_room1_slash_Other_10_gml_1199_0");
            }
        }
    }
}
if (room == room_graveyard)
{
    global.msg[0] = stringsetloc("* GERSON&* RENOWNED HISTORIAN, AUTHOR, AND TEACHER/%", "obj_readable_room1_slash_Other_10_gml_948_0");
    if (x >= 150)
        global.msg[0] = stringsetloc("* CRYSTAL&* A SNOWY GEMSTONE FOR A PROUD MOTHER/%", "obj_readable_room1_slash_Other_10_gml_951_0");
    if (x >= 200)
        global.msg[0] = stringsetloc("* MUTTLER&* A BIG BONE FOR THE LEADER OF THE PACK/%", "obj_readable_room1_slash_Other_10_gml_955_0");
    if (x >= 290)
    {
        if (global.chapter == 1)
            global.msg[0] = stringsetloc("* SHYRA&* A KARAOKE MICROPHONE FOR A BRAVE SINGER/%", "obj_readable_room1_slash_Other_10_gml_961_0");
        if (global.chapter >= 2)
        {
            scr_speaker("susie");
            msgsetloc(0, "* ..^1. So^1, uh^1, this is your idea of hanging out^1, Kris?/", "obj_readable_room1_slash_Other_10_gml_1237_0");
            msgnextloc("\\EK* Going to the graveyard?/", "obj_readable_room1_slash_Other_10_gml_1238_0");
            msgnextloc("\\E2* ..^1. works for me I guess./%", "obj_readable_room1_slash_Other_10_gml_1239_0");
        }
    }
}
if (room == room_townhall)
{
    if (x >= 180)
        global.msg[0] = stringsetloc("* (It's a painting of the town.)/%", "obj_readable_room1_slash_Other_10_gml_983_0");
    if (x >= 240)
        global.msg[0] = stringsetloc("* (It's a small pine tree.)/%", "obj_readable_room1_slash_Other_10_gml_988_0");
    if (y >= 160)
        global.msg[0] = stringsetloc("* (It's a chair.^1)&* (Maybe it's into politics.)/%", "obj_readable_room1_slash_Other_10_gml_991_0");
}
if (room == room_beach)
{
    global.msc = 192;
    scr_text(global.msc);
}
if (room == room_diner)
    global.msg[0] = stringsetloc("* (Rave reviews and autographs.^1)&* (... from various normal townspeople.)/%", "obj_readable_room1_slash_Other_10_gml_1003_0");
if (room == room_flowershop_1f)
{
    if (y > 100)
    {
        if (x < 100)
            global.msg[0] = stringsetloc("* (It's a cash register.^1)&* (There's not much change inside.)/%", "obj_readable_room1_slash_Other_10_gml_1010_0");
        if (x < 70)
            global.msg[0] = stringsetloc("* (It's a flower.)/%", "obj_readable_room1_slash_Other_10_gml_1011_0");
        if (x < 50)
            global.msg[0] = stringsetloc("* (It's some kind of catalogue..^1. There's a car magazine underneath.)/%", "obj_readable_room1_slash_Other_10_gml_1012_0");
    }
    if (y < 80)
    {
        if (x == 140)
            global.msg[0] = stringsetloc("* (It's an expertly trimmed arrangement.)/%", "obj_readable_room1_slash_Other_10_gml_1017_0");
        if (x != 140)
            global.msg[0] = stringsetloc("* (There are various flowers inside.)/%", "obj_readable_room1_slash_Other_10_gml_1018_0");
    }
}
if (room == room_flowershop_2f)
{
    if (y < 50)
        global.msg[0] = stringsetloc("* (It's a door.^1)&* (It's locked.)/%", "obj_readable_room1_slash_Other_10_gml_1027_0");
    if (y > 60)
    {
        global.msg[0] = stringsetloc("* (Various bags of soil.)/%", "obj_readable_room1_slash_Other_10_gml_1031_0");
        if (x >= 60)
            global.msg[0] = stringsetloc("* (It's a dirty watering can.)/%", "obj_readable_room1_slash_Other_10_gml_1032_0");
        if (x >= 180)
            global.msg[0] = stringsetloc("* (There is some dirty fur stuck in the drain.)/%", "obj_readable_room1_slash_Other_10_gml_1034_0");
        if (x >= 260)
            global.msg[0] = stringsetloc("* (It's a small TV.)&* (On top are some superhero comics.)/%", "obj_readable_room1_slash_Other_10_gml_1037_0");
    }
    if (y > 120)
    {
        if (x < 160)
        {
            global.msg[0] = stringsetloc("* (It's a note.)&* (It says...)/", "obj_readable_room1_slash_Other_10_gml_1044_0");
            global.msg[1] = stringsetloc("* No rent received. Again.&* Stop giving away flowers.&* Start selling them./", "obj_readable_room1_slash_Other_10_gml_1045_0");
            global.msg[2] = stringsetloc("* You have one month.& &         - C/%", "obj_readable_room1_slash_Other_10_gml_1046_0");
        }
        else
        {
            if (read == 0)
            {
                global.msg[0] = stringsetloc("* (It's an air mattress.^1)&* (It's certainly not king-sized...)/", "obj_readable_room1_slash_Other_10_gml_1052_0");
                scr_asgface(1, 4);
                global.msg[2] = stringsetloc("* Kris^1, do you want to sleep over?/", "obj_readable_room1_slash_Other_10_gml_1054_0");
                global.msg[3] = stringsetloc("\\E1* You could use that air mattress^1, and I could.../", "obj_readable_room1_slash_Other_10_gml_1055_0");
                global.msg[4] = stringsetloc("\\E2* Er^1, use those bags of soil..^1.&* Perhaps not./%", "obj_readable_room1_slash_Other_10_gml_1056_0");
            }
            if (read >= 1)
                global.msg[0] = stringsetloc("* (It's an air mattress.^1)&* (It's certainly not king-sized...)/%", "obj_readable_room1_slash_Other_10_gml_1060_0");
        }
    }
    if (x == 225)
    {
        global.msc = 210;
        scr_text(global.msc);
    }
}
if (room == room_alphysalley)
{
    if (x <= 130)
    {
        if (global.chapter == 1)
            global.msg[0] = stringsetloc("* (It's a saucer of milk.)/%", "obj_readable_room1_slash_Other_10_gml_1077_0");
        if (global.chapter >= 2)
        {
            scr_speaker("susie");
            msgsetloc(0, "\\E7* Hey Kris^1, this free milk? It's amazing./", "obj_readable_room1_slash_Other_10_gml_1353_0");
            msgnextloc("\\E2* It just magically refreshes itself over night./%", "obj_readable_room1_slash_Other_10_gml_1354_0");
        }
    }
    else
    {
        if (global.chapter == 1)
        {
            global.msg[0] = stringsetloc("* (It's a dirty trash can.)/%", "obj_readable_room1_slash_Other_10_gml_1091_0");
            if (y <= 100)
                global.msg[0] = stringsetloc("* (It's a trash can full of well-kept flowers.)/%", "obj_readable_room1_slash_Other_10_gml_1094_0");
        }
        if (global.chapter >= 2)
        {
            scr_speaker("bratty");
            msgsetloc(0, "\\E3* (Um^1, HEY? That's MY trash from other people's houses.)/", "obj_readable_room1_slash_Other_10_gml_1371_0");
            msgnextloc("\\E6* (Like^1, PRIVACY much? God^1, living with Azzy made you weird.)/%", "obj_readable_room1_slash_Other_10_gml_1372_0");
        }
    }
}
if (room == room_town_south)
{
    if (x <= 100)
    {
        if (global.chapter == 1)
        {
            global.msg[0] = stringsetloc("* (Police tape is blocking the way.)/", "obj_readable_room1_slash_Other_10_gml_1111_0");
            global.msg[1] = stringsetloc("* (The tape simply reads \"NGAHHHHH!!!\")/%", "obj_readable_room1_slash_Other_10_gml_1112_0");
        }
        if (global.chapter >= 2)
        {
            if (read == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (There's more police tape.)/", "obj_readable_room1_slash_Other_10_gml_1393_0");
                msgnextloc("* (It says \"NGAHHHH!!^1! I MEAN IT!!!\")/", "obj_readable_room1_slash_Other_10_gml_1394_0");
                msgnextloc("* (It's not clear what is meant by that.)/%", "obj_readable_room1_slash_Other_10_gml_1395_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (There's a lot of police tape.)/%", "obj_readable_room1_slash_Other_10_gml_1399_0");
            }
        }
    }
    if (x > 200 && x < 300)
    {
        if (read == 0)
        {
            snd_play(snd_knock);
            global.msg[0] = stringsetloc("* (You knocked on the door to the Police Station.)/", "obj_readable_room1_slash_Other_10_gml_1119_0");
            global.msg[1] = stringsetloc("* (...)/", "obj_readable_room1_slash_Other_10_gml_1120_0");
            global.msg[2] = stringsetloc("* (Someone's coming up to the window.)/%", "obj_readable_room1_slash_Other_10_gml_1121_0");
            with (obj_town_event)
                con = 50;
        }
        else
        {
            global.msg[0] = stringsetloc("* (Seems like the police aren't really feelin' it right now...)/%", "obj_readable_room1_slash_Other_10_gml_1126_0");
        }
    }
}
if (room == room_town_mid)
{
    if (x > 260)
    {
        global.msg[0] = stringsetloc("* (Here at ICE-E'S PEZZA, You're Family.)/", "obj_readable_room1_slash_Other_10_gml_1136_0");
        global.msg[1] = stringsetloc("* (... Is Going to Love it!)/%", "obj_readable_room1_slash_Other_10_gml_1137_0");
    }
    if (x >= 300)
    {
        global.msg[0] = stringsetloc("* (The entrance is locked.^1)&* (No one's inside.)/", "obj_readable_room1_slash_Other_10_gml_1141_0");
        global.msg[1] = stringsetloc("* (Seems like all of the employees are outside in costume.)/%", "obj_readable_room1_slash_Other_10_gml_1142_0");
    }
    if (x >= 360)
        global.msg[0] = stringsetloc("* (Ice E's P\"E\"ZZA, You're number \"#1\" Spot for a piping hot pe\"E\"ce of PEZZA.)/%", "obj_readable_room1_slash_Other_10_gml_1146_0");
    if (x >= 1240)
    {
        snd_play(snd_knock);
        if (global.chapter == 1)
        {
            global.msg[0] = stringsetloc("* (Knock knock knock...)/", "obj_readable_room1_slash_Other_10_gml_1154_0");
            global.msg[1] = stringsetloc("* (...)/", "obj_readable_room1_slash_Other_10_gml_1444_0");
            global.msg[2] = stringsetloc("* (No response...^1)&* (... but the distant trousle of bones.)/%", "obj_readable_room1_slash_Other_10_gml_1156_0");
        }
        if (global.chapter >= 2)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Knock knock knock.)/", "obj_readable_room1_slash_Other_10_gml_1451_0");
            msgnextloc("* (Faintly...^1. faintly^1, a trousle..^1. growing further away...)/%", "obj_readable_room1_slash_Other_10_gml_1452_0");
        }
        if (x >= 1500)
        {
            if (global.chapter == 1)
            {
                global.msg[1] = stringsetloc("* Ooo^1, are you the human that lives at the top of town?/", "obj_readable_room1_slash_Other_10_gml_1170_0");
                global.msg[2] = stringsetloc("* Wow^1, my mommy told me about you.../", "obj_readable_room1_slash_Other_10_gml_1171_0");
                global.msg[3] = stringsetloc("* Does it hurt to be made of blood???/%", "obj_readable_room1_slash_Other_10_gml_1172_0");
            }
            if (global.chapter >= 2)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (Knock knock knock)/", "obj_readable_room1_slash_Other_10_gml_1483_0");
                msgnextloc("* Oooo^1, is that a humannnn?!/", "obj_readable_room1_slash_Other_10_gml_1467_0");
                msgnextloc("* If humans are made of bones.../", "obj_readable_room1_slash_Other_10_gml_1468_0");
                msgnextloc("* Where does skeletons come from...?/%", "obj_readable_room1_slash_Other_10_gml_1469_0");
            }
        }
        if (x >= 1640)
        {
            if (global.chapter == 1)
            {
                global.msg[1] = stringsetloc("* Huh..^1. that sounds like the knock of a beginner./", "obj_readable_room1_slash_Other_10_gml_1187_0");
                global.msg[2] = stringsetloc("* Come back when you've gotten better at knocking!/%", "obj_readable_room1_slash_Other_10_gml_1188_0");
            }
            if (global.chapter >= 2)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (Knock knock knock)/", "obj_readable_room1_slash_Other_10_gml_1483_0");
                msgnextloc("* Hmm..^1. that knocking..^1. it's amateur!/", "obj_readable_room1_slash_Other_10_gml_1484_0");
                msgnextloc("* You've still got a long way to go!/%", "obj_readable_room1_slash_Other_10_gml_1485_0");
            }
        }
        if (x >= 1860)
        {
            if (global.chapter == 1)
            {
                global.msg[1] = stringsetloc("* OY^1, Snowy^1, whaddid I TELL YAH about knockin' the door so hahd!/", "obj_readable_room1_slash_Other_10_gml_1204_0");
                global.msg[2] = stringsetloc("* Don't^1!&* Do^1!&* It!/", "obj_readable_room1_slash_Other_10_gml_1205_0");
                global.msg[3] = stringsetloc("* It's REALLY gonna hurt yah face^1! We don't have arms^1, yah know!/%", "obj_readable_room1_slash_Other_10_gml_1206_0");
            }
            if (global.chapter >= 2)
            {
                var visitedshelter = global.flag[315] == 1;
                if (!visitedshelter)
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* (Knock knock knock)/", "obj_readable_room1_slash_Other_10_gml_1504_0");
                    scr_anyface_next("susie", "C");
                    msgnextloc("\\EC* Hey^1, uh^1, Kris..^1. what are you doing?/", "obj_readable_room1_slash_Other_10_gml_1506_0");
                    msgnextloc("\\E1* We're going to your house^1, right?/%", "obj_readable_room1_slash_Other_10_gml_1507_0");
                }
                else
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* (Knock knock knock)/", "obj_readable_room1_slash_Other_10_gml_1510_0");
                    msgnextloc("* (Yo^1, uhh^1, Kris..^1. haha. Is that you? Haha...)/", "obj_readable_room1_slash_Other_10_gml_1511_0");
                    msgnextloc("* (We're not hanging out if Susie's with you!)/", "obj_readable_room1_slash_Other_10_gml_1512_0");
                    msgnextloc("* (Kris..^1. Susie sucks^1! Why didn't you stop her^1, haha...)/%", "obj_readable_room1_slash_Other_10_gml_1513_0");
                }
            }
        }
    }
}
if (room == room_town_north)
{
    if (x <= 250)
        global.msg[0] = stringsetloc("* (It's an ornate gate.^1)&* (It appears to be locked.)/%", "obj_readable_room1_slash_Other_10_gml_1236_0");
    if (x >= 500 && x <= 570)
    {
        if (global.chapter == 1)
        {
            global.fc = 16;
            global.typer = 5;
            global.fe = 6;
            global.msg[0] = stringsetloc("* Aww^1, Kris^1, like^1, if you wanna come in.../", "obj_readable_room1_slash_Other_10_gml_1245_0");
            global.msg[1] = stringsetloc("\\E4* Our cat-flap^1, is like^1, always open to you.../%", "obj_readable_room1_slash_Other_10_gml_1246_0");
        }
        if (global.chapter >= 2)
        {
            msgsetloc(0, "* (There's a cat flap.)/", "obj_readable_room1_slash_Other_10_gml_1539_0");
            msgnextloc("* (It's locked.)/", "obj_readable_room1_slash_Other_10_gml_1540_0");
            msgnextloc("* (Somehow.)/%", "obj_readable_room1_slash_Other_10_gml_1541_0");
        }
    }
    if (x >= 580)
    {
        global.msg[0] = stringsetloc("* (Various cat-themed junk is piled up inside the house.)/", "obj_readable_room1_slash_Other_10_gml_1258_0");
        global.msg[1] = stringsetloc("* (It seems to be a bit of a cat-sty...)/%", "obj_readable_room1_slash_Other_10_gml_1259_0");
    }
    if (x >= 650)
    {
        global.msg[0] = stringsetloc("* (It's a broken grill.)/", "obj_readable_room1_slash_Other_10_gml_1263_0");
        global.msg[1] = stringsetloc("* (... It smells like burnt cat food.)/%", "obj_readable_room1_slash_Other_10_gml_1264_0");
    }
    if (x >= 800)
    {
        global.msg[0] = stringsetloc("* (There's some kind of scratching noise coming from inside...)/%", "obj_readable_room1_slash_Other_10_gml_1268_0");
        if (global.chapter >= 2 && x > 900)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (There's some kind of scratching and hissing from inside.)/%", "obj_readable_room1_slash_Other_10_gml_1563_0");
        }
    }
    if (x >= 1090 && x <= 1130)
    {
        snd_play(snd_knock);
        if (global.chapter == 1)
        {
            global.msg[0] = stringsetloc("* (Knock knock knock...)/", "obj_readable_room1_slash_Other_10_gml_1276_0");
            global.msg[1] = stringsetloc("* Ah, I'm afraid no one's home right now^1, darling./", "obj_readable_room1_slash_Other_10_gml_1277_0");
            global.msg[2] = stringsetloc("* Now^1, why don't you prance on home?/%", "obj_readable_room1_slash_Other_10_gml_1278_0");
            if (read >= 1)
            {
                global.msg[1] = stringsetloc("* I'm telling you^1, they're not home right now./", "obj_readable_room1_slash_Other_10_gml_1282_0");
                global.msg[2] = stringsetloc("* ... Ah^1, you just wanted to talk to me...?/", "obj_readable_room1_slash_Other_10_gml_1283_0");
                global.msg[3] = stringsetloc("* .../", "obj_readable_room1_slash_Other_10_gml_1284_0");
                global.msg[4] = stringsetloc("* My apologies^1, beautiful^1.&* I'm afraid I'm a bit of a nobody./%", "obj_readable_room1_slash_Other_10_gml_1285_0");
            }
        }
        if (global.chapter >= 2)
        {
            global.msc = 1055;
            scr_text(global.msc);
        }
    }
    if (x == 1427 && y == 38 && global.chapter == 2)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (There's a door behind the flower shop.)/", "obj_readable_room1_slash_Other_10_gml_1617_0");
        msgnextloc("* (... but there's flowers blocking the way.)/%", "obj_readable_room1_slash_Other_10_gml_1618_0");
    }
}
if (room == room_town_shelter)
    global.msg[0] = stringsetloc("* (It's locked.)/%", "obj_readable_room1_slash_Other_10_gml_1302_0");
if (room == room_lw_icee_pizza)
{
    if (x > 40 && x < 80)
    {
        global.msc = 1022;
        scr_text(global.msc);
    }
    if (y > 110 && y < 130)
    {
        if (x > 50)
        {
            msgsetloc(0, "* (There's some condiments at the table.)/", "obj_readable_room1_slash_Other_10_gml_1615_0");
            msgnextloc("* ICE-E's \"Original\" Parmajohn Che\"E\"ese!/%", "obj_readable_room1_slash_Other_10_gml_1616_0");
        }
        if (x > 230)
        {
            msgsetloc(0, "* (There's some condiments at the table.)/", "obj_readable_room1_slash_Other_10_gml_1621_0");
            msgnextloc("* ICE-E'S Squeezable Pasta Now With New \"Shape\"/%", "obj_readable_room1_slash_Other_10_gml_1622_0");
        }
    }
    if (y < 70 && x > 220 && x < 260)
    {
        msgsetloc(0, "* (Try our new CHOCCOLATE PEZZA)/", "obj_readable_room1_slash_Other_10_gml_1629_0");
        msgnextloc("* (Melts in your pants not in your mouth)/%", "obj_readable_room1_slash_Other_10_gml_1630_0");
    }
}
if (room == room_lw_conbini)
{
    if (x > 120 && y < 90)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Various frozen bagels and treats.)/", "obj_readable_room1_slash_Other_10_gml_1640_0");
        scr_anyface_next("susie", "2");
        msgnextloc("\\E2* Hey Kris^1, wanna see if we can fit inside?/", "obj_readable_room1_slash_Other_10_gml_1642_0");
        msgnextloc("\\E5* If you just crouch down under the waffles -/", "obj_readable_room1_slash_Other_10_gml_1643_0");
        msgnextloc("\\EK* Damn^1, think someone's looking./%", "obj_readable_room1_slash_Other_10_gml_1644_0");
    }
    if (x > 240 && x < 250 && y < 90)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It looks like a normal basket of fruit^1, but when you reach in...)/", "obj_readable_room1_slash_Other_10_gml_1651_0");
        msgnextloc("* (..^1. It's incredibly deep and holds all sorts of things.)/%", "obj_readable_room1_slash_Other_10_gml_1652_0");
    }
    if (x > 200 && y < 80)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* LOOSE EGGS $1/", "obj_readable_room1_slash_Other_10_gml_1659_0");
        msgnextloc("* (It's too much responsibility for an egg.)/%", "obj_readable_room1_slash_Other_10_gml_1660_0");
        if (global.flag[439] == 1)
            msgsetloc(0, "* (Seems like there's more eggs here than usual.)/%", "obj_readable_room1_slash_Other_10_gml_1684_0");
        if (scr_litemcheck(8) && global.flag[439] == 0)
        {
            scr_litemremove(8);
            global.writersnd[1] = snd_egg;
            msgsetloc(0, "* (It's a pile of eggs.)/", "obj_readable_room1_slash_Other_10_gml_1691_0_b");
            msgnextloc("* (...)/", "obj_readable_room1_slash_Other_10_gml_1692_0");
            msgnextloc("\\S1* (You put the Egg into the eggpile.)/", "obj_readable_room1_slash_Other_10_gml_1693_0");
            scr_anyface_next("susie", 0);
            msgnextloc("* ... did you just^1, uh^1, reverse-steal that egg?/%", "obj_readable_room1_slash_Other_10_gml_1695_0_b");
            scr_keyitemremove(2);
            skip = 0;
            global.flag[439] = 1;
        }
    }
    if (x > 280 && x < 310 && y < 90)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Grapes^1, melons^1, oranges^1, and the scent of fresh pineapples...)/%", "obj_readable_room1_slash_Other_10_gml_1667_0");
    }
    if (x > 265 && x < 280 && y < 90)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It looks like a normal palm tree^1, but it's chock-full of useful groceries.)/%", "obj_readable_room1_slash_Other_10_gml_1674_0");
    }
    if (x > 425 && x < 445 && y < 90)
    {
        if (read == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (It's a rack of candy^1, jerky^1, and various nuts.)/", "obj_readable_room1_slash_Other_10_gml_1683_0");
            scr_anyface_next("susie", 10);
            msgnextloc("\\EA* See? Jerky is candy. ..^1. And^1, uh^1, peanuts too./", "obj_readable_room1_slash_Other_10_gml_1685_0");
            scr_anyface_next("sans", "5");
            msgnextloc("\\E5* actually they're a legume./", "obj_readable_room1_slash_Other_10_gml_1687_0");
            scr_anyface_next("susie", 1);
            msgnextloc("\\E1* Peanuts?/", "obj_readable_room1_slash_Other_10_gml_1689_0");
            scr_anyface_next("sans", "2");
            msgnextloc("\\E2* jerky./%", "obj_readable_room1_slash_Other_10_gml_1691_0");
        }
        else
        {
            scr_speaker("susie");
            msgsetloc(0, "* How about we don't look at anything.../", "obj_readable_room1_slash_Other_10_gml_1695_0");
            msgnextloc("\\E1* That's gonna make him say something stupid./", "obj_readable_room1_slash_Other_10_gml_1696_0");
            scr_anyface_next("sans", "5");
            msgnextloc("\\E5* ..^1. pickings are looking slim^1, ma'am./%", "obj_readable_room1_slash_Other_10_gml_1698_0");
        }
    }
    if (x > 140 && y > 150)
    {
        if (read == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Ice-E's Pizza Pin-Ups Mangazine./", "obj_readable_room1_slash_Other_10_gml_1708_0");
            msgnextloc("* HOt and fresh chease^1, pepperonie^1, Just like in your Dream's.../%", "obj_readable_room1_slash_Other_10_gml_1709_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Hot Piza Picks! Now with 3 Pixels Or MOre, In Hot and Spicy REsolution!/%", "obj_readable_room1_slash_Other_10_gml_1716_0");
        }
    }
    if (x > 170 && y > 150)
    {
        if (read == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* There're some car magazines on the racks./", "obj_readable_room1_slash_Other_10_gml_1726_0");
            msgnextloc("* It might be fun to look at them^1,/", "obj_readable_room1_slash_Other_10_gml_1727_0");
            msgnextloc("* But there's other people around.../%", "obj_readable_room1_slash_Other_10_gml_1728_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* It's a fluffy dog magazine^1. The inside has samples like fragrance ads.../", "obj_readable_room1_slash_Other_10_gml_1734_0");
            msgnextloc("* But it's all different dog fur for you to touch./", "obj_readable_room1_slash_Other_10_gml_1735_0");
            scr_anyface_next("susie", "5");
            msgnextloc("\\E5* Hey^1, don't hog the ads!!/%", "obj_readable_room1_slash_Other_10_gml_1737_0");
        }
    }
    if (x > 200 && y > 150)
        msgsetloc(0, "* It's a zine for Jockington fans. Seems popular./%", "obj_readable_room1_slash_Other_10_gml_1746_0");
    if (x > 240 && y > 150)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* It's a bunch of cards and heart shaped chocolates./", "obj_readable_room1_slash_Other_10_gml_1753_0");
        msgnextloc("* \"Get well soon!\"&* \"I'm glad your bike crashed\"/%", "obj_readable_room1_slash_Other_10_gml_1755_0");
    }
    if (x > 400 && x < 420 && y < 80)
    {
        snd_play(snd_bell);
        global.interact = 0;
        myinteract = 0;
        with (obj_mainchara)
            onebuffer = 3;
        exit;
    }
    if (x > 400 && x < 415 && y > 160)
    {
        scr_speaker("sans");
        msgsetloc(0, "\\E2* that stuff? it's used. half off./", "obj_readable_room1_slash_Other_10_gml_1774_0");
        scr_anyface_next("susie", 0);
        msgnextloc("* ..^1. What is it?/", "obj_readable_room1_slash_Other_10_gml_1776_0");
        scr_anyface_next("sans", 5);
        msgnextloc("\\E5* trash./%", "obj_readable_room1_slash_Other_10_gml_1778_0");
    }
    if (x > 435 && x < 445 && y > 150)
    {
        if (read == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (You can't reach the top^1, rendering it impossible to get a basket.)/", "obj_readable_room1_slash_Other_10_gml_1787_0");
            msgnextloc("* (You'll never be able to buy something in this state...)/%", "obj_readable_room1_slash_Other_10_gml_1788_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (One was the Throne of God's^1, this is the Throne of Evil's.)/%", "obj_readable_room1_slash_Other_10_gml_1792_0");
        }
    }
}
if (room == room_lw_police)
{
    if (x > 110 && x < 130 && y > 60 && y < 80)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (You skimmed a news article about Undyne.)/", "obj_readable_room1_slash_Other_10_gml_1806_0");
        msgnextloc("* New Police Chief Undyne's Explosive Debut/", "obj_readable_room1_slash_Other_10_gml_1807_0");
        msgnextloc("* ..^1. passionate young rookie..^1. becomes the new police chief./", "obj_readable_room1_slash_Other_10_gml_1808_0");
        msgnextloc("* Though energetic^1, it may be hard to live up to the legacy.../", "obj_readable_room1_slash_Other_10_gml_1809_0");
        msgnextloc("* ..^1. after Asgore Dreemurr was removed from the force.../", "obj_readable_room1_slash_Other_10_gml_1810_0");
        msgnextloc("* (..^1. there's no need to read any more.)/%", "obj_readable_room1_slash_Other_10_gml_1811_0");
    }
    if (x > 80 && x < 90 && y < 150 && y > 140)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Photos of Chief Undyne and Deputy Napstablook.)/", "obj_readable_room1_slash_Other_10_gml_1818_0");
        msgnextloc("* (Undyne is rescuing all of Catti's family from a tree.)/", "obj_readable_room1_slash_Other_10_gml_1819_0");
        msgnextloc("* (..^1. Napstablook is also stuck in the tree somehow.)/%", "obj_readable_room1_slash_Other_10_gml_1820_0");
    }
    if (x > 60 && x < 70 && y > 170)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Well-cared-for flowers.)/%", "obj_readable_room1_slash_Other_10_gml_1827_0");
    }
}
if (room == room_dw_castle_rooms_kris)
{
    if (x > 150 && x < 200)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* It's a wardrobe full of all sorts of different clothes./", "obj_readable_room1_slash_Other_10_gml_1837_0");
        msgnextloc("* You could wear whatever you want./%", "obj_readable_room1_slash_Other_10_gml_1838_0");
    }
    if (x > 200 && x < 280)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* It's a shelf./", "obj_readable_room1_slash_Other_10_gml_1845_0");
        msgnextloc("* All sorts of keepsakes could be put here./%", "obj_readable_room1_slash_Other_10_gml_1846_0");
    }
    if (x > 310 && x < 390)
    {
        if (global.flag[207] >= 2)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* It's a trash can./", "obj_readable_room1_slash_Other_10_gml_1855_0");
            scr_anyface_next("ralsei", 3);
            msgnextloc("\\E3* Here^1, Kris^1! In case I make another manual.../", "obj_readable_room1_slash_Other_10_gml_1857_0");
            msgnextloc("\\E2* You can throw it directly in here!/%", "obj_readable_room1_slash_Other_10_gml_1858_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* It's a stand for your Manual./", "obj_readable_room1_slash_Other_10_gml_1861_0");
            scr_anyface_next("ralsei", 2);
            msgnextloc("\\E2* I thought you might want to keep it here in case you want to read it!/%", "obj_readable_room1_slash_Other_10_gml_1863_0");
        }
    }
    if (x > 390 && x < 500 && y < 280)
    {
        if (global.flag[409] == 0)
            global.flag[409] = 1;
        if (global.flag[252] == 1)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* It's a bed that's been carefully crafted./", "obj_readable_room1_slash_Other_10_gml_1875_0");
            msgnextloc("* It's suitable for a bed inspector./%", "obj_readable_room1_slash_Other_10_gml_1876_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* It's your bed./", "obj_readable_room1_slash_Other_10_gml_1880_0");
            msgnextloc("* It feels incredibly soft. Like sleeping on a dream.../%", "obj_readable_room1_slash_Other_10_gml_1881_0");
        }
    }
    if (x > 450 && y > 360)
    {
        var haveSusie = scr_havechar(2);
        var sentenceEnd = haveSusie ? "/" : "/%";
        scr_speaker("no_name");
        msgsetsubloc(0, "* It's some decorative moss. Looks delicious.~1", sentenceEnd, "obj_readable_room1_slash_Other_10_gml_1921_0_b");
        if (haveSusie)
        {
            scr_anyface_next("susie", "K");
            msgnextloc("\\EK* Why the hell does YOUR room get moss!?/%", "obj_readable_room1_slash_Other_10_gml_1925_0_b");
        }
    }
}
if (room == room_dw_castle_rooms_susie)
{
    if (x > 140 && x < 250)
    {
        if (global.flag[410] == 0)
            global.flag[410] = 1;
        scr_speaker("susie");
        msgsetloc(0, "\\E2* Cool^1, spike bed./", "obj_readable_room1_slash_Other_10_gml_1896_0");
        msgnextloc("\\EA* Now I can stab myself during the night./", "obj_readable_room1_slash_Other_10_gml_1897_0");
        msgnextloc("\\E2* Finally some convenience./%", "obj_readable_room1_slash_Other_10_gml_1898_0");
    }
    if (x > 250 && x < 315)
    {
        if (read == 0)
        {
            scr_speaker("susie");
            msgsetloc(0, "\\E7* Damn^1, there's everything in here!/", "obj_readable_room1_slash_Other_10_gml_1907_0");
            msgnextloc("* Pinecones^1, chalk^1, moss^1, jars of salsa^1,/", "obj_readable_room1_slash_Other_10_gml_1908_0");
            msgnextloc("* Pieces of ice^1, black crumbs from the toaster^1, jawbreakers.../", "obj_readable_room1_slash_Other_10_gml_1909_0");
            msgnextloc("\\E2* ..^1. Oh^1, and like actual food^1, too./%", "obj_readable_room1_slash_Other_10_gml_1910_0");
        }
        else
        {
            scr_speaker("susie");
            msgsetloc(0, "\\E5* Hey Kris^1, stop eye-bogarting my snacks./%", "obj_readable_room1_slash_Other_10_gml_1913_0");
        }
    }
    if (x > 340 && x < 430)
    {
        scr_speaker("ralsei");
        msgsetloc(0, "\\E0* Susie^1, you didn't get to read the manual.../", "obj_readable_room1_slash_Other_10_gml_1921_0");
        msgnextloc("\\E2* So I put it over here for you./", "obj_readable_room1_slash_Other_10_gml_1922_0");
        scr_anyface_next("susie", 21);
        msgnextloc("\\EL* Cool^1, I'll read it before bed./", "obj_readable_room1_slash_Other_10_gml_1924_0");
        msgnextloc("\\E2* That'll put me to sleep./%", "obj_readable_room1_slash_Other_10_gml_1925_0");
    }
    if (x > 430 && x < 500)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* It's a clothes drawer full of spikey and dangerous clothing./", "obj_readable_room1_slash_Other_10_gml_1932_0");
        msgnextloc("* All the clothes are ripping each other up into shreds./", "obj_readable_room1_slash_Other_10_gml_1933_0");
        scr_anyface_next("susie", "2");
        msgnextloc("\\E2* Hell yeah!!^1! Jealous^1, Kris!?/%", "obj_readable_room1_slash_Other_10_gml_1935_0");
    }
}
if (room == room_dw_ralsei_castle_1f)
{
    if (x > 350 && x < 450)
        msgsetloc(0, "* (2F : LIVING QUARTERS)/%", "obj_readable_room1_slash_Other_10_gml_1943_0");
    if (x > 570 && x < 680)
        msgsetloc(0, "* (The door is locked.)/%", "obj_readable_room1_slash_Other_10_gml_1948_0");
    if (x > 950 && x < 1050)
        msgsetloc(0, "* (BF : LIVING QUARTERS FOR BAD GUYS)/%", "obj_readable_room1_slash_Other_10_gml_1953_0");
}
if (room == room_dw_ralsei_castle_2f)
{
    if (x > 1040 && x < 1150)
    {
        if (read == 0)
        {
            scr_speaker("susie");
            msgsetloc(0, "\\EA* Hey Ralsei^1, what's up here?/", "obj_readable_room1_slash_Other_10_gml_1964_0");
            scr_anyface_next("ralsei", 2);
            msgnextloc("\\E2* Oh^1, just more rooms I'm renovating!/", "obj_readable_room1_slash_Other_10_gml_1966_0");
            scr_anyface_next("susie", 2);
            msgnextloc("\\E2* ..^1. so is your room up there?/", "obj_readable_room1_slash_Other_10_gml_1968_0");
            scr_anyface_next("ralsei", 26);
            msgnextloc("\\EQ* Er^1, yes^1! I still^1, um^1, haven't dusted it though.../", "obj_readable_room1_slash_Other_10_gml_1970_0");
            scr_anyface_next("susie", 2);
            msgnextloc("\\E2* Yeah^1, like we need to see your nerdy glasses collection anyway./%", "obj_readable_room1_slash_Other_10_gml_1972_0");
        }
        else
        {
            scr_speaker("ralsei");
            msgsetloc(0, "\\EG* Sorry^1, work in progress!/%", "obj_readable_room1_slash_Other_10_gml_1976_0");
        }
    }
}
if (room == room_dw_castle_town)
{
    if (x > 1050 && x < 1080 && y >= 760)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Mama Miba^1! Welcome to TOP Bakery!/", "obj_readable_room1_slash_Other_10_gml_2124_0");
        msgnextloc("* Our special chefs spin baked goods at the TOP of their class!/%", "obj_readable_room1_slash_Other_10_gml_2125_0");
    }
}
if (room == room_dw_castle_restaurant)
{
    if (x > 200 && x < 300)
    {
        myinteract = 0;
        with (obj_npc_room)
        {
            if (sprite_index == spr_lancer_lt_mustache)
                event_user(0);
        }
        exit;
    }
    if (x > 300 && x < 400)
    {
        myinteract = 0;
        with (obj_npc_hammerguy)
            event_user(0);
        exit;
    }
}
if (room == room_dw_castle_east_door)
{
    if (sprite_index == spr_tasque_idle_overworld)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Seems like it's gone stray without its master...)/%", "obj_readable_room1_slash_Other_10_gml_2160_0");
    }
    if (sprite_index == spr_maus_idle)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Squeak...)/%", "obj_readable_room1_slash_Other_10_gml_2165_0");
    }
    if (sprite_index == spr_npc_poppup)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* TANJOUBY.../%", "obj_readable_room1_slash_Other_10_gml_2170_0");
    }
    if (sprite_index == spr_traffic_car_side_legs_small_left)
    {
        skip = 1;
        snd_play(snd_smallcar_yelp);
    }
}
if (room == room_dw_castle_dojo)
{
    scr_speaker("no_name");
    global.msg[0] = stringsetloc("* (It's a bed for three people^1, or one three-headed person.)/%", "obj_readable_room1_slash_Other_10_gml_2177_0");
}
if (room == room_lw_computer_lab)
{
    if (x > 40 && x < 60 && y > 40 && y < 50)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (The closet is spacious and full of old electronics.)/", "obj_readable_room1_slash_Other_10_gml_2318_0");
        msgnextloc("* (A large person could easily fit inside.)/%", "obj_readable_room1_slash_Other_10_gml_2319_0");
    }
    if (x > 150 && x < 170 && y > 115 && y < 130)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Looks like the library's state-of-the-art public laptop.)/", "obj_readable_room1_slash_Other_10_gml_2326_0");
        msgnextloc("* (Someone left it on.)/%", "obj_readable_room1_slash_Other_10_gml_2327_0");
    }
    if (x > 220 && x < 250 && y > 40 && y < 50)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's full of many backup devices^1, like extra mice^1, extra keyboards^1, or extra maracas.)/%", "obj_readable_room1_slash_Other_10_gml_2334_0");
    }
    if (x > 70 && x < 95 && y > 90 && y < 150)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a computer. The monitor is flickering brightly.)/%", "obj_readable_room1_slash_Other_10_gml_2341_0");
    }
    if (x > 220 && x < 240 && y > 100 && y < 110)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a computer.)/", "obj_readable_room1_slash_Other_10_gml_2348_0");
        msgnextloc("* (A dolphin screensaver is advertising some kind of malware.)/%", "obj_readable_room1_slash_Other_10_gml_2349_0");
    }
    if (x > 220 && x < 240 && y > 120 && y < 140)
    {
        if (global.flag[309] < 9)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (It's a computer.)/", "obj_readable_room1_slash_Other_10_gml_2360_0");
            msgnextloc("* (Someone tried to check their email^1, but the Internet is down.)/%", "obj_readable_room1_slash_Other_10_gml_2361_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (It's a computer.)/", "obj_readable_room1_slash_Other_10_gml_2366_0");
            msgnextloc("* (... It's nothing but a blue screen. Looks like it crashed.)/%", "obj_readable_room1_slash_Other_10_gml_2367_0");
        }
    }
    if (x > 120 && x < 140 && y > 25 && y < 40)
    {
        if (read == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Various posters talking about Internet safety.)/%", "obj_readable_room1_slash_Other_10_gml_2377_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (You suddenly thought about how your day might have been different...)/", "obj_readable_room1_slash_Other_10_gml_2381_0");
            msgnextloc("* (..^1. If the poster with that orange cat was still on the wall.)/%", "obj_readable_room1_slash_Other_10_gml_2382_0");
        }
    }
    if (x > 30 && x < 40 && y > 170 && x < 190)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a trashcan. You get the feeling it doesn't have any friends.)/", "obj_readable_room1_slash_Other_10_gml_2390_0");
        msgnextloc("* (It's hard to explain why you feel this way about a trashcan.)/%", "obj_readable_room1_slash_Other_10_gml_2391_0");
    }
    if (x > 230 && x < 250 && y > 170 && y < 190)
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a recycling bin.)/", "obj_readable_room1_slash_Other_10_gml_2398_0");
        msgnextloc("* (Looks like someone accidentally printed off a lot of useless emails.)/%", "obj_readable_room1_slash_Other_10_gml_2399_0");
    }
}
if (room == room_dw_castle_cafe)
{
    scr_speaker("no_name");
    msgsetloc(0, "* (The jukebox is broken.)&* (Feels like you might never find a working one...)/%", "obj_readable_room1_slash_Other_10_gml_2897_0");
}
if (room == room_dw_couch_overworld_intro)
{
    scr_speaker("no_name");
    msgsetloc(0, "* (It's a couch^1, for sleeping.)/", "obj_readable_room1_slash_Other_10_gml_2145_0");
    msgnextloc("* (The couch is asleep^1, too.)/%", "obj_readable_room1_slash_Other_10_gml_2146_0");
    if (global.tempflag[40] == 1)
    {
        global.msc = 1296;
        scr_text(global.msc);
    }
    if (global.flag[1021] == 1)
    {
        msgsetloc(0, "* (It's a couch^1, for walking.)/", "obj_readable_room1_slash_Other_10_gml_2156_0");
        msgnextloc("* (The couch is walking^1, too.)/%", "obj_readable_room1_slash_Other_10_gml_2157_0");
    }
}
if (room == room_dw_couch_overworld_02)
{
    if (extflag == "ralsei")
    {
        if (scr_flag_get(1260) == 0)
        {
            scr_flag_set(1260, 1);
            scr_speaker("ralsei");
            msgsetloc(0, "\\E5* .../", "obj_readable_room1_slash_Other_10_gml_2170_0_b");
            msgnextloc("\\EJ* ..^1. um^1, sorry^1, Kris^1! You don't need a hint^1, do you?/%", "obj_readable_room1_slash_Other_10_gml_2171_0");
        }
        else
        {
            scr_speaker("ralsei");
            msgsetloc(0, "\\EK* Kris^1, um..^1. I think you just need to press that switch./%", "obj_readable_room1_slash_Other_10_gml_2175_0");
        }
    }
    else if (extflag == "susie")
    {
        if (scr_flag_get(1261) == 0)
        {
            scr_flag_set(1261, 1);
            scr_speaker("susie");
            msgsetloc(0, "\\EA* Dude^1, Kris..^1. if Ralsei hung out with us.../", "obj_readable_room1_slash_Other_10_gml_2184_0");
            msgnextloc("\\E2* He could do puzzles like this for us all the time./", "obj_readable_room1_slash_Other_10_gml_2185_0");
            msgnextloc("\\EK* Y'know. If we ever found one in the Light World./%", "obj_readable_room1_slash_Other_10_gml_2186_0");
        }
        else
        {
            scr_speaker("susie");
            msgsetloc(0, "\\E6* Hey^1, does Ralsei even know math...?/", "obj_readable_room1_slash_Other_10_gml_2190_0");
            msgnextloc("\\EA* ..^1. guess he could do our book reports.../%", "obj_readable_room1_slash_Other_10_gml_2191_0");
        }
    }
}
if (room == room_dw_snow_zone)
{
    if (extflag == "shard")
    {
        global.writersnd[0] = snd_item;
        with (obj_ch3_PTB02)
            remove_shiny = true;
        scr_speaker("no_name");
        if (scr_keyitemcheck(13) == 0)
            scr_keyitemget(13);
        if (scr_debug() && scr_weaponcheck_inventory(26) > 0)
            scr_weaponremove(26);
        noroom = 0;
        scr_weaponget(26);
        if (noroom)
        {
            var weaponToRemove = [];
            array_push(weaponToRemove, 20);
            array_push(weaponToRemove, 5);
            array_push(weaponToRemove, 6);
            array_push(weaponToRemove, 10);
            array_push(weaponToRemove, 16);
            array_push(weaponToRemove, 17);
            array_push(weaponToRemove, 18);
            array_push(weaponToRemove, 23);
            array_push(weaponToRemove, 24);
            array_push(weaponToRemove, 25);
            debug_message("Not enough room for black shard");
            var found = -4;
            var loc = -4;
            for (var i = 0; i < array_length(global.weapon); i++)
            {
                for (var w = 0; w < array_length(weaponToRemove); w++)
                {
                    if (found == -4)
                    {
                        if (global.weapon[i] == weaponToRemove[w])
                        {
                            found = w;
                            loc = i;
                            break;
                        }
                    }
                }
            }
            if (found != -4)
            {
                scr_weaponinfo(global.weapon[loc]);
                debug_message("Removing: " + weaponnametemp);
                global.weapon[loc] = 0;
                scr_weaponget(26);
                debug_message("Got Black Shard");
            }
        }
        else
        {
            debug_message("Got Black Shard");
        }
        var sentence_end = (noroom == 0) ? "/" : "/%";
        msgsetsubloc(0, "\\S0* (SHADOW CRYSTAL was added to your Key Items.)~1", sentence_end, "obj_readable_room1_slash_Other_10_gml_2190_0_b");
        msgnextloc("\\S0* (BLACK SHARD was added to your Weapons.)/%", "obj_readable_room1_slash_Other_10_gml_2191_0_b");
    }
    if (extflag == "toriel_sleep")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (She's sleeping peacefully...)/%", "obj_readable_room1_slash_Other_10_gml_2195_0");
    }
    else if (extflag == "toriel_sleep_knight")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Her face contorted...)/", "obj_readable_room1_slash_Other_10_gml_2199_0");
        msgnextloc("* (It looks like she's having a nightmare.)/%", "obj_readable_room1_slash_Other_10_gml_2200_0");
    }
}
if (room == room_dw_changing_room)
{
    if (extflag == "curtain_left")
    {
        with (obj_dw_changing_room_curtain)
            curtain_start = true;
        skip = 1;
    }
    if (extflag == "curtain_right")
    {
        if (global.plot < 150)
        {
            if (scr_flag_get(1062) == 0)
            {
                global.writersnd[0] = snd_item;
                scr_weaponget(23);
                var can_get_item = noroom == 0;
                var sentence_end = can_get_item ? "/" : "/%";
                scr_speaker("no_name");
                msgsetloc(0, "* ---!/", "obj_readable_room1_slash_Other_10_gml_2229_0_b");
                msgnextloc("* (Someone from behind the curtain pushed you away...)/", "obj_readable_room1_slash_Other_10_gml_2230_0_b");
                msgnextsubloc("* (...? You felt something spiny stuck in your hand.)~1", sentence_end, "obj_readable_room1_slash_Other_10_gml_2231_0_b");
                if (can_get_item)
                {
                    scr_flag_set(1062, 1);
                    msgnextloc("\\S0* (You got the Saber10.)/%", "obj_readable_room1_slash_Other_10_gml_2238_0");
                }
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (The curtain shuts tighter as you approach.)/%", "obj_readable_room1_slash_Other_10_gml_2243_0");
            }
        }
        if (global.plot >= 150)
        {
            if (read == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (Someone behind the curtain is talking...)/", "obj_readable_room1_slash_Other_10_gml_2253_0");
                msgnextloc("* (..^1. can I..^1. look like this..^1. can I..^1. dream like this...)/", "obj_readable_room1_slash_Other_10_gml_2254_0");
                msgnextloc("* (..^1. when you moved to listen^1, suddenly they stopped.)/%", "obj_readable_room1_slash_Other_10_gml_2255_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (...)/%", "obj_readable_room1_slash_Other_10_gml_2259_0");
            }
        }
        if (global.plot >= 205)
        {
            if (read == 0)
            {
                var shadow_mantle_defeat = scr_flag_get(1050) > 0;
                if (!shadow_mantle_defeat)
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* (Someone behind the curtain...)/", "obj_readable_room1_slash_Other_10_gml_2271_0");
                    msgnextloc("* (For some reason you feel like they're concerned..^1. but they won't say it.)/%", "obj_readable_room1_slash_Other_10_gml_2272_0");
                }
                else
                {
                    scr_speaker("no_name");
                    msgsetloc(0, "* (Someone behind the curtain...)/", "obj_readable_room1_slash_Other_10_gml_2276_0");
                    msgnextloc("* ...!/", "obj_readable_room1_slash_Other_10_gml_2277_0");
                    msgnextloc("* (..^1. did they check to see if you were hurt...?)/%", "obj_readable_room1_slash_Other_10_gml_2278_0");
                }
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (The curtains are shut tightly.)/%", "obj_readable_room1_slash_Other_10_gml_2283_0_b");
            }
        }
    }
    if (extflag == "corkboard_left")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a corkboard.)/", "obj_readable_room1_slash_Other_10_gml_2244_0_b");
        msgnextloc("* (Illicit caricatures of Tenna are hung up.)/%", "obj_readable_room1_slash_Other_10_gml_2245_0");
    }
    if (extflag == "corkboard_right")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a corkboard. ..^1. ouch!)/", "obj_readable_room1_slash_Other_10_gml_2251_0");
        msgnextloc("* (Cactus needles are stuck into it.)/%", "obj_readable_room1_slash_Other_10_gml_2252_0");
    }
    if (extflag == "door_blocked")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's locked.)/%", "obj_readable_room1_slash_Other_10_gml_2305_0");
    }
}
if (room == room_dw_green_room)
{
    if (extflag == "pippins")
    {
        if (read == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Hey^1! Kris^1, you and Asriel took me home from school^1, remember?/", "obj_readable_room1_slash_Other_10_gml_2263_0");
            msgnextloc("* The Rudinns? Pretty sure you lost them somewhere. ..^1. And I mean REALLY lost./%", "obj_readable_room1_slash_Other_10_gml_2264_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* You wanna talk more? Shh^1! Let's do it in the dressing room./%", "obj_readable_room1_slash_Other_10_gml_2269_0_b");
        }
    }
    if (extflag == "racing")
    {
        with (obj_ch3_green_room_racing)
            pause_caterpillar = true;
        scr_speaker("susie");
        msgsetloc(0, "\\EK* Nah^1, I'm like good./%", "obj_readable_room1_slash_Other_10_gml_2283_0");
        if (global.plot < 150)
        {
            if (scr_flag_get(1034) < 3 && scr_flag_get(1035) == 0)
            {
                global.msc = 1262;
                scr_text(global.msc);
            }
        }
        if (global.plot >= 205 && scr_flag_get(1065) > 0)
        {
            scr_speaker("susie");
            msgsetloc(0, "\\E5* Hey^1, quit making your hair static on the screen!/%", "obj_readable_room1_slash_Other_10_gml_2298_0");
        }
    }
    if (extflag == "changing_room")
    {
        global.msc = 1260;
        scr_text(global.msc);
    }
    if (extflag == "changing_room_locked")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Looks like it's locked.)/%", "obj_readable_room1_slash_Other_10_gml_2311_0");
    }
    if (extflag == "left_door_exit")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (The door is locked.)/%", "obj_readable_room1_slash_Other_10_gml_2370_0");
    }
    if (extflag == "left_poster")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (This way to the next BOARD^1!!)/%", "obj_readable_room1_slash_Other_10_gml_2349_0_b");
    }
    if (extflag == "right_door_locked")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (Seems unnecessary to enter the conspicuous door now.)/%", "obj_readable_room1_slash_Other_10_gml_2330_0");
    }
    if (extflag == "tv_right")
    {
        if (read == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Hey^1! Move it!/", "obj_readable_room1_slash_Other_10_gml_2338_0");
            msgnextloc("* Block your brother's playing^1, not mine!/%", "obj_readable_room1_slash_Other_10_gml_2339_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Who watches TV from that close!?/%", "obj_readable_room1_slash_Other_10_gml_2343_0");
        }
        if (scr_flag_get(1210) > 0)
        {
            if (read == 0)
            {
                scr_speaker("susie");
                msgsetloc(0, "\\E2* Ralsei^1, would you lick an old screen?/", "obj_readable_room1_slash_Other_10_gml_2364_0");
                scr_anyface_next("ralsei", "K");
                msgnextloc("\\EK* Err..^1. umm..^1. depends..^1. what's on TV?/", "obj_readable_room1_slash_Other_10_gml_2366_0_b");
                scr_anyface_next("susie", "M");
                msgnextloc("\\EM* Ugh. Nevermind. You don't get it./%", "obj_readable_room1_slash_Other_10_gml_2368_0");
            }
            else
            {
                scr_speaker("susie");
                msgsetloc(0, "\\E2* Dude^1, we should use magnets on Tenna. Might be cool./%", "obj_readable_room1_slash_Other_10_gml_2372_0");
            }
        }
        if (global.plot >= 150)
        {
            if (read == 0)
            {
                global.msc = 1282;
                scr_text(global.msc);
            }
            else
            {
                scr_speaker("susie");
                msgsetloc(0, "\\E0* Enough of this TV./%", "obj_readable_room1_slash_Other_10_gml_2355_0");
            }
        }
    }
    if (extflag == "cactus_left")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a convincing replica of your favorite cactus.)/%", "obj_readable_room1_slash_Other_10_gml_2380_0");
    }
    if (extflag == "cactus_right")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a cactus^1, but not the real thing.)/%", "obj_readable_room1_slash_Other_10_gml_2386_0");
    }
    if (extflag == "ramb_absent")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (No one is stirring^1, not even the Maus.)/%", "obj_readable_room1_slash_Other_10_gml_2392_0");
    }
    if (extflag == "rouxls")
    {
        if (read == 0)
        {
            scr_speaker("rouxls");
            msgsetloc(0, "\\E5* Haha..^1. You three STILL aren't readyeth for the Chef Game?/", "obj_readable_room1_slash_Other_10_gml_2400_0");
            scr_anyface_next("ralsei", "X");
            msgnextloc("\\EX* Um..^1. we already did that./", "obj_readable_room1_slash_Other_10_gml_2402_0");
            scr_anyface_next("rouxls", "1");
            msgnextloc("\\E1* What./", "obj_readable_room1_slash_Other_10_gml_2404_0");
            scr_anyface_next("susie", "1");
            msgnextloc("\\E1* Yeah. Like^1, on the first board. Where were you?/", "obj_readable_room1_slash_Other_10_gml_2406_0_b");
            scr_anyface_next("rouxls", "5");
            msgnextloc("\\E5* Doing..^1. my Freakinge..^1. MAKE-UP??/", "obj_readable_room1_slash_Other_10_gml_2408_0");
            msgnextloc("\\E4* I mean..^1. haha. I kneweth that. ACTUALLYE./", "obj_readable_room1_slash_Other_10_gml_2409_0");
            msgnextloc("\\E3* Perhaps^1, I just Liketh wearing clothing..^1. On Purpose?/%", "obj_readable_room1_slash_Other_10_gml_2410_0");
        }
        else
        {
            scr_speaker("rouxls");
            msgsetloc(0, "\\E6* Tell them^1, my Loverse. Tell them of my Glorie./", "obj_readable_room1_slash_Other_10_gml_2414_0");
            scr_anyface_next("no_name", 0);
            msgnextloc("* Uh..^1. Elnina..^1. really sees a lot in him^1, so.../", "obj_readable_room1_slash_Other_10_gml_2416_0");
            scr_anyface_next("no_name", 0);
            msgnextloc("* And^1, um..^1. Lanino sees a lot in him^1, so.../", "obj_readable_room1_slash_Other_10_gml_2418_0");
            scr_anyface_next("rouxls", "3");
            msgnextloc("\\E3* They're sayingeth^1, I'm Hotte./%", "obj_readable_room1_slash_Other_10_gml_2420_0");
        }
    }
    if (extflag == "lancer_spin")
    {
        global.msc = 1359;
        scr_text(global.msc);
    }
    if (extflag == "pippins_drink")
    {
        if (scr_flag_get(1239) == 0)
        {
            scr_flag_set(1239, 1);
            with (obj_room_green_room)
                con = 170;
            skip = 1;
            extflag = "stone_ramb";
        }
        else
        {
            global.msc = 1403;
            scr_text(global.msc);
        }
    }
    if (extflag == "stone_ramb")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* What? This guy? What do you want with him^1, Kris?/%", "obj_readable_room1_slash_Other_10_gml_2501_0");
    }
}
if (room == room_dw_console_room)
{
    if (extflag == "console")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a game system. Looks like this is where all the characters in the board play.)/", "obj_readable_room1_slash_Other_10_gml_2463_0");
        msgnextloc("* (The controllers and system are all locked up dentist-office-style.)/%", "obj_readable_room1_slash_Other_10_gml_2464_0");
    }
    if (extflag == "schedule")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* \"(ACT 1 SCHEDULE).\" (Various names and times are written under it.)/", "obj_readable_room1_slash_Other_10_gml_2470_0");
        msgnextloc("* (\"ACT 2 SCHEDULE\" is scrawled underneath in red pen...)/%", "obj_readable_room1_slash_Other_10_gml_2471_0");
        if (global.plot >= 150)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (It's the back of a paper.&\"ACT 3\" is scrawled in red at the top.)/%", "obj_readable_room1_slash_Other_10_gml_2476_0");
        }
    }
    if (extflag == "manhole")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's a manhole...)/", "obj_readable_room1_slash_Other_10_gml_2523_0");
        msgnextloc("* (..^1. It won't open.)/%", "obj_readable_room1_slash_Other_10_gml_2524_0");
    }
}
if (room == room_dw_tv_closet)
{
    if (y > 175)
    {
        if (scr_flag_get(1039) == 1)
        {
            with (obj_ch3_closet)
                both_talk = true;
            scr_itemget_anytype_text(35, "item");
            if (noroom == 0)
            {
                scr_flag_set(1039, 2);
                snd_play(snd_item);
                with (obj_ch3_closet)
                {
                    with (pipis_collider)
                        instance_destroy();
                    with (pipis_readable)
                        instance_destroy();
                    with (pipis_marker)
                        instance_destroy();
                }
                scr_speaker("no_name");
                msgsetloc(0, "* (Pipis was added to your ITEMs.)/%", "obj_readable_room1_slash_Other_10_gml_2504_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* (You don't have room in your ITEMs to hold the Pipis.)/%", "obj_readable_room1_slash_Other_10_gml_2508_0");
            }
        }
    }
    if (extflag == "wardrobe")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (No need to look in here anymore.)/%", "obj_readable_room1_slash_Other_10_gml_2522_0_b");
        if (scr_flag_get(1039) == 0 && scr_flag_get(1151) == 0)
        {
            global.msc = 1264;
            scr_text(global.msc);
        }
    }
}
if (room == room_dw_b3bs_rouxls_lanina)
{
    if (extflag == "shadow")
    {
        with (obj_ch3_GSC04B)
            shadow_play = true;
        skip = 1;
    }
}
if (room == room_dw_teevie_preview)
{
    if (extflag == "pippins")
    {
        if (read == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* One day when I accidentally broke the rules^1, this guy stood by my 6 sides!/", "obj_readable_room1_slash_Other_10_gml_2590_0");
            msgnextloc("* Since then^1, I decided to play fair. ..^1. y'know^1, if it helps this guy out!/%", "obj_readable_room1_slash_Other_10_gml_2591_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* Hey Kris^1, remember the Flying Aces? ..^1. Well^1, me neither.../%", "obj_readable_room1_slash_Other_10_gml_2549_0");
        }
        if (global.plot >= 160)
        {
            if (read == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* What happens^1, happens..^1. I think I fit in just fine^1, don't I?/", "obj_readable_room1_slash_Other_10_gml_2603_0");
                msgnextloc("* Kris^1, tell this bozo he's got nothin' to worry about!/%", "obj_readable_room1_slash_Other_10_gml_2604_0");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* By the way^1, seen a ticket anywhere? Nothing..^1. just a hunch./%", "obj_readable_room1_slash_Other_10_gml_2562_0");
            }
        }
        if (global.plot >= 280)
        {
            if (read == 0)
            {
                scr_speaker("no_name");
                msgsetloc(0, "* I don't get it..^1. Shouldn't I have been the one to turn to stone!?/", "obj_readable_room1_slash_Other_10_gml_2617_0");
                msgnextloc("* W..^1. will he be stuck if he stays like this...?/", "obj_readable_room1_slash_Other_10_gml_2618_0");
                msgnextloc("* Kris^1, you should really hurry up and seal the fountain!/%", "obj_readable_room1_slash_Other_10_gml_2619_0_b");
            }
            else
            {
                scr_speaker("no_name");
                msgsetloc(0, "* Ah^1, wait^1, Kris^1! Didn't you steal him from that cat girl's house?/", "obj_readable_room1_slash_Other_10_gml_2623_0");
                msgnextloc("* No^1, maybe I'm wrong..^1. Ahh^1, I can't believe this happened.../%", "obj_readable_room1_slash_Other_10_gml_2624_0");
            }
        }
    }
    if (extflag == "pippins_cheater")
    {
        global.msc = 1300;
        scr_text(global.msc);
    }
    if (extflag == "pippins_z_rank")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* Hey^1, wanna buy an S...?/", "obj_readable_room1_slash_Other_10_gml_2638_0");
        msgnextloc("* Well^1, too bad^1! You got Z-Rank^1, didn't you?/", "obj_readable_room1_slash_Other_10_gml_2639_0");
        msgnextloc("* Even I can't wash off the stench of that^1! Z-yew!/%", "obj_readable_room1_slash_Other_10_gml_2640_0");
    }
}
if (room == room_dw_couch_points)
{
    if (extflag == "points")
    {
        if (scr_flag_get(1101) < 2)
        {
            scr_flag_set(1101, 2);
            with (obj_ch3_couch_overworld_controller)
                open_chest = true;
            skip = 1;
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (An empty treasure chest.)/", "obj_readable_room1_slash_Other_10_gml_2628_0");
            msgnextloc("* (..^1. It's pointless.)/%", "obj_readable_room1_slash_Other_10_gml_2629_0");
        }
    }
}
if (room == room_dw_tv_curtain)
{
    if (extflag == "shadowguy_sax")
    {
        with (obj_dw_ch3_curtainroomnpc)
            shadow_play = true;
        skip = 1;
    }
    if (extflag == "shadowguy")
    {
        with (obj_dw_ch3_curtainroomnpc)
            reset_shadowguy();
        global.msc = 1321;
        scr_text(global.msc);
    }
    if (extflag == "shadowguy_fallen")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (In shock...)/%", "obj_readable_room1_slash_Other_10_gml_2651_0");
    }
    if (extflag == "pippins")
    {
        global.msc = 1323;
        scr_text(global.msc);
    }
    if (extflag == "weather_guys")
    {
        if (read == 0)
        {
            read++;
            with (obj_dw_ch3_curtainroomnpc)
                weather_talk = true;
            skip = 1;
        }
        else
        {
            read++;
            with (obj_dw_ch3_curtainroomnpc)
                weather_pose = true;
            skip = 1;
        }
    }
    if (extflag == "shutta")
    {
        read++;
        with (obj_dw_ch3_curtainroomnpc)
            shutta_talk = true;
        skip = 1;
    }
}
if (room == room_dw_teevie_sams)
{
    scr_speaker("no_name");
    if (read == 0)
    {
        global.msc = 1325;
        scr_text(global.msc);
    }
    else if (extflag == "love")
    {
        msgsetloc(0, "* (Love won...)/%", "obj_readable_room1_slash_Other_10_gml_2738_0");
    }
    else if (extflag == "hate")
    {
        msgsetloc(0, "* (Hate won...)/%", "obj_readable_room1_slash_Other_10_gml_2741_0");
    }
}
if (room == room_dw_teevie_maze_quiz)
{
    var _flag = extflag;
    with (obj_dw_teevie_tv_screens_treasure)
    {
        if (treasure_flag == _flag)
            treasure_sequence = true;
    }
    skip = 1;
}
if (room == room_dw_ranking_hub)
{
    if (extflag == "zapper")
    {
        if (read == 0)
        {
            with (obj_room_ranking_hub)
                con = 0;
        }
        else
        {
            with (obj_room_ranking_hub)
                con = 1;
        }
        skip = 1;
    }
    if (extflag == "z_rank")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* .../%", "obj_readable_room1_slash_Other_10_gml_2778_0");
        if (scr_flag_get(1187) == 0)
        {
            with (obj_room_ranking_hub)
                con = 50;
            skip = 1;
        }
    }
    if (extflag == "locked_door_a")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (The A-rank room..^1. it's shut tightly with aluminum bars.)/", "obj_readable_room1_slash_Other_10_gml_2790_0");
        msgnextloc("* (You hear the desperate clatter of lost fun...)/%", "obj_readable_room1_slash_Other_10_gml_2791_0");
    }
    else if (extflag == "locked_door_b")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (The B-rank room..^1. it's shut tightly with barium bars.)/", "obj_readable_room1_slash_Other_10_gml_2795_0");
        msgnextloc("* (You hear the desperate bouncing of prizes trapped inside...)/%", "obj_readable_room1_slash_Other_10_gml_2796_0");
    }
    else if (extflag == "locked_door_c")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (The C-rank room..^1. it's shut tightly with carbon-fiber bars.)/", "obj_readable_room1_slash_Other_10_gml_2800_0");
        msgnextloc("* (You hear the desperate slurping of those trapped inside...)/%", "obj_readable_room1_slash_Other_10_gml_2801_0");
    }
}
if (room == room_dw_ranking_c)
{
    if (extflag == "crater")
    {
        if (scr_flag_get(1221) == 0)
        {
            with (obj_room_ranking_c)
                con = 1;
            skip = 1;
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (C is for Crater...)/%", "obj_readable_room1_slash_Other_10_gml_2816_0");
        }
    }
}
if (room == room_dw_ranking_b)
{
    if (extflag == "vending")
    {
        with (obj_room_ranking_b)
            show_vending_prompt();
        skip = 1;
    }
}
if (room == room_dw_ranking_a)
{
    if (extflag == "poster_coming_soon")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (\"COMING SOON!\")/%", "obj_readable_room1_slash_Other_10_gml_2836_0");
    }
    else if (extflag == "poster_coming_soon_susiezilla")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (\"COMING SOON!\")/", "obj_readable_room1_slash_Other_10_gml_2840_0");
        msgnextloc("* (..^1. However^1, it seems you can play it immediately.)/%", "obj_readable_room1_slash_Other_10_gml_2841_0");
    }
    else if (extflag == "poster_chef")
    {
        global.msc = 1339;
        scr_text(global.msc);
    }
    else if (extflag == "poster_band")
    {
        global.msc = 1341;
        scr_text(global.msc);
    }
    else if (extflag == "poster_susiezilla")
    {
        global.msc = 1343;
        scr_text(global.msc);
    }
    if (extflag == "door_locked")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (\"COMING SOON ON BOARD 2!\")/", "obj_readable_room1_slash_Other_10_gml_2859_0");
        scr_anyface_next("ralsei", "J");
        msgnextloc("\\EJ* Wonder what we'll end up playing...?/", "obj_readable_room1_slash_Other_10_gml_2861_0");
        scr_anyface_next("susie", "K");
        msgnextloc("\\EK* Guess a game about a giant question mark.../%", "obj_readable_room1_slash_Other_10_gml_2863_0");
    }
    else if (extflag == "door_chef")
    {
        global.msc = 1345;
        scr_text(global.msc);
    }
    else if (extflag == "door_band")
    {
        global.msc = 1347;
        scr_text(global.msc);
        stayer = 4;
    }
    else if (extflag == "door_susiezilla")
    {
        global.msc = 1353;
        scr_text(global.msc);
    }
    if (extflag == "unlock_susiezilla")
    {
        global.msc = 1351;
        scr_text(global.msc);
    }
}
if (room == room_dw_ranking_z_hallway)
{
    if (extflag == "z_rank_door")
    {
        global.msc = 1357;
        scr_text(global.msc);
    }
}
if (room == room_dw_ranking_z)
{
    if (extflag == "manhole")
    {
        global.msc = 1355;
        scr_text(global.msc);
    }
    else if (extflag == "poster")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (It's an old poster. Seems like a collaboration between two stars...)/", "obj_readable_room1_slash_Other_10_gml_2903_0");
        msgnextloc("* (Their smiles seemed so bright...)/%", "obj_readable_room1_slash_Other_10_gml_2904_0");
    }
    else if (extflag == "broken_glass")
    {
        snd_play_x(snd_glassbreak, 0.6, random_range(0.25, 0.5));
        skip = 1;
    }
}
if (room == room_dw_b3bs_interstitial)
{
    if (extflag == "door")
    {
        global.msc = 1290;
        scr_text(global.msc);
    }
    else if (extflag == "door_no_tenna")
    {
        scr_speaker("ralsei");
        msgsetloc(0, "\\Ed* (Seems like the next board isn't ready yet...)/", "obj_readable_room1_slash_Other_10_gml_2921_0");
        msgnextloc("\\E2* (Maybe we should go talk to Tenna?)/%", "obj_readable_room1_slash_Other_10_gml_2922_0");
    }
    else if (extflag == "door_after_tenna")
    {
        if (read == 0)
        {
            scr_speaker("susie");
            msgsetloc(0, "\\E4* (..^1. No next Board until we figure out what's going on.)/%", "obj_readable_room1_slash_Other_10_gml_2928_0");
        }
        else
        {
            scr_speaker("susie");
            msgsetloc(0, "\\EK* (Stop scratching at the door like a dog^1, you idiot.)/", "obj_readable_room1_slash_Other_10_gml_2932_0");
            scr_anyface_next("ralsei", "H");
            msgnextloc("\\EH* (Aww^1, Kris wants walkies...?)/%", "obj_readable_room1_slash_Other_10_gml_2934_0");
        }
    }
}
if (room == room_dw_ranking_t)
{
    if (extflag == "book")
    {
        with (obj_room_ranking_t)
            con = 1;
        skip = 1;
    }
}
if (room == room_dw_teevie_bonus_zone)
{
    if (extflag == "pippins_rummage")
    {
        snd_play_x(snd_pinball, 1, random_range(1, 1.8));
        skip = 1;
    }
}
if (room == room_dw_backstage)
{
    if (extflag == "gacha")
    {
        if (read == 0)
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (A pile of portable prisons for prizes...)/%", "obj_readable_room1_slash_Other_10_gml_2964_0");
        }
        else
        {
            scr_speaker("no_name");
            msgsetloc(0, "* (Ball)/%", "obj_readable_room1_slash_Other_10_gml_2968_0");
        }
    }
}
if (room == room_dw_teevie_dust)
{
    if (extflag == "dustpile_01")
    {
        with (obj_ch3_BTB02)
            con = 0;
        skip = 1;
    }
    else if (extflag == "dustpile_02")
    {
        with (obj_ch3_BTB03)
            con = 0;
        skip = 1;
    }
}
if (room == room_dw_teevie_chef)
{
    if (extflag == "snacks")
    {
        scr_speaker("no_name");
        msgsetloc(0, "* (A snack mix.)/", "obj_readable_room1_slash_Other_10_gml_3034_0");
        msgnextloc("* (All of the bagel chips have been picked out^1, rendering it powerless.)/%", "obj_readable_room1_slash_Other_10_gml_3035_0");
    }
}
if (skip == 0)
{
    mydialoguer = instance_create(0, 0, obj_dialoguer);
    with (mydialoguer)
        stay = stayer;
}
read += 1;
if (skip == 1)
{
    global.interact = 0;
    skip = 0;
}
