using System;
EnsureDataLoaded();

Underanalyzer.Decompiler.DecompileSettings decompSettings = Data.ToolInfo.DecompilerSettings;
decompSettings.RemoveSingleLineBlockBraces = true;
decompSettings.OpenBlockBraceOnSameLine = false;
decompSettings.EmptyLineAroundBranchStatements = false;

#load "../utmt/UndertaleModTool/Scripts/Resource Unpackers/ExportAllCode.csx"
