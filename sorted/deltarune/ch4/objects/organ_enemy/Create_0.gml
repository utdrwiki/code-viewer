scr_enemy_object_init();
siner = 0;
siner2 = 0;
recruitcount = 5;
talkmax = 90;
image_speed = 0.16666666666666666;
idlesprite = spr_organik_body;
hurtsprite = spr_organik_hurt;
sparedsprite = spr_organik_spare;
custom_draw_example = 1;
harmon_sound = -4;
harmonize = 0;
chorus = 0;
harmonize_highlight = 0;
particletimer = 0;
mercygained = 0;
organsoundcon = 0;
organsoundtimer = 0;
lullabied = 0;
lullatimer = 0;
performtimer = 0;
wicabell_tuning = false;
for (var i = 0; i < instance_number(object_index); i++)
{
    if (instance_find(object_index, i))
    {
        siner = (i + 1) * 100;
        siner2 = i * 33;
    }
}
