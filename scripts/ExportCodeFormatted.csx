using System.Text;
using System;
using System.IO;
using System.Threading;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Linq;
using Underanalyzer.Decompiler;

EnsureDataLoaded();

string codeFolder = Path.Combine(Path.GetDirectoryName(FilePath), "Export_Code");
Directory.CreateDirectory(codeFolder);

Dictionary<double, string> constMap = new()
{
    { 0.16666666666666666, "1/6" },
    { 0.8333333333333334, "5/6" },
    { 0.016666666666666666, "1/60" },
    { 1.5707963267948966, "pi / 2" },
    { 9.42477796076938, "pi * 3" },
    { 4.71238898038469, "pi * 3/2" },
    { 0.08333333333333333, "5/60" },
    { 94.24777960769379, "pi * 30" },
    { 2.8333333333333335, "17/6" },
    { 0.7853981633974483, "pi / 4" }
};

GlobalDecompileContext globalDecompileContext = new(Data);
// Cast for setters
DecompileSettings settings = new();
settings.RemoveSingleLineBlockBraces = true;
settings.OpenBlockBraceOnSameLine = false;
settings.EmptyLineAroundBranchStatements = false;

foreach (var (constValue, valueMapping) in constMap)
{
    settings.MultiPartPredefinedDoubles.Add(constValue, valueMapping);
}

await Task.Run(() => Parallel.ForEach(
    Data.Code.Where(c => c.ParentEntry is null).ToList(),
    DumpCode
));

void DumpCode(UndertaleCode code)
{
    string path = Path.Combine(codeFolder, $"{code.Name.Content}.gml");
    string decompiled;
    try
    {
        decompiled = new DecompileContext(globalDecompileContext, code, settings)
            .DecompileToString();
    }
    catch (Exception e)
    {
        decompiled = $"/*\nDECOMPILER FAILED!\n\n{e.ToString()}\n*/";
    }
    File.WriteAllText(path, decompiled);
}
