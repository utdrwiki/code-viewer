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

GlobalDecompileContext globalDecompileContext = new(Data);
// Cast for setters
DecompileSettings decompilerSettings = new();
decompilerSettings.RemoveSingleLineBlockBraces = true;
decompilerSettings.OpenBlockBraceOnSameLine = false;
decompilerSettings.EmptyLineAroundBranchStatements = false;

decompilerSettings.MultiPartPredefinedDoubles.Add(0.16666666666666666, "1/6");
decompilerSettings.MultiPartPredefinedDoubles.Add(0.8333333333333334, "5/6");
decompilerSettings.MultiPartPredefinedDoubles.Add(0.016666666666666666, "1/60");
decompilerSettings.MultiPartPredefinedDoubles.Add(1.5707963267948966, "pi / 2");
decompilerSettings.MultiPartPredefinedDoubles.Add(9.42477796076938, "pi * 3");
decompilerSettings.MultiPartPredefinedDoubles.Add(4.71238898038469, "pi * 3/2");
decompilerSettings.MultiPartPredefinedDoubles.Add(0.08333333333333333, "5/60");
decompilerSettings.MultiPartPredefinedDoubles.Add(94.24777960769379, "pi * 30");
decompilerSettings.MultiPartPredefinedDoubles.Add(2.8333333333333335, "17/6");
decompilerSettings.MultiPartPredefinedDoubles.Add(0.7853981633974483, "pi / 4");

List<UndertaleCode> toDump = Data.Code.Where(c => c.ParentEntry is null).ToList();

Parallel.ForEach(toDump, DumpCode);

ScriptMessage($"Export Complete.\n\nDumped {toDump.Count}/{Data.Code.Count} entries.\nLocation: {codeFolder}");

void DumpCode(UndertaleCode code)
{
    string path = Path.Combine(codeFolder, code.Name.Content + ".gml");
    string content;
    try
    {
        content = new DecompileContext(globalDecompileContext, code, decompilerSettings).DecompileToString();
    }
    catch (Exception e)
    {
        content = $"/*\nDECOMPILER FAILED!\n\n{e}\n*/";
    }

    File.WriteAllText(path, content);
}
