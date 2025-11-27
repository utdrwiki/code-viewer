if (con < 0)
    exit;
if (con == 0 && global.interact == 0 && obj_mainchara.x >= 460)
{
    con = 1;
    global.interact = 1;
    var _running = false;
    with (obj_caterpillarchara)
        _running = runmove;
    cutscene_master = scr_cutscene_make();
    scr_maincharacters_actors();
    c_pannable(1);
    var _imagespeed = _running ? 0.3 : 0.2;
    var _walktime = _running ? 20 : 30;
    var _panspeed = _running ? 12 : 20;
    c_pan(220, cameray(), _panspeed);
    c_sel(kr);
    c_autowalk(0);
    c_imagespeed(_imagespeed);
    c_walkdirect(565, 285, _walktime);
    c_delaycmd(_walktime + 1, "imagespeed", 0);
    c_delaycmd(_walktime + 1, "imageindex", 0);
    c_sel(su);
    if (abs(kr_actor.y - su_actor.y) < 20)
    {
        c_autodepth(0);
        c_depth(kr_actor.depth - 10);
    }
    c_autowalk(0);
    c_imagespeed(_imagespeed);
    c_walkdirect(936, 268, _walktime + 60);
    c_delaycmd(_walktime + 60 + 1, "imagespeed", 0);
    c_delaycmd(_walktime + 60 + 1, "imageindex", 0);
    c_sel(ra);
    c_autowalk(0);
    c_imagespeed(_imagespeed);
    c_walkdirect(460, 269, _walktime + 10);
    c_delaycmd(_walktime + 10 + 1, "imagespeed", 0);
    c_delaycmd(_walktime + 10 + 1, "imageindex", 0);
    c_wait_if(su_actor, "x", ">=", 745);
    c_sel(su);
    c_autodepth(1);
    c_autowalk(1);
    c_sel(ra);
    c_sprite(spr_ralsei_head_down_sad_right);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\E2* (Umm..^1. Kris..^1. Since now seems like a good moment...)/", "obj_room_puzzle_closet_1a_slash_Step_0_gml_72_0");
    c_msgnextloc("\\Ed* (..^1. We haven't really been able to..^1. discuss much for a while.)/%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_73_0");
    c_talk();
    c_wait_box(1);
    c_sel(kr);
    c_autowalk(1);
    c_facing("l");
    c_wait_talk();
    c_wait(15);
    c_msc(1385);
    c_talk_wait();
    c_waitcustom();
}
if (con == 1 && customcon == 1 && answer >= 0)
{
    con = 2;
    scr_flag_set(1214, answer + 1);
    if (answer == 0)
    {
        con = 5;
    }
    else if (answer == 1)
    {
        con = 8;
    }
    else
    {
        con = 50;
        customcon = 0;
        c_waitcustom_end();
        c_speaker("ralsei");
        c_msgsetloc(0, "\\EK* (Umm^1, okay...!)/%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_112_0");
        c_talk_wait();
        c_waitcustom();
    }
    reset_answer();
}
if (con == 5 && customcon == 1 && !d_ex())
{
    con = 6;
    customcon = 0;
    c_waitcustom_end();
    c_sel(ra);
    c_facing("d");
    c_sel(kr);
    c_walkdirect_speed(885, kr_actor.y, 4);
    c_panspeed_wait(4, 0, 100);
    c_wait(30);
    c_sel(su);
    c_sprite(spr_susie_surprised_right);
    c_speaker("susie");
    c_msgsetloc(0, "\\E0* ..^1. what?/%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_145_0");
    c_talk_wait();
    c_sel(su);
    c_facing("l");
    c_speaker("susie");
    c_msgsetloc(0, "\\E1* You wanna say something?/%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_153_0");
    c_talk_wait();
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\EK* \"Ask Susie how she's doing?\"/%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_160_0");
    c_talk_wait();
    c_sel(su);
    c_facing("u");
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\ED* ..^1. uh^1, good^1, I guess./%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_170_0");
    c_talk_wait();
    c_wait(30);
    c_sel(su);
    c_facing("l");
    c_speaker("susie");
    c_msgsetloc(0, "\\EK* (Honestly? Playing with Ralsei and you has been great. Just...)/%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_181_0");
    c_talk_wait();
    c_sel(su);
    c_sprite(spr_susie_look_down_left);
    c_wait(15);
    c_speaker("susie");
    c_msgsetloc(0, "\\ED* (We kinda..^1. skipped over the whole^1, Dark World's not real thing.)/%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_190_0");
    c_talk_wait();
    c_sel(su);
    c_facing("l");
    c_wait(15);
    c_speaker("susie");
    c_msgsetloc(0, "\\ET* (I mean^1, I kind of knew it..^1. couldn't be^1, you know.)/", "obj_room_puzzle_closet_1a_slash_Step_0_gml_200_0");
    c_msgnextloc("\\ES* (Like^1, going on adventures^1, making friends...)/", "obj_room_puzzle_closet_1a_slash_Step_0_gml_201_0");
    c_msgnextloc("\\ET* (It..^1. it already all sounds like a dream.)/%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_202_0");
    c_talk_wait();
    c_sprite(spr_susie_look_down_left);
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\ES* (So the fact that it kind of is...)/%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_211_0");
    c_talk_wait();
    c_sel(su);
    c_facing("l");
    c_wait(15);
    c_msc(1387);
    c_talk_wait();
    c_waitcustom();
}
if (con == 6 && !d_ex() && customcon == 1 && answer >= 0)
{
    con = 50;
    customcon = 0;
    scr_flag_set(1215, answer + 1);
    c_waitcustom_end();
    if (answer == 0 || answer == 1)
    {
        c_sel(su);
        c_sprite(spr_susie_surprised_left);
        c_wait(60);
        c_autowalk(0);
        c_sprite(spr_susie_laugh_dw);
        c_imagespeed(0.2);
        c_addxy(4, 4);
        c_snd_play(snd_suslaugh);
        c_speaker("susie");
        c_msgsetloc(0, "\\E9* Hahahaha!/%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_250_0");
        c_talk_wait();
        c_wait(30);
        c_halt();
        if (answer == 0)
        {
            c_speaker("susie");
            c_msgsetloc(0, "\\E2* The stupid^1, creepy way you said that..^1. pretty good./%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_260_0");
        }
        else
        {
            c_speaker("susie");
            c_msgsetloc(0, "\\E2* The stupid^1, fake-heroic way you said that..^1. pretty good./%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_264_0");
        }
        c_talk_wait();
        c_sel(su);
        c_autowalk(1);
        c_facing("l");
        c_addxy(-4, -4);
        c_wait(15);
        c_speaker("susie");
        c_msgsetloc(0, "\\E9* Arright^1, Kris. If Ralsei can't come to the Light World.../", "obj_room_puzzle_closet_1a_slash_Step_0_gml_278_0");
        c_msgnextloc("\\EY* Then YOU'RE gonna wear doggy ears and do my homework./%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_279_0");
        c_talk_wait();
        c_sel(su);
        c_facing("u");
        c_wait(15);
        c_speaker("susie");
        c_msgsetloc(0, "\\E9* ..^1. stop howling^1! Man^1, you're such a pain in the ass. Heh./%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_289_0");
        c_talk_wait();
    }
    else
    {
        c_sel(su);
        c_facing("l");
        c_speaker("susie");
        c_msgsetloc(0, "\\EY* Haha^1, like you're one to talk^1, idiot!/", "obj_room_puzzle_closet_1a_slash_Step_0_gml_298_0");
        c_msgnextloc("\\EW* You got so few friends.../", "obj_room_puzzle_closet_1a_slash_Step_0_gml_299_0");
        c_msgnextloc("\\EX* Your mom was even happy you^1, heh.../%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_300_0");
        c_talk_wait();
        c_sprite(spr_susie_look_down_left);
        c_wait(15);
        c_speaker("susie");
        c_msgsetloc(0, "\\ES* ..^1. uh^1, made friends with me^1, I guess./", "obj_room_puzzle_closet_1a_slash_Step_0_gml_308_0");
        c_msgnextloc("\\ER* .../%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_309_0");
        c_talk_wait();
        c_sprite(spr_susie_look_down_right_smile);
        c_flip("x");
        c_wait(15);
        c_speaker("susie");
        c_msgsetloc(0, "\\ES* ..^1. man^1, we could've been friends way before./%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_318_0");
        c_talk_wait();
        c_facing("l");
        c_flip("x");
        c_wait(15);
        c_speaker("susie");
        c_msgsetloc(0, "\\E9* Isn't that stupid...?/%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_327_0");
        c_talk_wait();
    }
    c_wait(30);
    c_speaker("susie");
    c_msgsetloc(0, "\\ES* ..^1. But yeah^1, maybe it's not real. The dark world./%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_335_0");
    c_talk_wait();
    c_sprite(spr_susie_look_down_left);
    c_wait(15);
    c_speaker("susie");
    c_msgsetloc(0, "\\EN* (I just wish Ralsei would realize...)/", "obj_room_puzzle_closet_1a_slash_Step_0_gml_343_0");
    c_msgnextloc("\\ED* (That doesn't matter to me so much.)/%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_344_0");
    c_talk_wait();
    c_wait(30);
    c_sel(kr);
    c_walkdirect_speed(550, 285, 4);
    c_sel(su);
    c_walkdirect_speed(644, 268, 4);
    c_sel(ra);
    c_delayfacing(60, "r");
    c_panspeed_wait(-4, 0, 90);
    c_wait(30);
    c_waitcustom();
    reset_answer();
}
if (con == 8 && customcon == 1 && !d_ex())
{
    con = 9;
    customcon = 0;
    c_waitcustom_end();
    c_sel(ra);
    c_sprite(spr_ralsei_walk_right_blush);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\ED* Huh? How I'm doing? Umm.../%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_382_0");
    c_talk_wait();
    c_wait(30);
    c_sel(ra);
    c_sprite(spr_ralsei_smile_up);
    c_flip("x");
    c_speaker("ralsei");
    c_msgsetloc(0, "\\E2* Those games were a lot of fun^1, weren't they?/", "obj_room_puzzle_closet_1a_slash_Step_0_gml_393_0");
    c_msgnextloc("\\EJ* I've never played such a game before..^1. I kind of.../%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_394_0");
    c_talk_wait();
    c_sprite(spr_ralsei_head_down_sad_right);
    c_flip("x");
    c_wait(15);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EQ* I kind of got so wrapped up.../%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_404_0");
    c_talk_wait();
    c_facing("r");
    c_wait(15);
    c_msc(1389);
    c_talk_wait();
    c_waitcustom();
}
if (con == 9 && !d_ex() && customcon == 1 && answer >= 0)
{
    con = 10;
    customcon = 0;
    scr_flag_set(1216, answer + 1);
    c_waitcustom_end();
    if (answer == 0)
    {
        c_sel(ra);
        c_sprite(spr_ralsei_walk_right_blush);
        c_speaker("ralsei");
        c_msgsetloc(0, "\\EH* Haha^1! Kris^1, you're always so kind.../%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_434_0");
        c_talk_wait();
    }
    else
    {
        c_sprite(spr_ralsei_head_down_sad_right);
        c_speaker("ralsei");
        c_msgsetloc(0, "\\Ee* E-Exactly^1! I knew I got a little too carried away!/%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_442_0");
        c_talk_wait();
    }
    c_facing("u");
    c_wait(30);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\Ed* ..^1. um..^1. Anyway^1, those games were fun^1, but.../%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_451_0");
    c_talk_wait();
    c_sprite(spr_ralsei_walk_up_sad);
    c_wait(15);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\Ea* ..^1. I'm not sure they could replace the festival.../", "obj_room_puzzle_closet_1a_slash_Step_0_gml_459_0");
    c_msgnextloc("\\Ed* .../%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_460_0");
    c_talk_wait();
    c_wait(30);
    c_facing("u");
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EQ* Kris^1, can..^1. I ask something selfish?/", "obj_room_puzzle_closet_1a_slash_Step_0_gml_469_0");
    c_msgnextloc("\\E2* On the day of the festival.../%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_470_0");
    c_talk_wait();
    c_sprite(spr_ralsei_walk_up_sad);
    c_wait(15);
    c_speaker("ralsei");
    c_msgsetloc(0, "\\EJ* Perhaps..^1. if you could purchase some ice cream or something.../%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_478_0");
    c_talk_wait();
    c_facing("r");
    c_wait(15);
    c_msc(1391);
    c_talk_wait();
    c_waitcustom();
    reset_answer();
}
if (con == 10 && !d_ex() && customcon == 1 && answer >= 0)
{
    con = 50;
    customcon = 0;
    scr_flag_set(1217, answer + 1);
    c_waitcustom_end();
    if (answer == 0)
    {
        con = 11;
        c_sprite(spr_ralsei_surprised_right_walk);
        c_wait(15);
        c_msc(1393);
        c_talk_wait();
    }
    else if (answer == 1 || answer == 2)
    {
        if (answer == 1)
        {
            c_sprite(spr_ralsei_surprised_right_walk);
            c_speaker("ralsei");
            c_msgsetloc(0, "\\ED* O-Of course^1, Kris^1! I mean^1, it'd be your money!/%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_520_0");
            c_talk_wait();
            c_sprite(spr_ralsei_head_down_sad_right);
            c_speaker("ralsei");
            c_msgsetloc(0, "\\Ea* And it's not like..^1. I would've contributed anything^1, anyway./", "obj_room_puzzle_closet_1a_slash_Step_0_gml_527_0");
            c_msgnextloc("\\EQ* I realized^1, you know.../%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_528_0");
            c_talk_wait();
            c_wait(30);
            c_speaker("ralsei");
            c_msgsetloc(0, "\\Ea* Being friends is..^1. a responsibility./%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_535_0");
            c_talk_wait();
        }
        else
        {
            c_sel(ra);
            c_sprite(spr_ralsei_smile_up);
            c_flip("x");
            c_speaker("ralsei");
            c_msgsetloc(0, "\\EP* Thank you^1, Kris!/%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_544_0");
            c_talk_wait();
            c_wait(30);
            c_sprite(spr_ralsei_head_down_sad_right);
            c_flip("x");
            c_speaker("ralsei");
            c_msgsetloc(0, "\\EQ* I realized..^1. being friends is..^1. a responsibility./%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_553_0");
            c_talk_wait();
        }
        c_wait(30);
        c_facing("u");
        c_speaker("ralsei");
        c_msgsetloc(0, "\\Ea* A responsibility..^1. I can't..^1. fully complete./", "obj_room_puzzle_closet_1a_slash_Step_0_gml_563_0");
        c_msgnextloc("\\EQ* The cakes I bake^1, the cotton candy we eat^1, it might be yummy./%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_564_0");
        c_talk_wait();
        c_sprite(spr_ralsei_walk_up_sad);
        c_wait(15);
        c_speaker("ralsei");
        c_msgsetloc(0, "\\Ea* ..^1. But^1, when you return to the Light World^1, you won't be full./%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_572_0");
        c_talk_wait();
        c_wait(30);
        c_sprite(spr_ralsei_head_down_sad_right);
        c_speaker("ralsei");
        c_msgsetloc(0, "\\EQ* Kris^1, at least as long as you're there.../", "obj_room_puzzle_closet_1a_slash_Step_0_gml_581_0");
        c_msgnextloc("\\EB* I can know she won't be lonely^1, or hungry./%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_582_0");
        c_talk_wait();
        c_wait(30);
        c_facing("r");
        c_speaker("ralsei");
        c_msgsetloc(0, "\\E2* ..^1. Thank you^1, Kris./%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_591_0");
        c_talk_wait();
        c_wait(30);
    }
    c_waitcustom();
    reset_answer();
}
if (con == 11 && !d_ex() && customcon == 1 && answer >= 0)
{
    con = 50;
    customcon = 0;
    scr_flag_set(1218, answer + 1);
    c_waitcustom_end();
    if (answer == 0)
    {
        if (scr_sideb_get_phase() > 0)
        {
            c_sprite(spr_ralsei_head_down_sad_right);
            c_wait(15);
            c_speaker("ralsei");
            c_msgsetloc(0, "\\EC* N..^1. Noelle?/", "obj_room_puzzle_closet_1a_slash_Step_0_gml_621_0");
            c_msgnextloc("\\EQ* Kris^1, I.../", "obj_room_puzzle_closet_1a_slash_Step_0_gml_622_0");
            c_msgnextloc("\\Ee* I think that's.../%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_623_0");
            c_talk_wait();
            c_facing("u");
            c_speaker("ralsei");
            c_msgsetloc(0, "\\E8* .../%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_630_0");
            c_talk_wait();
            c_wait(30);
            c_sprite(spr_ralsei_walk_up_sad);
            c_wait(15);
            c_speaker("ralsei");
            c_msgsetloc(0, "\\Eb* A bad choice./%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_640_0");
            c_talk_wait();
            c_sprite(spr_ralsei_smile_up);
            c_flip("x");
            c_speaker("ralsei");
            c_msgsetloc(0, "\\EU* I mean^1, I'm sorry^1! A bad choice to^1, make alone./%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_648_0");
            c_talk_wait();
            c_sprite(spr_ralsei_head_down_sad_right);
            c_flip("x");
            c_wait(15);
            c_speaker("ralsei");
            c_msgsetloc(0, "\\EQ* Noelle^1, might want to go with Susie.../%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_657_0");
            c_talk_wait();
            c_facing("r");
            c_speaker("ralsei");
            c_msgsetloc(0, "\\Ee* I hope you can..^1. figure out a nice solution!/%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_664_0");
            c_talk_wait();
        }
        else
        {
            c_facing("r");
            c_speaker("ralsei");
            c_msgsetloc(0, "\\EL* Noelle...?/%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_672_0");
            c_talk_wait();
            c_sprite(spr_ralsei_head_down_sad_right);
            c_wait(15);
            c_speaker("ralsei");
            c_msgsetloc(0, "\\EK* Umm^1, I'm sure if Susie was with you^1, too.../%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_680_0");
            c_talk_wait();
            c_facing("r");
            c_wait(15);
            c_speaker("ralsei");
            c_msgsetloc(0, "\\EJ* Noelle would probably really appreciate it!/", "obj_room_puzzle_closet_1a_slash_Step_0_gml_688_0");
            c_msgnextloc("\\EG* I'm sure the three of you would have a lot of fun!/%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_689_0");
            c_talk_wait();
            c_sprite(spr_ralsei_head_down_sad_right);
            c_speaker("ralsei");
            c_msgsetloc(0, "\\EQ* Umm^1, if it's..^1. the three of you./%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_696_0");
            c_talk_wait();
        }
    }
    else if (answer == 1)
    {
        c_sel(ra);
        c_sprite(spr_ralsei_walk_right_blush);
        c_speaker("ralsei");
        c_msgsetloc(0, "\\ED* K-Kris^1! Y-You know I can't go.../%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_706_0");
        c_talk_wait();
        c_sprite(spr_ralsei_walk_blush_hide);
        c_wait(15);
        c_speaker("ralsei");
        c_msgsetloc(0, "\\E1* Umm^1, maybe I should ask Susie to get YOU an ice cream?/%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_714_0");
        c_talk_wait();
        c_wait(30);
        c_sprite(spr_ralsei_walk_blush_peek);
        c_speaker("ralsei");
        c_msgsetloc(0, "\\E2* And^1, um..^1. ride the ferris wheel with you for me...?/%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_723_0");
        c_talk_wait();
        c_sprite(spr_ralsei_surprised_right_walk);
        c_wait(15);
        c_speaker("ralsei");
        c_msgsetloc(0, "\\EN* W-wait^1! Just..^1. Make sure Susie has a good time!/%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_731_0");
        c_talk_wait();
        c_sprite(spr_ralsei_head_down_sad_right);
        c_speaker("ralsei");
        c_msgsetloc(0, "\\Ea* Make sure she's not lonely..^1. is all I'm asking./%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_738_0");
        c_talk_wait();
    }
    else if (answer == 2)
    {
        c_sprite(spr_ralsei_head_down_sad_right);
        c_wait(15);
        c_speaker("ralsei");
        c_msgsetloc(0, "\\EL* .../%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_747_0");
        c_talk_wait();
        c_wait(30);
        c_facing("r");
        c_speaker("ralsei");
        c_msgsetloc(0, "\\EK* Berdly?/%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_755_0");
        c_talk_wait();
        c_sprite(spr_ralsei_head_down_sad_right);
        c_wait(15);
        c_speaker("ralsei");
        c_msgsetloc(0, "\\EM* .../%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_763_0");
        c_talk_wait();
        c_wait(15);
        c_sprite(spr_ralsei_smile_up);
        c_flip("x");
        c_speaker("ralsei");
        c_msgsetloc(0, "\\EJ* Umm^1, you don't have to repeat yourself so loudly^1, Kris./", "obj_room_puzzle_closet_1a_slash_Step_0_gml_773_0");
        c_msgnextloc("\\EU* I - you don't have to repeat yourself^1, Kris./", "obj_room_puzzle_closet_1a_slash_Step_0_gml_774_0");
        c_msgnextloc("\\EQ* If^1, it's what you really want^1, Kris!/%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_775_0");
        c_talk_wait();
        c_sprite(spr_ralsei_head_down_sad_right);
        c_flip("x");
        c_speaker("ralsei");
        c_msgsetloc(0, "\\EK* I'm sure Susie would be happy to see you^1, um^1, spread your wings.../%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_783_0");
        c_talk_wait();
    }
    else
    {
        c_sprite(spr_ralsei_head_down_sad_right);
        c_speaker("ralsei");
        c_msgsetloc(0, "\\Ed* You mean..^1. maybe.../%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_791_0");
        c_talk_wait();
        c_wait(15);
        c_facing("r");
        c_speaker("ralsei");
        c_msgsetloc(0, "\\EK* You and Susie could just go to the Castle Town together?/", "obj_room_puzzle_closet_1a_slash_Step_0_gml_800_0");
        c_msgnextloc("\\EJ* And spend time with..^1. all of us instead...?/", "obj_room_puzzle_closet_1a_slash_Step_0_gml_801_0");
        c_msgnextloc("\\E1* Kris..^1. That would be really sweet./%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_802_0");
        c_talk_wait();
        c_wait(30);
        c_sprite(spr_ralsei_head_down_sad_right);
        c_speaker("ralsei");
        c_msgsetloc(0, "\\EQ* (Umm^1, I hope that's what you meant...)/%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_811_0");
        c_talk_wait();
    }
    c_waitcustom();
    reset_answer();
}
if (con == 50 && !d_ex() && customcon == 1)
{
    con = 51;
    customcon = 0;
    global.facing = 0;
    c_waitcustom_end();
    if (scr_flag_get(1214) > 1)
    {
        c_sel(ra);
        c_delayfacing(15, "r");
        c_sel(kr);
        c_delayfacing(15, "r");
        c_sel(su);
        c_setxy(camerax() + view_wport[0] + 80, 268);
        c_walkdirect_speed_wait(674, 268, 6);
        c_speaker("susie");
        c_msgsetloc(0, "\\EL* Hey^1, are you guys going to hang around talking all day or what?/", "obj_room_puzzle_closet_1a_slash_Step_0_gml_843_0");
        c_msgnextloc("\\E2* Let's go./%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_844_0");
        c_talk_wait();
    }
    else
    {
        c_sel(ra);
        c_sprite(spr_ralsei_smile_up);
        c_flip("x");
        c_speaker("ralsei");
        c_msgsetloc(0, "\\EJ* (Seems like everything went alright...?)/%", "obj_room_puzzle_closet_1a_slash_Step_0_gml_853_0");
        c_talk();
        c_wait_box(1);
        c_sel(ra);
        c_facing("r");
        c_flip("x");
        c_wait_talk();
    }
    c_pannable(1);
    c_panobj(kr_actor, 15);
    c_wait(16);
    c_pannable(0);
    c_sel(kr);
    c_facing("d");
    c_actortokris();
    c_actortocaterpillar();
    c_terminatekillactors();
}
if (con == 51 && !i_ex(obj_cutscene_master))
{
    con = -1;
    global.interact = 0;
    global.facing = 0;
    with (obj_caterpillarchara)
        scr_caterpillar_interpolate();
}
