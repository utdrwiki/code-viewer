if (scr_debug())
    scr_setparty(0);
con = 0;
timer = 0;
init = 0;
siner = 0;
glass = [];
susie = -4;
moveprops = [];
cutcentx = -4;
cutcenty = -4;
propmove1 = false;
propmove2 = false;
propmove3 = false;
propmovetimer = 0;
prop1 = -4;
prop1text = -4;
prop2 = -4;
prop2text = -4;
layer_set_visible("DEBUG_ASSETS", 0);
layer_set_visible("CUTSCENE_ASSETS_PART1", 0);
layer_set_visible("MAGICAL_GLASS", 0);
var spritesArray = layer_get_all_elements("MAGICAL_GLASS");
for (var i = 0; i < array_length(spritesArray); i++)
{
    var daglass = scr_marker_fromasset(spritesArray[i]);
    with (daglass)
    {
        image_alpha = 0.2;
        depth = layer_get_depth("TILES");
    }
    array_push(glass, daglass);
}
if (scr_debug())
{
    if (keyboard_check(ord("P")))
    {
    }
    scr_musicer("second_church.ogg");
}
roomglow = instance_create(0, 0, obj_roomglow);
roomglow.stayactive = true;
crackglass = 0;
gltimer = 0;
shatter = [];
