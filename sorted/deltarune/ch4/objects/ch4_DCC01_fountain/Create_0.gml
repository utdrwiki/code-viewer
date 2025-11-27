depth = 85000;
base_marker = scr_dark_marker(0, 13, spr_titan_fountain_burst_base);
base_marker.depth = depth - 1000;
fountain_marker = scr_dark_marker(0, 0, spr_titan_fountain_burst);
fountain_marker.depth = base_marker.depth - 10;
anim_timestamps = [150, 110, 110, 110, 110, 110, 110, 110, 110, 110, 220, 220, 330, 110, 100];
anim_player_base = instance_create(0, 0, obj_anim_custom);
anim_player_fountain = instance_create(0, 0, obj_anim_custom);
callback = -4;
con = -1;
timer = 0;
fountainanimtimer = 0;
fountainmakesound = -4;
hand = -4;
loops = 0;
beam = -4;
s_uvs = sprite_get_uvs(bg_fountain1, 0);
u_iTime = shader_get_uniform(shd_fountaineffect, "iTime");
u_iPosOffset = shader_get_uniform(shd_fountaineffect, "iPosOffset");
u_iResolution = shader_get_uniform(shd_fountaineffect, "iResolution");
u_uvs = shader_get_uniform(shd_fountaineffect, "uvs");

start = function(arg0)
{
    callback = arg0;
    anim_player_fountain.start();
    anim_player_base.start();
    con = 0;
    timer = 0;
};

fountain_loop = [];
petrify_sequence = [];
petrify_stay = [];

loop_fountain = function()
{
    fountain_marker.sprite_index = spr_titan_fountain_loop;
    fountain_marker.image_index = 0;
    fountain_marker.image_speed = 0.4;
    fountain_marker.y += 826;
    for (var i = 0; i < 4; i++)
    {
        var y_pos = fountain_marker.y - (sprite_get_height(spr_titan_fountain_loop) * 2) - (i * (sprite_get_height(spr_titan_fountain_loop) * 2));
        fountain_loop[i] = scr_dark_marker(0, y_pos, spr_titan_fountain_loop);
        fountain_loop[i].image_speed = 0.4;
    }
    with (anim_player_fountain)
        instance_destroy();
    with (obj_ch4_DCC01_fountain)
    {
        con = 1;
        timer = 0;
    }
    callback();
};

loop_base = function()
{
    base_marker.sprite_index = spr_titan_fountain_loop_base;
    base_marker.image_index = 0;
    base_marker.image_speed = 0.4;
    var base_ring_marker = scr_dark_marker(0, 0, spr_titan_fountain_loop_rings);
    base_ring_marker.depth = base_marker.depth - 10;
    base_ring_marker.image_speed = 0.4;
    scr_doom(base_ring_marker, 400);
    with (anim_player_base)
        instance_destroy();
};

anim_player_fountain.init(fountain_marker, fountain_marker.sprite_index, anim_timestamps);
anim_player_fountain.event_connect("anim_end", loop_fountain);
anim_player_base.init(base_marker, base_marker.sprite_index, anim_timestamps);
anim_player_base.event_connect("anim_end", loop_base);
