con = -1;
customcon = 0;
voice_pitch = -1;
debris = scr_marker_ext(572, 296, spr_old_man_statue_shards, 2, 2, 0, 0, undefined, 97780);
if (global.plot < 240)
{
    con = 25;
    global.interact = 1;
    scr_setparty(1, 1, 0);
    room_offset = 240;
    statue_attack = false;
    statue_attack_timer = 0;
    eye_shine = false;
    lightning_loop = false;
    lightning_active = false;
    lightning_timer = 0;
    lightning_delay = 0;
    susie = -4;
    var susie_instance = -4;
    if (i_ex(obj_caterpillarchara))
    {
        with (obj_caterpillarchara)
        {
            if (name == "susie")
                susie_instance = id;
        }
    }
    susie = susie_instance;
    swap_characters = false;
    anim_timestamps = [330, 200, 200, 330, 330, 330, 50, 60, 60, 60, 60, 1000];
    anim_player = instance_create(0, 0, obj_anim_custom);
    yell_end = false;
}
else
{
    statue_fx = instance_create(0, 0, obj_ch4_DCB02_vfx);
    with (statue_fx)
    {
        mode = 2;
        follow_mode = true;
    }
    var susie_instance = -4;
    var ralsei_instance = -4;
    if (i_ex(obj_caterpillarchara))
    {
        with (obj_caterpillarchara)
        {
            if (name == "susie")
                susie_instance = id;
            if (name == "ralsei")
                ralsei_instance = id;
        }
    }
    statue_fx.statue_target = debris;
    statue_fx.susie_target = susie_instance;
    statue_fx.ralsei_target = ralsei_instance;
    statue_fx.kris_target = 1049;
    with (statue_fx)
        target_characters = [statue_target, ralsei_target, susie_target, kris_target];
    instance_destroy();
}

susie_yell = function()
{
    anim_player.init(su_actor, 5246, anim_timestamps);
    anim_player.start();
};

if (global.plot >= 240)
{
    scr_musicer("raining_in_church2.ogg", 1, undefined, undefined, 30);
    var _statue = debris;
    var party_statue = instance_create(_statue.x, _statue.y, obj_marker_palette);
    party_statue.current_palette = 4425;
    party_statue.palette_index = 1;
    party_statue.sprite_index = _statue.sprite_index;
    with (party_statue)
    {
        image_xscale = 2;
        image_yscale = 2;
        depth = other.debris.depth - 1;
    }
}
