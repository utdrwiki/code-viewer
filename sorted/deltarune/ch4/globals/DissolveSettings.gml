function DissolveSettings(arg0, arg1, arg2, arg3, arg4)
{
    _Dissolve_Shader = 35;
    _u_DissolveTex = shader_get_sampler_index(_Dissolve_Shader, "DissolveTex");
    _u_Dissolve = shader_get_uniform(_Dissolve_Shader, "Dissolve");
    _u_DissolveUV = shader_get_uniform(_Dissolve_Shader, "DissolveUV");
    _u_DefaultUV = shader_get_uniform(_Dissolve_Shader, "DefaultUV");
    _u_DissolveEdge = shader_get_uniform(_Dissolve_Shader, "Edge");
    _u_DissolveC1 = shader_get_uniform(_Dissolve_Shader, "C1");
    _u_DissolveC2 = shader_get_uniform(_Dissolve_Shader, "C2");
    _DissolveTex = sprite_get_texture(arg0, arg1);
    _DissolveTexUvs = sprite_get_uvs(arg0, arg1);
    _DissolveC1 = [colour_get_red(arg2) / 255, colour_get_green(arg2) / 255, colour_get_blue(arg2) / 255];
    _DissolveC2 = [colour_get_red(arg3) / 255, colour_get_green(arg3) / 255, colour_get_blue(arg3) / 255];
    _DissolveEdge = arg4;
}
