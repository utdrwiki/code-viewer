con = 0;
timer = 0;
init = 0;
siner = 0;
folcon = 0;
foltalked = 0;
makeshadows = [];
makeshadowsyoff = [];
layer_set_visible("DEBUG_ASSETS", 0);
layer_set_visible("TALKABLE_NPCS", 0);
layer_set_visible("FAMILIAR_STATUES", 0);
layer_set_visible("FOLLOWER_SPRITES", 0);
if (scr_debug())
{
    scr_setparty(0);
    if (keyboard_check(ord("P")))
        global.flag[1560] = 0;
}
famcon = 0;
familiars = [];
var spritesArray = layer_get_all_elements("FAMILIAR_STATUES");
for (var i = 0; i < array_length(spritesArray); i++)
{
    var famnpc = scr_makenpc_fromasset(spritesArray[i]);
    with (famnpc)
    {
        setxy(scr_even(x), scr_even(y));
        if (marker.sprite_index == spr_solidenemy)
            marker.visible = false;
    }
    array_push(familiars, famnpc);
}
followers = [];
starwalker = -4;
angyboy = -4;
staradmirer = -4;
var createstar = scr_flag_get(254);
if (scr_debug())
{
    if (keyboard_check(ord("6")))
        createstar = true;
}
spritesArray = layer_get_all_elements("TALKABLE_NPCS");
for (var i = 0; i < array_length(spritesArray); i++)
{
    if (layer_sprite_get_sprite(spritesArray[i]) == 2269)
    {
        if (layer_sprite_get_blend(spritesArray[i]) == 11185407)
        {
            baltadmirer = scr_makenpc_fromasset(spritesArray[i]);
            baltadmirer.marker.image_blend = c_white;
        }
        else
        {
            intronpc = scr_makenpc_fromasset(spritesArray[i]);
        }
    }
    if (layer_sprite_get_sprite(spritesArray[i]) == 1614)
    {
        gueiadmirer = scr_makenpc_fromasset(spritesArray[i]);
        gueiadmirer.marker.image_blend = c_white;
        gueiadmirer.marker.sprite_index = spr_npc_organik_3;
    }
    if (layer_sprite_get_sprite(spritesArray[i]) == 753)
        cupadmirer = scr_makenpc_fromasset(spritesArray[i]);
    if (layer_sprite_get_sprite(spritesArray[i]) == 4325)
    {
        if (layer_sprite_get_blend(spritesArray[i]) == 255)
        {
            waferadmirer = scr_makenpc_fromasset(spritesArray[i]);
            waferadmirer.marker.image_blend = c_white;
        }
        if (layer_sprite_get_blend(spritesArray[i]) == 13893887)
        {
            organadmirer = scr_makenpc_fromasset(spritesArray[i]);
            organadmirer.marker.image_blend = c_white;
        }
        if (createstar)
        {
            if (layer_sprite_get_blend(spritesArray[i]) == 842924)
            {
                staradmirer = scr_makenpc_fromasset(spritesArray[i]);
                staradmirer.marker.image_blend = c_white;
            }
        }
    }
    if (layer_sprite_get_sprite(spritesArray[i]) == 427)
    {
        if (layer_sprite_get_blend(spritesArray[i]) == 255)
        {
            wateradmirer = scr_makenpc_fromasset(spritesArray[i]);
            wateradmirer.marker.image_blend = c_white;
        }
        if (layer_sprite_get_blend(spritesArray[i]) == 49322)
        {
            biblioxadmirer = scr_makenpc_fromasset(spritesArray[i]);
            biblioxadmirer.marker.image_blend = c_white;
        }
    }
    if (layer_sprite_get_sprite(spritesArray[i]) == 1301)
    {
        if (layer_sprite_get_blend(spritesArray[i]) == 3355443)
        {
            angysign = scr_makenpc_fromasset(spritesArray[i]);
            angysign.marker.image_blend = c_white;
            angysign.marker.depth -= 300;
        }
        else
        {
            welcomesign = scr_makenpc_fromasset(spritesArray[i]);
        }
    }
    if (layer_sprite_get_sprite(spritesArray[i]) == 1704)
        watercooler = scr_makenpc_fromasset(spritesArray[i]);
    if (layer_sprite_get_sprite(spritesArray[i]) == 4929)
    {
        angyboy = scr_makenpc_fromasset(spritesArray[i]);
        angyboy.marker.depth -= 200;
    }
    if (layer_sprite_get_sprite(spritesArray[i]) == 1011)
        scr_marker_fromasset(spritesArray[i], undefined, 1);
    if (createstar)
    {
        if (layer_sprite_get_sprite(spritesArray[i]) == 5864)
        {
            starwalker = scr_makenpc_fromasset(spritesArray[i]);
            angyboy.marker.depth -= 200;
        }
    }
}
spritesArray = layer_get_all_elements("FOLLOWER_SPRITES");
for (var i = 0; i < array_length(spritesArray); i++)
{
    var followernpc = scr_marker_fromasset(spritesArray[i]);
    with (followernpc)
    {
        mask_index = spr_npc_organik_spritemask;
        setxy(scr_even(x), scr_even(y));
        scr_depth();
        image_blend = c_white;
    }
    array_push(followers, followernpc);
    if (layer_sprite_get_blend(spritesArray[i]) == 6908265)
    {
        array_push(makeshadows, followernpc);
        array_push(makeshadowsyoff, 0);
    }
}
array_push(makeshadows, intronpc.marker);
array_push(makeshadowsyoff, 0);
array_push(makeshadows, welcomesign.marker);
array_push(makeshadowsyoff, 0);
cutscene = 0;
roomglow = instance_create(x, y, obj_roomglow);
roomglow.stayactive = 1;
enemcon = 0;
encounterflag = 1789;
encounterno = 157;
angymarker = -4;
if (global.flag[encounterflag] != 0)
{
    angysign.x = room_width * 2;
    if (global.flag[encounterflag] == 1)
    {
        enemcon = 99;
        angyboy.x = room_width * 2;
    }
    else
    {
        enemcon = 4;
    }
}
