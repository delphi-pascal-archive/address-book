unit NP;                                 

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ToolWin, StdCtrls, Spin, XPMenu, ImgList, ShellApi,
  IniFiles, XpMan, AppEvnts, XPLabel, XPEdit, ExtCtrls, Registry, rmComboBox,
  rmScrollableControl, rmListControl, rmOutlook, rmBaseEdit, rmBtnEdit,
  Printers, Buttons, WinInet, ClipBrd, ActnList;

  function OpenSaveFileDialog(ParentHandle: THandle; const DefExt, Filter, InitialDir,
  Title: string; var FileName: string; IsOpenDialog: Boolean): Boolean;

   type
   TWmMoving = record
   Msg: Cardinal;
   fwSide: Cardinal;
   lpRect: PRect;
   Result: Integer;
   end;

  const
   AlignCenter = Wm_User + 1024;
   Tray        = Wm_User + 1;
   Cherta      = Wm_User + 2;
   About       = Wm_User + 3;
   Cherta2     = Wm_User + 4;
   OnTopFrm    = Wm_User + 5;
   FullScr     = Wm_User + 6;

 type
   TMainForm = class(TForm)
    StatusBar: TStatusBar;
    AppEvents: TApplicationEvents;
    DropToolBarMenu: TPopupMenu;
    ToolBarImages: TImageList;
    RecordsListMenu: TPopupMenu;
    ClearAll2Item: TMenuItem;
    Delete2Item: TMenuItem;
    sp24: TMenuItem;
    Edit2Item: TMenuItem;
    Create2Item: TMenuItem;
    RecordsList: TListBox;
    MainMenu: TMainMenu;
    SaveItem: TMenuItem;
    FileItem: TMenuItem;
    PrintTableItem: TMenuItem;
    sp1: TMenuItem;
    ImportItem: TMenuItem;
    ExportItem: TMenuItem;
    sp2: TMenuItem;
    AttributesItem: TMenuItem;
    sp3: TMenuItem;
    ExitItem: TMenuItem;
    CreatingItem: TMenuItem;
    CreateItem: TMenuItem;
    EditItem: TMenuItem;
    DeleteItem: TMenuItem;
    ClearAllItem: TMenuItem;
    sp4: TMenuItem;
    ToolsItem: TMenuItem;
    ToolBarItem: TMenuItem;
    SearchBarItem: TMenuItem;
    OnTopItem: TMenuItem;
    FullScreenItem: TMenuItem;
    UserAddressItem: TMenuItem;
    PreferencesItem: TMenuItem;
    HelpItem: TMenuItem;
    SysInfoItem: TMenuItem;
    LicItem: TMenuItem;
    GNUItem: TMenuItem;
    SendLetterItem: TMenuItem;
    SendReportItem: TMenuItem;
    SourceCodeItem: TMenuItem;
    AboutItem: TMenuItem;
    sp12: TMenuItem;
    sp9: TMenuItem;
    sp10: TMenuItem;
    sp11: TMenuItem;
    sp8: TMenuItem;
    sp5: TMenuItem;
    StatusBarItem: TMenuItem;
    sp6: TMenuItem;
    sp7: TMenuItem;
    CoolBar: TCoolBar;
    TrayMenu: TPopupMenu;
    RestoreItem: TMenuItem;
    HaltItem: TMenuItem;
    QuickFindPanel: TXPEdit;
    MinimizedItem: TMenuItem;
    sp13: TMenuItem;
    PrintDatesItem: TMenuItem;
    StyleTableItem: TMenuItem;
    ToolBar: TToolBar;
    PrintBt: TToolButton;
    ExportBt: TToolButton;
    ImportBt: TToolButton;
    PropertiesBt: TToolButton;
    CreateBt: TToolButton;
    ChangeBt: TToolButton;
    DeleteBt: TToolButton;
    HomeBt: TToolButton;
    SearchBt: TToolButton;
    CopyBt: TToolButton;
    SourceCodeBt: TToolButton;
    AboutBt: TToolButton;
    sp15: TToolButton;
    sp16: TToolButton;
    sp17: TToolButton;
    sp18: TToolButton;
    sp19: TToolButton;
    sp20: TToolButton;
    sp21: TToolButton;
    sp22: TToolButton;
    CopyItem: TMenuItem;
    UserAddress2Item: TMenuItem;
    ExitBt: TToolButton;
    sp14: TMenuItem;
    SysIntItem: TMenuItem;
    sp25: TMenuItem;
    PrintDates2Item: TMenuItem;
    Copy2Item: TMenuItem;
    GoogleSearchItem: TMenuItem;
    SendMailBt: TToolButton;
    DropToolBar2Menu: TPopupMenu;
    UserMail2Item: TMenuItem;
    UserMailItem: TMenuItem;
    T1: TTimer;
    sp23: TMenuItem;
    SortbyNameItem: TMenuItem;
    ClearBufferItem: TMenuItem;
    WinHeadItem: TMenuItem;
    MainMenuItem: TMenuItem;
    ViewItem: TMenuItem;
    SetStatusBarItem: TMenuItem;
    sp26: TMenuItem;
    StatusBarMenu: TPopupMenu;
    SetStatusBar2Item: TMenuItem;
    sp27: TMenuItem;
    ResetItem: TMenuItem;
    TipDayItem: TMenuItem;
    HomePageItem: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AppEventsIdle(Sender: TObject; var Done: Boolean);
    procedure QuickFindPanelChange(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure SaveItemClick(Sender: TObject);
    procedure AboutItemClick(Sender: TObject);
    procedure SourceCodeItemClick(Sender: TObject);
    procedure SendReportItemClick(Sender: TObject);
    procedure SendLetterItemClick(Sender: TObject);
    procedure GNUItemClick(Sender: TObject);
    procedure LicItemClick(Sender: TObject);
    procedure SysInfoItemClick(Sender: TObject);
    procedure ImportItemClick(Sender: TObject);
    procedure ExportItemClick(Sender: TObject);
    procedure AttributesItemClick(Sender: TObject);
    procedure ExitItemClick(Sender: TObject);
    procedure CreateItemClick(Sender: TObject);
    procedure EditItemClick(Sender: TObject);
    procedure DeleteItemClick(Sender: TObject);
    procedure ClearAllItemClick(Sender: TObject);
    procedure UserAddressItemClick(Sender: TObject);
    procedure FullScreenItemClick(Sender: TObject);
    procedure OnTopItemClick(Sender: TObject);
    procedure StatusBarItemClick(Sender: TObject);
    procedure PreferencesItemClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure RecordsListMouseDown(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RestoreItemClick(Sender: TObject);
    procedure ToolBarItemClick(Sender: TObject);
    procedure MinimizedItemClick(Sender: TObject);
    procedure PrintTableItemClick(Sender: TObject);
    procedure PrintDatesItemClick(Sender: TObject);
    procedure StyleTableItemClick(Sender: TObject);
    procedure CopyItemClick(Sender: TObject);
    procedure RecordsListDblClick(Sender: TObject);
    procedure SearchBarItemClick(Sender: TObject);
    procedure SearchBtClick(Sender: TObject);
    procedure SysIntItemClick(Sender: TObject);
    procedure GoogleSearchItemClick(Sender: TObject);
    procedure UserMail2ItemClick(Sender: TObject);
    procedure T1Timer(Sender: TObject);
    procedure ToolBarDblClick(Sender: TObject);
    procedure SortbyNameItemClick(Sender: TObject);
    procedure RecordsListDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure RecordsListDragOver(Sender, Source: TObject; X, Y: Integer;
    State: TDragState; var Accept: Boolean);
    procedure ClearBufferItemClick(Sender: TObject);
    procedure WinHeadItemClick(Sender: TObject);
    procedure MainMenuItemClick(Sender: TObject);
    procedure SetStatusBarItemClick(Sender: TObject);
    procedure ResetItemClick(Sender: TObject);
    procedure HaltItemClick(Sender: TObject);
    procedure TipDayItemClick(Sender: TObject);
    procedure RecordsListKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure QuickFindPanelDblClick(Sender: TObject);
    procedure HomePageItemClick(Sender: TObject);

  private

    SM: HWND;

    ForbidMultiple : THandle;

    Icon: TNotifyIconData;

    Ini : TIniFile;

    R : TRegistry;

    procedure HideProHeading;
    
    procedure ShowProHeading;

    procedure WMGetMinMaxInfo(var msg: TWMGetMinMaxInfo);
    message WM_GETMINMAXINFO;

    procedure ChangeMessageBoxPosition(var Msg: TMessage);
    message AlignCenter;

    procedure ShowHint(Sender: TObject);

    procedure MinimizeApplication(Sender: TObject);

    procedure SystemTrayMenu(var Oleg: TMessage);
    message Tray;

    procedure MySystemMenu(var MySysMenu: TWmSysCommand);
    message Wm_SysCommand;

    procedure WMMoving(var msg: TWMMoving);
    message WM_MOVING;

  public

  end;

    THuman = class

    FirstName: String;
    LastName:  String;
    MiddleName: String;
    NickName: String;
    EMAIL: String;
    Blanket: String;

    HomeStreet: String;
    City: String;
    Country: String;
    PostIndex: String;
    Region: String;
    WebAddress: String;
    HomePhone: String;
    HomeFax: String;
    Mobile: String;
    WorkStreet: String;
    WorkCity: String;
    WorkCountry: String;
    WorkIndex: String;
    WorkRegion: String;
    WorkOrganization: String;
    WorkProfessonal: String;
    WorkPlace: String;
    WorkRoom: String;
    WorkPhone: String;
    WorkFax: String;
    WorkPMessanger: String;

    Age:       Integer;
    UserHeight : String;
    UserColorEye : String;
    UserColorHair : String;
    Nationality : String;

    UserSex: Integer;
    UserBirth: TDate;
    UserYear: TDate;
    Bride: String;
    Children: Integer;

    UserComment : String;

    constructor Create(AName: String);

  end;

var
  MainForm: TMainForm;
  msgCaption: PChar;

implementation

uses UP, AP, LP, SP, ATP, SPP, PRP, INP, SBP, TP;

 type
   POpenFilenameA = ^TOpenFilenameA;
   POpenFilename = POpenFilenameA;
   tagOFNA = packed record
   lStructSize: DWORD;
   hWndOwner: HWND;
   hInstance: HINST;
   lpstrFilter: PAnsiChar;
   lpstrCustomFilter: PAnsiChar;
   nMaxCustFilter: DWORD;
   nFilterIndex: DWORD;
   lpstrFile: PAnsiChar;
   nMaxFile: DWORD;
   lpstrFileTitle: PAnsiChar;
   nMaxFileTitle: DWORD;
   lpstrInitialDir: PAnsiChar;
   lpstrTitle: PAnsiChar;
   Flags: DWORD;
   nFileOffset: Word;
   nFileExtension: Word;
   lpstrDefExt: PAnsiChar;
   lCustData: LPARAM;
   lpfnHook: function(Wnd: HWND; Msg: UINT; wParam: WPARAM; lParam: LPARAM): UINT stdcall;
   lpTemplateName: PAnsiChar;
   end;
   TOpenFilenameA = tagOFNA;
   TOpenFilename = TOpenFilenameA;

   function GetOpenFileName(var OpenFile: TOpenFilename): Bool; stdcall; external 'comdlg32.dll'
   name 'GetOpenFileNameA';
   function GetSaveFileName(var OpenFile: TOpenFilename): Bool; stdcall; external 'comdlg32.dll'
   name 'GetSaveFileNameA';

  const
   OFN_DONTADDTORECENT = $02000000;
   OFN_FILEMUSTEXIST = $00001000;
   OFN_HIDEREADONLY = $00000004;
   OFN_PATHMUSTEXIST = $00000800;

 function CharReplace(const Source: string; oldChar, newChar: Char): string;
 var
 i: Integer;
 begin
 Result := Source;
 for i := 1 to Length(Result) do
 if Result[i] = oldChar then
 Result[i] := newChar;
 end;

{$R *.dfm}

const
Rect: TRect = (Left: 100; Top: 100; Right: 100; Bottom: 100);
FullScreen: Boolean = False;

constructor THuman.Create(AName: String);
begin
inherited Create;
FirstName := AName;
end;

procedure SaveTableFont(FName: string; Section: string; smFont: TFont);
var
FStream: TIniFile;
begin 
FStream := TIniFile.Create(FName);
try
FStream.WriteString(Section, 'Name', smFont.Name);
FStream.WriteInteger(Section, 'CharSet', smFont.CharSet);
FStream.WriteInteger(Section, 'Color', smFont.Color);
FStream.WriteInteger(Section, 'Size', smFont.Size);
FStream.WriteInteger(Section, 'Style', Byte(smFont.Style));
finally
FStream.Free;
end;
end; 

procedure LoadTableFont(FName: string; Section: string; smFont: TFont);
var 
FStream: TIniFile;
begin 
FStream := TIniFile.Create(Fname);
try
smFont.Name    := FStream.ReadString(Section, 'Name', smFont.Name);
smFont.CharSet := TFontCharSet(FStream.ReadInteger(Section, 'CharSet', smFont.CharSet));
smFont.Color   := TColor(FStream.ReadInteger(Section, 'Color', smFont.Color));
smFont.Size    := FStream.ReadInteger(Section, 'Size', smFont.Size);
smFont.Style   := TFontStyles(Byte(FStream.ReadInteger(Section, 'Style', Byte(smFont.Style))));
finally
FStream.Free;
end;
end;

procedure OpenURL(Url: string);
var
ts: string;
begin
with TRegistry.Create do
try
rootkey := HKEY_CLASSES_ROOT;
OpenKey('\htmlfile\shell\open\command', False);
try
ts := ReadString('');
except
ts := '';
end;
CloseKey;
finally
Free;
end;
if ts = '' then Exit;
ts := Copy(ts, Pos('"', ts) + 1, Length(ts));
ts := Copy(ts, 1, Pos('"', ts) - 1);
ShellExecute(0, 'open', PChar(ts), PChar(url), nil, SW_SHOW);
end;

function OpenSaveFileDialog(ParentHandle: THandle; const DefExt, Filter, InitialDir, Title: string; var FileName: string; IsOpenDialog: Boolean): Boolean;
var
ofn: TOpenFileName;
szFile: array[0..MAX_PATH] of Char;
begin
Result := False;
FillChar(ofn, SizeOf(TOpenFileName), 0);
with ofn do
begin
lStructSize := SizeOf(TOpenFileName);
hwndOwner := ParentHandle;
lpstrFile := szFile;
nMaxFile := SizeOf(szFile);
if (Title <> '') then
lpstrTitle := PChar(Title);
if (InitialDir <> '') then
lpstrInitialDir := PChar(InitialDir);
StrPCopy(lpstrFile, FileName);
lpstrFilter := PChar(CharReplace(Filter, '|', #0)+#0#0);
if DefExt <> '' then
lpstrDefExt := PChar(DefExt);
end;
if IsOpenDialog then
begin
if GetOpenFileName(ofn) then
begin
Result := True;
FileName := StrPas(szFile);
end;
end else
begin
if GetSaveFileName(ofn) then
begin
Result := True;
FileName := StrPas(szFile);
end;
end
end;

procedure PrintStrings(Strings: TStrings);
var
Prn: TextFile;
i: word;
begin
AssignPrn(Prn);
try
Rewrite(Prn);
try
for i := 0 to Strings.Count - 1 do
writeln(Prn, Strings.Strings[i]);
finally
CloseFile(Prn);
end;
except
on EInOutError do
MessageDlg('Error Printing text.', mtError, [mbOk], 0);
end;
end;

function GetFileSizeByName(FileName: String): Integer;
var
FindData: TWin32FindData;
hFind: THandle;
begin
Result := -1;
hFind := FindFirstFile(PChar(FileName), FindData);
if hFind <> INVALID_HANDLE_VALUE then
begin
Windows.FindClose(hFind);
if (FindData.dwFileAttributes and FILE_ATTRIBUTE_DIRECTORY) = 0 then
Result := FindData.nFileSizeLow;
end;
end;

function MyExitWindows(RebootParam: Longword): Boolean;
var
TTokenHd: THandle;
TTokenPvg: TTokenPrivileges;
cbtpPrevious: DWORD;
rTTokenPvg: TTokenPrivileges;
pcbtpPreviousRequired: DWORD;
tpResult: Boolean;
const
SE_SHUTDOWN_NAME = 'SeShutdownPrivilege';
begin
if Win32Platform = VER_PLATFORM_WIN32_NT then
begin
tpResult := OpenProcessToken(GetCurrentProcess(),
TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY,
TTokenHd);
if tpResult then
begin
tpResult := LookupPrivilegeValue(nil,
SE_SHUTDOWN_NAME,
TTokenPvg.Privileges[0].Luid);
TTokenPvg.PrivilegeCount := 1;
TTokenPvg.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
cbtpPrevious := SizeOf(rTTokenPvg);
pcbtpPreviousRequired := 0;
if tpResult then
Windows.AdjustTokenPrivileges(TTokenHd, False,
TTokenPvg, cbtpPrevious, rTTokenPvg, pcbtpPreviousRequired);
end;
end;
Result := ExitWindowsEx(RebootParam, 0);
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
F: TextFile;
i: Integer;
begin
Screen.HintFont.Size := 9;
Application.HintColor := $00FFE7CE;
Application.HintPause := 0;
ForbidMultiple := CreateMutex(nil, true , 'Адресная книга');
if GetLastError = ERROR_ALREADY_EXISTS then
begin
Halt;
end;
Ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
try
Top := Ini.ReadInteger('Position', 'Top', 100);
Left := Ini.ReadInteger('Position', 'Left', 100);
ClientHeight := Ini.ReadInteger('Position', 'Client Height', 400);
ClientWidth := Ini.ReadInteger('Position', 'Client Width', 600);
ToolBarItem.Checked := Ini.ReadBool('Parameters', 'Tool bar', ToolBarItem.Checked);
StatusBarItem.Checked := Ini.ReadBool('Parameters', 'Status bar', StatusBarItem.Checked);
SearchBarItem.Checked := Ini.ReadBool('Parameters', 'Search bar', SearchBarItem.Checked);
OnTopItem.Checked := Ini.ReadBool('Parameters', 'Always on top', OnTopItem.Checked);
except
end;

with Icon do
begin
Wnd := Handle;
SzTip := 'Адресная книга v 1.1';
HIcon := Application.Icon.Handle;
UCallBackMessage := Tray;
UFlags := Nif_Tip + Nif_Message or Nif_Icon;
Shell_NotifyIcon(Nim_Add, @Icon);
end;

SM := GetSystemMenu(Handle, False);
InsertMenu(SM, Word(-1), Mf_Separator, Cherta, '');
InsertMenu(SM, Word(-2), Mf_ByPosition, FullScr, 'Полный экран');
InsertMenu(SM, Word(-3), Mf_ByPosition, OnTopFrm, 'Всегда впереди');
InsertMenu(SM, Word(-4), Mf_Separator, Cherta2, '');
InsertMenu(SM, Word(-5), Mf_ByPosition, About, 'О программе...');

Application.OnMinimize := MinimizeApplication;
Application.OnHint := ShowHint;

try
with  RecordsList.Items do
begin
LoadFromFile(ParamStr(0) + '.abd');
AssignFile(F, Copy(ParamStr(0) + '.abd',1,Length('AddressBook.abd')-4)+'.lso');
Reset(F);
i := 0;
while Not EOF(F) do
begin
Objects[i] := THuman.Create('');

Readln(F, (Objects[i] as THuman).FirstName);
Readln(F, (Objects[i] as THuman).LastName);
Readln(F, (Objects[i] as THuman).MiddleName);
Readln(F, (Objects[i] as THuman).NickName);
Readln(F, (Objects[i] as THuman).EMAIL);
Readln(F, (Objects[i] as THuman).Blanket);

Readln(F, (Objects[i] as THuman).HomeStreet);
Readln(F, (Objects[i] as THuman).City);
Readln(F, (Objects[i] as THuman).Country);
Readln(F, (Objects[i] as THuman).PostIndex);
Readln(F, (Objects[i] as THuman).Region);
Readln(F, (Objects[i] as THuman).WebAddress);
Readln(F, (Objects[i] as THuman).HomePhone);
Readln(F, (Objects[i] as THuman).HomeFax);
Readln(F, (Objects[i] as THuman).Mobile);
Readln(F, (Objects[i] as THuman).WorkStreet);
Readln(F, (Objects[i] as THuman).WorkCity);
Readln(F, (Objects[i] as THuman).WorkCountry);
Readln(F, (Objects[i] as THuman).WorkIndex);
Readln(F, (Objects[i] as THuman).WorkRegion);
Readln(F, (Objects[i] as THuman).WorkOrganization);
Readln(F, (Objects[i] as THuman).WorkProfessonal);
Readln(F, (Objects[i] as THuman).WorkPlace);
Readln(F, (Objects[i] as THuman).WorkRoom);
Readln(F, (Objects[i] as THuman).WorkPhone);
Readln(F, (Objects[i] as THuman).WorkFax);
Readln(F, (Objects[i] as THuman).WorkPMessanger);

Readln(F, (Objects[i] as THuman).Age);
Readln(F, (Objects[i] as THuman).UserHeight);
Readln(F, (Objects[i] as THuman).UserColorEye);
Readln(F, (Objects[i] as THuman).UserColorHair);
Readln(F, (Objects[i] as THuman).Nationality);

Readln(F, (Objects[i] as THuman).UserSex);
Readln(F, (Objects[i] as THuman).UserBirth);
Readln(F, (Objects[i] as THuman).UserYear);
Readln(F, (Objects[i] as THuman).Bride);
Readln(F, (Objects[i] as THuman).Children);

Readln(F, (Objects[i] as THuman).UserComment);

Inc(i);
end;
CloseFile(F);
end;
except
end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
F: TextFile;
i: Integer;
begin
if FullScreenItem.Checked then
begin
FullScreenItem.Click;
end;
MainForm.WindowState := wsNormal;

if not SetForm.ch6.Checked then
begin
if SetForm.ch23.Checked then
begin
AnimateWindow(MainForm.Handle, 400, AW_SLIDE or AW_BLEND or AW_HIDE);
end;
end;

if not SetForm.ch6.Checked then
begin
if SetForm.ch21.Checked then
begin
RecordsList.Items.Clear;
end;
end;
if SetForm.ch1.Checked then
begin
Ini.WriteInteger('Position', 'Top', Top);
Ini.WriteInteger('Position', 'Left', Left);
Ini.WriteInteger('Position', 'Client Height', ClientHeight);
Ini.WriteInteger('Position', 'Client Width', ClientWidth);
end;
Ini.WriteBool('License on start', 'Show', TipForm.ch1.Checked);

if SetForm.ch6.Checked then
begin
Action := caNone;
Application.Minimize;
ShowWindow(MainForm.Handle, Sw_Hide);
ShowWindow(Application.Handle, Sw_Hide);
Shell_NotifyIcon(Nim_Add, @Icon);
end;

try
with RecordsList.Items do
begin
SaveToFile(ParamStr(0) + '.abd');
AssignFile(F, Copy(ParamStr(0) + '.abd',1,Length('AddressBook.abd')-4)+'.lso');
Rewrite(F);
for i := 0 to Count - 1 do
if Objects[i] <> Nil then
begin

Writeln(F, (Objects[i] as THuman).FirstName);
Writeln(F, (Objects[i] as THuman).LastName);
Writeln(F, (Objects[i] as THuman).MiddleName);
Writeln(F, (Objects[i] as THuman).NickName);
Writeln(F, (Objects[i] as THuman).EMAIL);
Writeln(F, (Objects[i] as THuman).Blanket);

Writeln(F, (Objects[i] as THuman).HomeStreet);
Writeln(F, (Objects[i] as THuman).City);
Writeln(F, (Objects[i] as THuman).Country);
Writeln(F, (Objects[i] as THuman).PostIndex);
Writeln(F, (Objects[i] as THuman).Region);
Writeln(F, (Objects[i] as THuman).WebAddress);
Writeln(F, (Objects[i] as THuman).HomePhone);
Writeln(F, (Objects[i] as THuman).HomeFax);
Writeln(F, (Objects[i] as THuman).Mobile);
Writeln(F, (Objects[i] as THuman).WorkStreet);
Writeln(F, (Objects[i] as THuman).WorkCity);
Writeln(F, (Objects[i] as THuman).WorkCountry);
Writeln(F, (Objects[i] as THuman).WorkIndex);
Writeln(F, (Objects[i] as THuman).WorkRegion);
Writeln(F, (Objects[i] as THuman).WorkOrganization);
Writeln(F, (Objects[i] as THuman).WorkProfessonal);
Writeln(F, (Objects[i] as THuman).WorkPlace);
Writeln(F, (Objects[i] as THuman).WorkRoom);
Writeln(F, (Objects[i] as THuman).WorkPhone);
Writeln(F, (Objects[i] as THuman).WorkFax);
Writeln(F, (Objects[i] as THuman).WorkPMessanger);

Writeln(F, (Objects[i] as THuman).Age);
Writeln(F, (Objects[i] as THuman).UserHeight);
Writeln(F, (Objects[i] as THuman).UserColorEye);
Writeln(F, (Objects[i] as THuman).UserColorHair);
Writeln(F, (Objects[i] as THuman).Nationality);

Writeln(F, (Objects[i] as THuman).UserSex);
Writeln(F, (Objects[i] as THuman).UserBirth);
Writeln(F, (Objects[i] as THuman).UserYear);
Writeln(F, (Objects[i] as THuman).Bride);
Writeln(F, (Objects[i] as THuman).Children);

Writeln(F, (Objects[i] as THuman).UserComment);

end;
CloseFile(F);
end;
except
end;

if not SetForm.ch6.Checked then
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
if SetForm.Ch19.Checked then
if SetForm.Ch20.Checked then
if Application.MessageBox('Вы уверены, что хотите выключить компьютер?',
'Предупреждение',
Mb_IconHand + Mb_YesNo) = idYes then
MyExitWindows(EWX_POWEROFF or EWX_FORCE);

if not SetForm.Ch20.Checked then
if SetForm.Ch19.Checked then
MyExitWindows(EWX_POWEROFF or EWX_FORCE);
end;
end;

procedure TMainForm.AppEventsIdle(Sender: TObject;
var Done: Boolean);
begin
try
if MainForm.Active = True then
begin
Ini.WriteBool('Parameters', 'Tool bar', ToolBarItem.Checked);
Ini.WriteBool('Parameters', 'Status bar', StatusBarItem.Checked);
Ini.WriteBool('Parameters', 'Search bar', SearchBarItem.Checked);
Ini.WriteBool('Parameters', 'Always on top', OnTopItem.Checked);
Ini.WriteInteger('Tip window', 'Tip position', TipForm.NextBt.Tag);
if Clipboard.AsText = '' then
ClearBufferItem.Enabled := False else
ClearBufferItem.Enabled := True;
if StatusForm.ch1.Checked then
begin
if RecordsList.Count = 0 then
begin
StatusBar.Panels[0].Text := 'Адресная книга не содержит контакты';
end else
begin
StatusBar.Panels[0].Text := 'Контакты: ' + IntToStr(RecordsList.Count);
end; end else
begin
StatusBar.Panels[0].Text := '';
end;
if StatusForm.ch2.Checked then
begin
StatusBar.Panels[1].Text := DateToStr(Now);
end else
begin
StatusBar.Panels[1].Text := '';
end;
if StatusForm.ch3.Checked then
begin
StatusBar.Panels[2].Text := FormatDateTime('hh:mm', Now);
end else
begin
StatusBar.Panels[2].Text := '';
end;
if StatusForm.ch4.Checked then
begin
StatusBar.Panels[3].Text := FormatDateTime('Сегодня dddd (ddd), d MMMM yyyy г.', StrToDate(DateToStr(Now)));
end else
begin
StatusBar.Panels[3].Text := '';
end;
if NoteForm.Visible = False then
begin
if RecordsList.ItemIndex = -1 then
begin
UserAddressItem.Enabled := False;
UserAddress2Item.Enabled := False;
UserMailItem.Enabled := False;
UserMail2Item.Enabled := False;
end else
begin
UserAddressItem.Enabled := True;
UserAddress2Item.Enabled := True;
UserMail2Item.Enabled := True;
end;
if Length(NoteForm.UserWebAddress.Text) = 0 then
begin
UserAddressItem.Enabled := False;
UserAddressItem.Caption := 'Web Адрес неопределен';
UserAddress2Item.Enabled := False;
UserAddress2Item.Caption := 'Web Адрес неопределен';
end else
begin
UserAddressItem.Enabled := True;
UserAddressItem.Caption := NoteForm.UserWebAddress.Text;
UserAddress2Item.Enabled := True;
UserAddress2Item.Caption := NoteForm.UserWebAddress.Text;
end;
if Length(NoteForm.UsersEMail.Text) = 0 then
begin
UserMailItem.Enabled := False;
UserMailItem.Caption := 'Почта';
UserMail2Item.Enabled := False;
UserMail2Item.Caption := 'Почта';
end else
begin
UserMailItem.Enabled := True;
UserMailItem.Caption := NoteForm.UsersEMail.Text;
UserMail2Item.Enabled := True;
UserMail2Item.Caption := NoteForm.UsersEMail.Text;
end;
with RecordsList, RecordsList.Items do
begin
if ItemIndex = -1 then
Exit else
if not Assigned(Objects[ItemIndex]) then
Objects[ItemIndex] := THuman.Create(Items[ItemIndex]);
with Objects[ItemIndex] as THuman do
begin
NoteForm.UserWebAddress.Text := WebAddress;
NoteForm.UsersEMail.Text := EMAIL;
end;
end;
end;
end;
except
end;
end;

procedure TMainForm.QuickFindPanelChange(Sender: TObject);
begin
RecordsList.Perform(LB_SELECTSTRING, -1, longint(Pchar(QuickFindPanel.Text)));
end;

procedure TMainForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
if SetForm.ch13.Checked then
begin
ReleaseCapture;
Perform(Wm_SysCommand, $f012, 0);
end;
end;

procedure TMainForm.SaveItemClick(Sender: TObject);
begin
if RecordsList.ItemIndex = -1 then
begin
ShowMessage('Не выбран элемент');
Exit;
end;
with RecordsList do
with Items.Objects[ItemIndex] as THuman do
begin

FirstName := NoteForm.FirstUserName.Text;
LastName := NoteForm.LastUserName.Text;
MiddleName := NoteForm.MiddleUserName.Text;
NickName := NoteForm.UserNickName.Text;
EMAIL := NoteForm.UsersEMail.Text;
Blanket := NoteForm.BlanketName.Text;

HomeStreet := NoteForm.StreetAddress.Text;
City := NoteForm.UserCity.Text;
Country := NoteForm.UserCountry.Text;
PostIndex := NoteForm.UserIndex.Text;
Region := NoteForm.UserRegion.Text;
WebAddress := NoteForm.UserWebAddress.Text;
HomePhone := NoteForm.UserPhone.Text;
HomeFax := NoteForm.UserFax.Text;
Mobile := NoteForm.UserMobile.Text;
WorkStreet := NoteForm.StreetAddress2.Text;
WorkCity := NoteForm.UserCity2.Text;
WorkCountry := NoteForm.UserCountry2.Text;
WorkIndex := NoteForm.UserIndex2.Text;
WorkRegion := NoteForm.UserRegion2.Text;
WorkOrganization := NoteForm.UserOrganization.Text;
WorkProfessonal := NoteForm.UserWorker.Text;
WorkPlace := NoteForm.UserPlace.Text;
WorkRoom := NoteForm.UserRoom.Text;
WorkPhone := NoteForm.UserPhone2.Text;
WorkFax := NoteForm.UserFax2.Text;
WorkPMessanger := NoteForm.UserMessanger.Text;

Age := NoteForm.UserAgeBox.Value;
UserHeight := NoteForm.UserHeight.Text;
UserColorEye := NoteForm.UserColorEye.Text;
UserColorHair := NoteForm.UserColorHair.Text;
Nationality := NoteForm.UserNationality.Text;

UserSex := NoteForm.SexBox.ItemIndex;
UserBirth := NoteForm.BirthBox.Date;
UserYear := NoteForm.YearBox.Date;
Bride := NoteForm.UserBride.Text;
Children := NoteForm.UserChildren.ItemIndex;

UserComment := NoteForm.UserCommentText.Text;

Items[ItemIndex] := FirstName + ' ' + MiddleName + ' ' + LastName + '     ' + Mobile + '     ' +
EMAIL + '     ' + WebAddress + '     ' + NickName;                   

end;
end;

procedure TMainForm.AboutItemClick(Sender: TObject);
begin
AboutForm.Position := poMainFormCenter;
AboutForm.ShowModal;
end;

procedure TMainForm.SourceCodeItemClick(Sender: TObject);
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
if Application.MessageBox(PChar(
'Copyright @2009 Домани Олег (aka ?КТО_Я?)' + #13 +
'============================================' + #13 + #13 + '' +
'Вы имеете право распространять и использовать программу' +
#13 + 'в любых целях при условии целостности оригинального' + #13 + 'дистрибутива.'
+ #13 + ''
+ #13 + 'Если Вы хотите получить исходный код проекта (архив'
+ #13 + 'с компонентами по желанию пользователя), а также все'
+ #13 + 'последующие новые версии программы, то отправьте'
+ #13 + 'электронное письмо автору.'
+ #13 + ''
+ #13 + 'После отправки электронного письма автору, лицензия на'
+ #13 + 'этот программный продукт будет иметь характер GPL'
+ #13 + '(General Public License - общая открытая лицензия).'
+ #13 + ''
+ #13 + 'Данная лицензия практически не имеет никаких ограничений.'
+ #13 + 'Это означает, что Вы можете использовать программное'
+ #13 + 'обеспечение для любых целей.'
+ #13 + #13 + 'Вы даже можете изменять его по своему усмотрению. Однако'
+ #13 + 'Вы не имеете право свободно распространять его в качестве'
+ #13 + 'патентованной программы.'
+ #13 + #13 + 'Это право остается только за автором открытого исходного'
+ #13 + 'кода.'
+ #13 + #13 + 'Любой человек, получивший это программное обеспечение'
+ #13 + 'от Вас имеет все права на исходный код и может изменять его'
+ #13 + 'или свободно распространять.' +
'' +  #13 + #13 + '============================================' +  #13 +
'' +  #13 +
'Отправить письмо сейчас?'),
'Адресная книга',
mb_IconAsterisk + mb_YesNo) = idYes then
begin
ShellExecute(Handle, 'open',
'mailto:GoodWinNix@mail.ru?Subject=Address Book Project' +
'&Body=Hello, please send me the source code program. Thanks!',
'', '', SW_SHOW);
end;
end;

procedure TMainForm.SendReportItemClick(Sender: TObject);
begin
ShellExecute(Handle, 'open',
'mailto:GoodWinNix@mail.ru?Subject=Address Book Project - [Error]' +
'&Body=Error',
'', '', SW_SHOW);
end;

procedure TMainForm.SendLetterItemClick(Sender: TObject);
begin
ShellExecute(Handle,'open',
'mailto:GoodWinNix@mail.ru?Subject=Address Book Project'+
'',
'','',SW_SHOW);
end;

procedure TMainForm.GNUItemClick(Sender: TObject);
begin
ShellExecute(Handle, nil, 'http://www.gnu.org/philosophy/', nil, nil, Sw_ShowNormal);
end;

procedure TMainForm.LicItemClick(Sender: TObject);
begin
LicForm.Position := poMainFormCenter;
LicForm.ShowModal;
end;

procedure TMainForm.SysInfoItemClick(Sender: TObject);
begin
ShellExecute(handle, nil, 'msInfo32', nil,nil, Sw_ShowNormal);
end;

procedure TMainForm.ImportItemClick(Sender: TObject);
var
s: String;
F: TextFile;
i: Integer;
begin
if OpenSaveFileDialog(MainForm.Handle, '*.abd', 'Файлы адресной книги (*.abd)|*.abd|',
ParamStr(1), 'Заменить текущую базу данных адресной книги на существующую из файла', s, True) then
begin
try
with RecordsList.Items do
begin
LoadFromFile(s);
AssignFile(F, Copy(s,1,Length(s)-4)+'.lso');
Reset(F);
i := 0;
while Not EOF(F) do
begin
Objects[i] := THuman.Create('');

Readln(F, (Objects[i] as THuman).FirstName);
Readln(F, (Objects[i] as THuman).LastName);
Readln(F, (Objects[i] as THuman).MiddleName);
Readln(F, (Objects[i] as THuman).NickName);
Readln(F, (Objects[i] as THuman).EMAIL);
Readln(F, (Objects[i] as THuman).Blanket);

Readln(F, (Objects[i] as THuman).HomeStreet);
Readln(F, (Objects[i] as THuman).City);
Readln(F, (Objects[i] as THuman).Country);
Readln(F, (Objects[i] as THuman).PostIndex);
Readln(F, (Objects[i] as THuman).Region);
Readln(F, (Objects[i] as THuman).WebAddress);
Readln(F, (Objects[i] as THuman).HomePhone);
Readln(F, (Objects[i] as THuman).HomeFax);
Readln(F, (Objects[i] as THuman).Mobile);
Readln(F, (Objects[i] as THuman).WorkStreet);
Readln(F, (Objects[i] as THuman).WorkCity);
Readln(F, (Objects[i] as THuman).WorkCountry);
Readln(F, (Objects[i] as THuman).WorkIndex);
Readln(F, (Objects[i] as THuman).WorkRegion);
Readln(F, (Objects[i] as THuman).WorkOrganization);
Readln(F, (Objects[i] as THuman).WorkProfessonal);
Readln(F, (Objects[i] as THuman).WorkPlace);
Readln(F, (Objects[i] as THuman).WorkRoom);
Readln(F, (Objects[i] as THuman).WorkPhone);
Readln(F, (Objects[i] as THuman).WorkFax);
Readln(F, (Objects[i] as THuman).WorkPMessanger);

Readln(F, (Objects[i] as THuman).Age);
Readln(F, (Objects[i] as THuman).UserHeight);
Readln(F, (Objects[i] as THuman).UserColorEye);
Readln(F, (Objects[i] as THuman).UserColorHair);
Readln(F, (Objects[i] as THuman).Nationality);

Readln(F, (Objects[i] as THuman).UserSex);
Readln(F, (Objects[i] as THuman).UserBirth);
Readln(F, (Objects[i] as THuman).UserYear);
Readln(F, (Objects[i] as THuman).Bride);
Readln(F, (Objects[i] as THuman).Children);

Readln(F, (Objects[i] as THuman).UserComment);

Inc(i);
end;
CloseFile(F);
end;
except
on E: EFOpenError do ShowMessage('Ошибка открытия файла');
end;
end;
end;

procedure TMainForm.ExportItemClick(Sender: TObject);
var
F: TextFile;
i: Integer;
s: String;
begin
try
if OpenSaveFileDialog(MainForm.Handle, '*.abd', 'Файлы адресной книги (*.abd)|*.abd|',
ParamStr(1), 'Экспорт', s, False) then
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
if FileExists(s) then
if Application.MessageBox(PChar('Файл "' + s +
'" уже существует.' +
#13 + 'Заменить его?'),
'Замена файла', MB_ICONQUESTION + mb_YesNo)
<> idYes then
begin

end else
begin
with  RecordsList.Items do
begin
SaveToFile(s);
AssignFile(F, Copy(s,1,Length(s)-4)+'.lso');
Rewrite(F);
for i := 0 to Count - 1 do
if Objects[i] <> Nil then
begin

Writeln(F, (Objects[i] as THuman).FirstName);
Writeln(F, (Objects[i] as THuman).LastName);
Writeln(F, (Objects[i] as THuman).MiddleName);
Writeln(F, (Objects[i] as THuman).NickName);
Writeln(F, (Objects[i] as THuman).EMAIL);
Writeln(F, (Objects[i] as THuman).Blanket);

Writeln(F, (Objects[i] as THuman).HomeStreet);
Writeln(F, (Objects[i] as THuman).City);
Writeln(F, (Objects[i] as THuman).Country);
Writeln(F, (Objects[i] as THuman).PostIndex);
Writeln(F, (Objects[i] as THuman).Region);
Writeln(F, (Objects[i] as THuman).WebAddress);
Writeln(F, (Objects[i] as THuman).HomePhone);
Writeln(F, (Objects[i] as THuman).HomeFax);
Writeln(F, (Objects[i] as THuman).Mobile);
Writeln(F, (Objects[i] as THuman).WorkStreet);
Writeln(F, (Objects[i] as THuman).WorkCity);
Writeln(F, (Objects[i] as THuman).WorkCountry);
Writeln(F, (Objects[i] as THuman).WorkIndex);
Writeln(F, (Objects[i] as THuman).WorkRegion);
Writeln(F, (Objects[i] as THuman).WorkOrganization);
Writeln(F, (Objects[i] as THuman).WorkProfessonal);
Writeln(F, (Objects[i] as THuman).WorkPlace);
Writeln(F, (Objects[i] as THuman).WorkRoom);
Writeln(F, (Objects[i] as THuman).WorkPhone);
Writeln(F, (Objects[i] as THuman).WorkFax);
Writeln(F, (Objects[i] as THuman).WorkPMessanger);

Writeln(F, (Objects[i] as THuman).Age);
Writeln(F, (Objects[i] as THuman).UserHeight);
Writeln(F, (Objects[i] as THuman).UserColorEye);
Writeln(F, (Objects[i] as THuman).UserColorHair);
Writeln(F, (Objects[i] as THuman).Nationality);

Writeln(F, (Objects[i] as THuman).UserSex);
Writeln(F, (Objects[i] as THuman).UserBirth);
Writeln(F, (Objects[i] as THuman).UserYear);
Writeln(F, (Objects[i] as THuman).Bride);
Writeln(F, (Objects[i] as THuman).Children);

Writeln(F, (Objects[i] as THuman).UserComment);

end;
CloseFile(F);
end;
end;
end;
if not FileExists(s) then
begin
with  RecordsList.Items do
begin
SaveToFile(s);
AssignFile(F, Copy(s,1,Length(s)-4)+'.lso');
Rewrite(F);
for i := 0 to Count - 1 do
if Objects[i] <> Nil then
begin

Writeln(F, (Objects[i] as THuman).FirstName);
Writeln(F, (Objects[i] as THuman).LastName);
Writeln(F, (Objects[i] as THuman).MiddleName);
Writeln(F, (Objects[i] as THuman).NickName);
Writeln(F, (Objects[i] as THuman).EMAIL);
Writeln(F, (Objects[i] as THuman).Blanket);

Writeln(F, (Objects[i] as THuman).HomeStreet);
Writeln(F, (Objects[i] as THuman).City);
Writeln(F, (Objects[i] as THuman).Country);
Writeln(F, (Objects[i] as THuman).PostIndex);
Writeln(F, (Objects[i] as THuman).Region);
Writeln(F, (Objects[i] as THuman).WebAddress);
Writeln(F, (Objects[i] as THuman).HomePhone);
Writeln(F, (Objects[i] as THuman).HomeFax);
Writeln(F, (Objects[i] as THuman).Mobile);
Writeln(F, (Objects[i] as THuman).WorkStreet);
Writeln(F, (Objects[i] as THuman).WorkCity);
Writeln(F, (Objects[i] as THuman).WorkCountry);
Writeln(F, (Objects[i] as THuman).WorkIndex);
Writeln(F, (Objects[i] as THuman).WorkRegion);
Writeln(F, (Objects[i] as THuman).WorkOrganization);
Writeln(F, (Objects[i] as THuman).WorkProfessonal);
Writeln(F, (Objects[i] as THuman).WorkPlace);
Writeln(F, (Objects[i] as THuman).WorkRoom);
Writeln(F, (Objects[i] as THuman).WorkPhone);
Writeln(F, (Objects[i] as THuman).WorkFax);
Writeln(F, (Objects[i] as THuman).WorkPMessanger);

Writeln(F, (Objects[i] as THuman).Age);
Writeln(F, (Objects[i] as THuman).UserHeight);
Writeln(F, (Objects[i] as THuman).UserColorEye);
Writeln(F, (Objects[i] as THuman).UserColorHair);
Writeln(F, (Objects[i] as THuman).Nationality);

Writeln(F, (Objects[i] as THuman).UserSex);
Writeln(F, (Objects[i] as THuman).UserBirth);
Writeln(F, (Objects[i] as THuman).UserYear);
Writeln(F, (Objects[i] as THuman).Bride);
Writeln(F, (Objects[i] as THuman).Children);

Writeln(F, (Objects[i] as THuman).UserComment);

end;
CloseFile(F);
end;
end;
except
end;
end;

procedure TMainForm.AttributesItemClick(Sender: TObject);
var
Attributes, NewAttributes: Word;
begin
AttrForm.Position := poMainFormCenter;
AttrForm.Caption := 'Свойства ' + ' - ' + ExtractFileName(ParamStr(0));
with AttrForm do
begin
TypeEd.Text := 'Тип объекта: ' + ExtractFileExt(ParamStr(0));
PathNameEd.Text := ParamStr(0);
PathEd.Text := ExtractFileName(ParamStr(0));
DirParh.Text := ExtractFilePath(ParamStr(0));
SizeEd.Text := 'Размер: ' + IntToStr(GetFileSizeByName(ParamStr(0))) + ' байт';
Attributes := FileGetAttr(PathNameEd.Text);
ChReadOnly.Checked := (Attributes and faReadOnly) = faReadOnly;
ChArchive.Checked := (Attributes and faArchive) = faArchive;
ChSystem.Checked := (Attributes and faSysFile) = faSysFile;
ChHidden.Checked := (Attributes and faHidden) = faHidden;
if ShowModal <> mrCancel then
begin
NewAttributes := Attributes;
if ChReadOnly.Checked then NewAttributes := NewAttributes or faReadOnly
else NewAttributes := NewAttributes and not faReadOnly;
if ChArchive.Checked then NewAttributes := NewAttributes or faArchive
else NewAttributes := NewAttributes and not faArchive;
if ChSystem.Checked then NewAttributes := NewAttributes or faSysFile
else NewAttributes := NewAttributes and not faSysFile;
if ChHidden.Checked then NewAttributes := NewAttributes or faHidden
else NewAttributes := NewAttributes and not faHidden;
if NewAttributes <> Attributes then
FileSetAttr(PathNameEd.Text, NewAttributes);
end;
end;
end;

procedure TMainForm.ExitItemClick(Sender: TObject);
begin
Close;
end;

procedure TMainForm.CreateItemClick(Sender: TObject);
begin
if SetForm.ch27.Checked then
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
if Application.MessageBox('Добавить новый контакт в таблицу адресной книги?',
'Адресная книга',
mb_IconQuestion + mb_YesNo) = idYes then
RecordsList.Items.AddObject('Новый контакт', THuman.Create(''));
end else
begin
RecordsList.Items.AddObject('Новый контакт', THuman.Create(''));
end;
end;

procedure TMainForm.EditItemClick(Sender: TObject);
begin
try
PostMessage(Handle, WM_USER + 1024, 0, 0);
if RecordsList.ItemIndex = -1 then
Application.MessageBox('Выберите запись.',
'Адресная книга',
mb_IconAsterisk + mb_OK) else begin
with RecordsList, RecordsList.Items do
begin
if ItemIndex = -1 then Exit;
if not Assigned(Objects[ItemIndex]) then
Objects[ItemIndex] := THuman.Create(Items[ItemIndex]);
with Objects[ItemIndex] as THuman do
begin

NoteForm.Caption := Blanket + ' - Свойства';

NoteForm.FirstUserName.Text := FirstName;
NoteForm.LastUserName.Text := LastName;
NoteForm.MiddleUserName.Text := MiddleName;
NoteForm.UserNickName.Text := NickName;
NoteForm.UsersEMail.Text := EMAIL;
NoteForm.BlanketName.Text := Blanket;

NoteForm.StreetAddress.Text := HomeStreet;
NoteForm.UserCity.Text := City;
NoteForm.UserCountry.Text := Country;
NoteForm.UserIndex.Text := PostIndex;
NoteForm.UserRegion.Text := Region;
NoteForm.UserWebAddress.Text := WebAddress;
NoteForm.UserPhone.Text := HomePhone;
NoteForm.UserFax.Text := HomeFax;
NoteForm.UserMobile.Text := Mobile;
NoteForm.StreetAddress2.Text := WorkStreet;
NoteForm.UserCity2.Text := WorkCity;
NoteForm.UserCountry2.Text := WorkCountry;
NoteForm.UserIndex2.Text := WorkIndex;
NoteForm.UserRegion2.Text := WorkRegion;
NoteForm.UserOrganization.Text := WorkOrganization;
NoteForm.UserWorker.Text := WorkProfessonal;
NoteForm.UserPlace.Text := WorkPlace;
NoteForm.UserRoom.Text := WorkRoom;
NoteForm.UserPhone2.Text := WorkPhone;
NoteForm.UserFax2.Text := WorkFax;
NoteForm.UserMessanger.Text := WorkPMessanger;

NoteForm.UserAgeBox.Value := Age;
NoteForm.UserHeight.Text := UserHeight;
NoteForm.UserColorEye.Text := UserColorEye;
NoteForm.UserColorHair.Text := UserColorHair;
NoteForm.UserNationality.Text := Nationality;

NoteForm.SexBox.ItemIndex := UserSex;
NoteForm.BirthBox.Date := UserBirth;
NoteForm.YearBox.Date := UserYear;
NoteForm.UserBride.Text := Bride;
NoteForm.UserChildren.ItemIndex := Children;

NoteForm.UserCommentText.Text := UserComment;

NoteForm.Position := poMainFormCenter;
NoteForm.ShowModal;

end;
end;
end;
except
end;
end;

procedure TMainForm.DeleteItemClick(Sender: TObject);
begin
try
PostMessage(Handle, WM_USER + 1024, 0, 0);
if RecordsList.ItemIndex = -1 then
Application.MessageBox('Выберите запись.',
'Адресная книга',
mb_IconAsterisk + mb_OK) else begin
with RecordsList, RecordsList.Items do begin
if ItemIndex = -1 then Exit;
if not Assigned(Objects[ItemIndex]) then
Objects[ItemIndex] := THuman.Create(Items[ItemIndex]);
with Objects[ItemIndex] as THuman do begin
if SetForm.ch22.Checked then begin
if Application.MessageBox(PChar('Запись "' + Blanket + '" будет удалена.'
+ #13 + 'Продолжить?'),
'Адресная книга',
mb_IconQuestion + mb_OkCancel)= idOK then begin
with RecordsList do Items.Delete(ItemIndex);
NoteForm.UserWebAddress.Text := '';
NoteForm.UsersEMail.Text := '';
end;
end else begin
with RecordsList do Items.Delete(ItemIndex);
NoteForm.UserWebAddress.Text := '';
NoteForm.UsersEMail.Text := '';
end;
end;
end;
end;
except
end;
end;

procedure TMainForm.ClearAllItemClick(Sender: TObject);
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
if RecordsList.Items.Count = 0 then
Exit else
if Application.MessageBox(
'Удалить все записи из адресной книги?',
'Адресная книга',
mb_IconQuestion + mb_YesNo) = idYes then
begin
RecordsList.Items.Clear;
NoteForm.UserWebAddress.Text := '';
NoteForm.UsersEMail.Text := '';
end;
end;

procedure TMainForm.UserAddressItemClick(Sender: TObject);
begin
NoteForm.GoToSiteClick(Self);
end;

procedure TMainForm.FullScreenItemClick(Sender: TObject);
begin
MainForm.ScreenSnap := False;
FullScreen := not FullScreen;
if FullScreen then begin
FullScreenItem.Checked := True;
if SetForm.ch16.Checked then
ToolBar.Visible := False;
if SetForm.ch17.Checked then
StatusBar.Visible := False;
if SetForm.ch18.Checked then
QuickFindPanel.Visible := False;
Rect := BoundsRect;
SetBounds(Left - ClientOrigin.X,
Top - ClientOrigin.Y, GetDeviceCaps(Canvas.handle,
HORZRES )
+ (Width - ClientWidth), GetDeviceCaps(Canvas.handle,
VERTRES )
+ (Height - ClientHeight));
end else
begin
FullScreenItem.Checked := False;
if ToolBarItem.Checked = True then
ToolBar.Visible := True else
ToolBar.Visible := False;
if StatusBarItem.Checked = True then
StatusBar.Visible := True else
StatusBar.Visible := False;
if SearchBarItem.Checked = True then
QuickFindPanel.Visible := True else
QuickFindPanel.Visible := False;
BoundsRect := Rect;
MainForm.ScreenSnap := True;
end;
if (GetMenuState(SM, FullScr, MF_BYCOMMAND) and MF_CHECKED) <> 0
then begin
CheckMenuItem(SM, FullScr, MF_BYCOMMAND+MF_UNCHECKED);
end
else begin
CheckMenuItem(SM, FullScr, MF_BYCOMMAND+MF_CHECKED);
end;
end;

procedure TMainForm.WMGetMinMaxInfo(var msg: TWMGetMinMaxInfo);
begin
inherited;
with msg.MinMaxInfo^.ptMaxTrackSize do begin
X := GetDeviceCaps(Canvas.handle, HORZRES) +
(Width - ClientWidth);
Y := GetDeviceCaps(Canvas.handle, VERTRES) +
(Height - ClientHeight);
end;
end;

procedure TMainForm.OnTopItemClick(Sender: TObject);
begin
if OnTopItem.Checked = False
then begin
SetWindowPos(Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOMOVE+SWP_NOSIZE);
end else begin
SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE+SWP_NOSIZE);
OnTopItem.Checked := true;
end;
if (GetMenuState(SM, OnTopFrm, MF_BYCOMMAND) and MF_CHECKED) <> 0
then begin
CheckMenuItem(SM, OnTopFrm, MF_BYCOMMAND+MF_UNCHECKED);
end
else begin
CheckMenuItem(SM, OnTopFrm, MF_BYCOMMAND+MF_CHECKED);
end;
end;

procedure TMainForm.StatusBarItemClick(Sender: TObject);
begin
if StatusBarItem.Checked then
StatusBar.Visible := True else
StatusBar.Visible := False;
end;

procedure TMainForm.PreferencesItemClick(Sender: TObject);
begin
SetForm.SettingsPages.ActivePageIndex := 0;
SetForm.Position := poMainFormCenter;
SetForm.ShowModal;
end;

procedure TMainForm.FormKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
if not FullScreenItem.Checked then
begin
if Key = vk_Escape then
Close;
end;
if FullScreenItem.Checked then
begin
if Key = vk_Escape then
FullScreenItem.Click;
end;
end;

procedure TMainForm.ShowHint(Sender: TObject);
begin
if PrintForm.Visible = true then
begin
if SetForm.ch4.Checked then
begin
if Length(Application.Hint) > 0 then
begin
PrintForm.StatusBar.SimplePanel := True;
PrintForm.StatusBar.SimpleText := Application.Hint;
end else
begin
PrintForm.StatusBar.SimplePanel := False;
end;
end;
end;
if PrintForm.Visible = False then
begin
if SetForm.ch4.Checked then
begin
if Length(Application.Hint) > 0 then
begin
StatusBar.SimplePanel := True;
StatusBar.SimpleText := Application.Hint;
end else
begin
StatusBar.SimplePanel := False;
end;
end;
end; 
end;

procedure TMainForm.RecordsListMouseDown(Sender: TObject;
Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if SetForm.ch3.Checked then
begin
if Button = mbRight then
with (Sender as TControl).ClientToScreen(Point(X, Y)) do
RecordsListMenu.Popup(X, Y);
end else
begin
Exit;
end;
end;

procedure TMainForm.ChangeMessageBoxPosition(var Msg: TMessage);
var
MbHwnd: longword;
MbRect: TRect;
x, y, w, h: integer;
begin
MbHwnd := FindWindow(MAKEINTRESOURCE(WC_DIALOG), msgCaption);
if (MbHwnd <> 0) then
begin
GetWindowRect(MBHWnd, MBRect);
with MbRect do
begin
w := Right - Left;
h := Bottom - Top;
end;
x := MainForm.Left + ((MainForm.Width - w) div 2);
if x < 0 then
x := 0
else if x + w > Screen.Width then x := Screen.Width - w;
y := MainForm.Top + ((MainForm.Height - h) div 2);
if y < 0 then y := 0
else if y + h > Screen.Height then y := Screen.Height - h;
SetWindowPos(MBHWnd, 0, x, y, 0, 0, SWP_NOACTIVATE or SWP_NOSIZE or SWP_NOZORDER);
end;
end;

procedure TMainForm.MinimizeApplication(Sender: TObject);
begin
if SetForm.ch5.Checked then
begin
ShowWindow(Application.Handle, Sw_Hide);
Shell_NotifyIcon(Nim_Add, @Icon);
end;
end;

procedure TMainForm.MySystemMenu(var MySysMenu: TWmSysCommand);
begin
case MySysMenu.CmdType of
OnTopFrm:
if (GetMenuState(SM, OnTopFrm, MF_BYCOMMAND) and MF_CHECKED) <> 0
then begin
OnTopItem.Checked := False;
SetWindowPos(Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOMOVE+SWP_NOSIZE);
CheckMenuItem(SM, OnTopFrm, MF_BYCOMMAND+MF_UNCHECKED);
end
else begin
OnTopItem.Checked := True;
SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE+SWP_NOSIZE);
CheckMenuItem(SM, OnTopFrm, MF_BYCOMMAND+MF_CHECKED);
end;
end;

case MySysMenu.CmdType of
FullScr:
if (GetMenuState(SM, FullScr, MF_BYCOMMAND) and MF_CHECKED) <> 0
then begin
FullScreenItem.Checked := False;
FullScreenItem.Click;
CheckMenuItem(SM, FullScr, MF_BYCOMMAND+MF_UNCHECKED);
end
else begin
FullScreenItem.Checked := True;
FullScreenItem.Click;
CheckMenuItem(SM, FullScr, MF_BYCOMMAND+MF_CHECKED);
end;
end;
if MySysMenu.CmdType = About then
begin
AboutForm.Position := poMainFormCenter;
AboutForm.ShowModal;
end;
inherited;
end;

procedure TMainForm.SystemTrayMenu(var Oleg: TMessage);
var
Ico: TPoint;
begin
case Oleg.LParam of
Wm_LButtonDblClk:
begin
ShowWindow(Application.Handle, Sw_Show);
Application.Restore;
ShowWindow(Handle, Sw_Show);
end;
Wm_RButtonDown:
begin
SetForegroundWindow(0);
GetCursorPos(Ico);
TrayMenu.Popup(Ico.X, Ico.Y);
end;
end;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
SaveTableFont('font.ini', 'Text Font', RecordsList.Font);
Shell_NotifyIcon(Nim_Delete, @Icon);
SM := GetSystemMenu(Handle, True);
MainForm.OnActivate := nil;
DropToolBar2Menu.Free;
DropToolBarMenu.Free;
RecordsListMenu.Free;
ToolBarImages.Free;
StatusBarMenu.Free;
RecordsList.Free;
StatusBar.Free;
AppEvents.Free;
TrayMenu.Free;
CoolBar.Free;
Ini.Free;
T1.Free;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
LoadTableFont('font.ini', 'Text Font', RecordsList.Font);
if RecordsList.Font.Style = [fsUnderline] then
StyleForm.ch1.Checked := True;
if RecordsList.Font.Style = [fsStrikeOut] then
StyleForm.ch2.Checked := True;
if RecordsList.Font.Style = [fsBold] then
StyleForm.ch3.Checked := True;
if RecordsList.Font.Style = [fsItalic] then
StyleForm.ch4.Checked := True;
if RecordsList.Font.Style = [] then
StyleForm.ch5.Checked := True;
RecordsList.Font.Color := SetForm.ColorPickDlg1.ActiveColor;
RecordsList.Color := SetForm.ColorPickDlg2.ActiveColor;
RecordsList.Font.Name := SetForm.FontsNameCombo.Text;
RecordsList.Font.Size := SetForm.FontsSizeEdit.Value;
if SetForm.ch7.Checked then
begin
RyMenu.Add(MainMenu, nil);
RyMenu.Add(TrayMenu, nil);
RyMenu.Add(StatusBarMenu, nil);
RyMenu.Add(DropToolBarMenu, nil);
RyMenu.Add(DropToolBar2Menu, nil);
RyMenu.Add(PrintForm.MainMenu, nil);
RyMenu.Add(PrintForm.PrintTextMenu, nil);
RyMenu.Add(RecordsListMenu, nil);
end;
if ToolBarItem.Checked then
ToolBar.Visible := True else
ToolBar.Visible := False;
if StatusBarItem.Checked then
StatusBar.Visible := True else
StatusBar.Visible := False;
if SearchBarItem.Checked then
QuickFindPanel.Visible := True else
QuickFindPanel.Visible := False;
if OnTopItem.Checked = False
then begin
SetWindowPos(Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOMOVE+SWP_NOSIZE);
end else begin
SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE+SWP_NOSIZE);
OnTopItem.Checked := true;
end;
if OnTopItem.Checked = True
then begin
if (GetMenuState(SM, OnTopFrm, MF_BYCOMMAND) and MF_CHECKED) <> 0
then begin
CheckMenuItem(SM, OnTopFrm, MF_BYCOMMAND+MF_UNCHECKED);
end
else begin
CheckMenuItem(SM, OnTopFrm, MF_BYCOMMAND+MF_CHECKED);
end;
end;
if SetForm.ch9.Checked then
begin
R := TRegistry.Create;
R.RootKey := HKEY_LOCAL_MACHINE;
R.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run', false);
if SetForm.ch2.Checked then
R.WriteString(Application.Title, ParamStr(0)) else
R.DeleteValue(Application.Title);
R.Free;
end;
if SetForm.ch14.Checked then
begin
MainForm.ScreenSnap := True;
AboutForm.ScreenSnap := True;
AttrForm.ScreenSnap := True;
LicForm.ScreenSnap := True;
NoteForm.ScreenSnap := True;
SetForm.ScreenSnap := True;
StyleForm.ScreenSnap := True;
PrintForm.ScreenSnap := True;
TipForm.ScreenSnap := True;
end else
begin
MainForm.ScreenSnap := False;
AboutForm.ScreenSnap := False;
AttrForm.ScreenSnap := False;
LicForm.ScreenSnap := False;
NoteForm.ScreenSnap := False;
SetForm.ScreenSnap := False;
StyleForm.ScreenSnap := False;
PrintForm.ScreenSnap := False;
TipForm.ScreenSnap := False;
end;
if SetForm.ch26.Checked then
begin
RecordsList.DragMode := dmAutomatic;
end else
begin
RecordsList.DragMode := dmManual;
end;
if MainForm.FullScreenItem.Checked = False then
begin
if SetForm.ch10.Checked then
begin
FullScreenItem.Click;
if (GetMenuState(SM, FullScr, MF_BYCOMMAND) and MF_CHECKED) <> 0
then begin
CheckMenuItem(SM, FullScr, MF_BYCOMMAND+MF_UNCHECKED);
end
else begin
CheckMenuItem(SM, FullScr, MF_BYCOMMAND+MF_CHECKED);
end;
end;
end;
if FullScreenItem.Checked = True then
begin
if (GetMenuState(SM, FullScr, MF_BYCOMMAND) and MF_CHECKED) <> 0 then
begin
CheckMenuItem(SM, FullScr, MF_BYCOMMAND+MF_UNCHECKED);
end else
begin
CheckMenuItem(SM, FullScr, MF_BYCOMMAND+MF_CHECKED);
end;
end;
if SetForm.ch23.Checked then
begin
AnimateWindow(Mainform.Handle, 500, AW_CENTER or AW_SLIDE or AW_ACTIVATE);
end;
T1.Enabled := True;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if SetForm.ch6.Checked then
begin
Exit;
end else
begin
if SetForm.Ch8.Checked then
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
CanClose :=
Application.MessageBox('Вы уверены, что хотите выйти?',
'Адресная книга',
mb_IconQuestion + mb_YesNo) = mrYes;
end;
end;
end;

procedure TMainForm.RestoreItemClick(Sender: TObject);
begin 
ShowWindow(Application.Handle, Sw_Show);
Application.Restore;
ShowWindow(Handle, Sw_Show);
end;

procedure TMainForm.WMMoving(var msg: TWMMoving);
var
r: TRect;
begin
if SetForm.Ch15.Checked then
begin
r := Screen.WorkareaRect;
if msg.lprect^.left < r.left then
OffsetRect(msg.lprect^, r.left - msg.lprect^.left, 0);
if msg.lprect^.top < r.top then
OffsetRect(msg.lprect^, 0, r.top - msg.lprect^.top);
if msg.lprect^.right > r.right then
OffsetRect(msg.lprect^, r.right - msg.lprect^.right, 0);
if msg.lprect^.bottom > r.bottom then
OffsetRect(msg.lprect^, 0, r.bottom - msg.lprect^.bottom);
end;
inherited;
end;

procedure TMainForm.ToolBarItemClick(Sender: TObject);
begin
if ToolBarItem.Checked then
ToolBar.Visible := True else
ToolBar.Visible := False;
end;

procedure TMainForm.MinimizedItemClick(Sender: TObject);
begin
Application.Minimize;
end;

procedure TMainForm.PrintTableItemClick(Sender: TObject);
begin
try
if RecordsList.Items.Count = 0 then
Exit else
PrintStrings(RecordsList.Items);
except
end;
end;

procedure TMainForm.PrintDatesItemClick(Sender: TObject);
begin
try
PostMessage(Handle, WM_USER + 1024, 0, 0);
PrintForm.PrintDates.Lines.Clear;
if RecordsList.ItemIndex = -1 then
begin
Application.MessageBox('Выберите запись.',
'Адресная книга',
mb_IconAsterisk + mb_OK);
Exit;
end else
begin
with RecordsList, RecordsList.Items do
begin
if ItemIndex = -1 then Exit;
if not Assigned(Objects[ItemIndex]) then
Objects[ItemIndex] := THuman.Create(Items[ItemIndex]);
with Objects[ItemIndex] as THuman do
begin

PrintForm.PrintDates.Lines.Add('Имя бланка: ' + Blanket);
PrintForm.PrintDates.Lines.Add('Имя: ' + FirstName);
PrintForm.PrintDates.Lines.Add('Отчество: ' + LastName);
PrintForm.PrintDates.Lines.Add('Фамилия: ' + MiddleName);
PrintForm.PrintDates.Lines.Add('Псевдоним: ' + NickName);
PrintForm.PrintDates.Lines.Add('Эл. почта: ' + EMAIL);

PrintForm.PrintDates.Lines.Add('Улица: ' + HomeStreet);
PrintForm.PrintDates.Lines.Add('Город: ' + City);
PrintForm.PrintDates.Lines.Add('Область/Край: ' + Country);
PrintForm.PrintDates.Lines.Add('Почтовый индекс: ' + PostIndex);
PrintForm.PrintDates.Lines.Add('Страна/Регион: ' + Region);
PrintForm.PrintDates.Lines.Add('Веб-узел: ' + WebAddress);
PrintForm.PrintDates.Lines.Add('Телефон: ' + HomePhone);
PrintForm.PrintDates.Lines.Add('Факс: ' + HomeFax);
PrintForm.PrintDates.Lines.Add('Сотовый: ' + Mobile);
PrintForm.PrintDates.Lines.Add('Улица: ' + WorkStreet);
PrintForm.PrintDates.Lines.Add('Город: ' + WorkCity);
PrintForm.PrintDates.Lines.Add('Область/Край: ' + WorkCountry);
PrintForm.PrintDates.Lines.Add('Почтовый индекс: ' + WorkIndex);
PrintForm.PrintDates.Lines.Add('Страна/Регион: ' + WorkRegion);
PrintForm.PrintDates.Lines.Add('Организация: ' + WorkOrganization);
PrintForm.PrintDates.Lines.Add('Должность: ' + WorkProfessonal);
PrintForm.PrintDates.Lines.Add('Отдел: ' + WorkPlace);
PrintForm.PrintDates.Lines.Add('Комната: ' + WorkRoom);
PrintForm.PrintDates.Lines.Add('Телефон: ' + WorkPhone);
PrintForm.PrintDates.Lines.Add('Факс: ' + WorkFax);
PrintForm.PrintDates.Lines.Add('Пейджер: ' + WorkPMessanger);

PrintForm.PrintDates.Lines.Add('Пол: ' + IntToStr(UserSex));
PrintForm.PrintDates.Lines.Add('День рождения: ' + DateToStr(UserBirth));
PrintForm.PrintDates.Lines.Add('Годовщина: ' + DateToStr(UserYear));
PrintForm.PrintDates.Lines.Add('Супруг(а): ' + Bride);
PrintForm.PrintDates.Lines.Add('Дети: ' + IntToStr(Children));

PrintForm.PrintDates.Lines.Add('Возраст: ' + IntToStr(Age));
PrintForm.PrintDates.Lines.Add('Рост: ' + UserHeight);
PrintForm.PrintDates.Lines.Add('Цвет глаз: ' + UserColorEye);
PrintForm.PrintDates.Lines.Add('Цвет волос: ' + UserColorHair);
PrintForm.PrintDates.Lines.Add('Национальность: ' + Nationality);

PrintForm.PrintDates.Lines.Add('Комментарий: ' + UserComment);
end;
end;
end;

PrintForm.Position := poMainFormCenter;
PrintForm.ShowModal;
except
end;
end;

procedure TMainForm.StyleTableItemClick(Sender: TObject);
begin
SetForm.SettingsPages.ActivePageIndex := 1;
SetForm.Position := poMainFormCenter;
SetForm.ShowModal;
end;

procedure TMainForm.CopyItemClick(Sender: TObject);
begin
try
PostMessage(Handle, WM_USER + 1024, 0, 0);
PrintForm.PrintDates.Lines.Clear;
if RecordsList.ItemIndex = -1 then
begin
Application.MessageBox('Выберите запись.',
'Адресная книга',
mb_IconAsterisk + mb_OK);
Exit;
end else
begin
with RecordsList, RecordsList.Items do
begin
if ItemIndex = -1 then Exit;
if not Assigned(Objects[ItemIndex]) then
Objects[ItemIndex] := THuman.Create(Items[ItemIndex]);
with Objects[ItemIndex] as THuman do
begin

PrintForm.PrintDates.Lines.Add('Имя бланка: ' + Blanket);
PrintForm.PrintDates.Lines.Add('Имя: ' + FirstName);
PrintForm.PrintDates.Lines.Add('Отчество: ' + LastName);
PrintForm.PrintDates.Lines.Add('Фамилия: ' + MiddleName);
PrintForm.PrintDates.Lines.Add('Псевдоним: ' + NickName);
PrintForm.PrintDates.Lines.Add('Эл. почта: ' + EMAIL);

PrintForm.PrintDates.Lines.Add('Улица: ' + HomeStreet);
PrintForm.PrintDates.Lines.Add('Город: ' + City);
PrintForm.PrintDates.Lines.Add('Область/Край: ' + Country);
PrintForm.PrintDates.Lines.Add('Почтовый индекс: ' + PostIndex);
PrintForm.PrintDates.Lines.Add('Страна/Регион: ' + Region);
PrintForm.PrintDates.Lines.Add('Веб-узел: ' + WebAddress);
PrintForm.PrintDates.Lines.Add('Телефон: ' + HomePhone);
PrintForm.PrintDates.Lines.Add('Факс: ' + HomeFax);
PrintForm.PrintDates.Lines.Add('Сотовый: ' + Mobile);
PrintForm.PrintDates.Lines.Add('Улица: ' + WorkStreet);
PrintForm.PrintDates.Lines.Add('Город: ' + WorkCity);
PrintForm.PrintDates.Lines.Add('Область/Край: ' + WorkCountry);
PrintForm.PrintDates.Lines.Add('Почтовый индекс: ' + WorkIndex);
PrintForm.PrintDates.Lines.Add('Страна/Регион: ' + WorkRegion);
PrintForm.PrintDates.Lines.Add('Организация: ' + WorkOrganization);
PrintForm.PrintDates.Lines.Add('Должность: ' + WorkProfessonal);
PrintForm.PrintDates.Lines.Add('Отдел: ' + WorkPlace);
PrintForm.PrintDates.Lines.Add('Комната: ' + WorkRoom);
PrintForm.PrintDates.Lines.Add('Телефон: ' + WorkPhone);
PrintForm.PrintDates.Lines.Add('Факс: ' + WorkFax);
PrintForm.PrintDates.Lines.Add('Пейджер: ' + WorkPMessanger);

PrintForm.PrintDates.Lines.Add('Пол: ' + IntToStr(UserSex));
PrintForm.PrintDates.Lines.Add('День рождения: ' + DateToStr(UserBirth));
PrintForm.PrintDates.Lines.Add('Годовщина: ' + DateToStr(UserYear));
PrintForm.PrintDates.Lines.Add('Супруг(а): ' + Bride);
PrintForm.PrintDates.Lines.Add('Дети: ' + IntToStr(Children));

PrintForm.PrintDates.Lines.Add('Возраст: ' + IntToStr(Age));
PrintForm.PrintDates.Lines.Add('Рост: ' + UserHeight);
PrintForm.PrintDates.Lines.Add('Цвет глаз: ' + UserColorEye);
PrintForm.PrintDates.Lines.Add('Цвет волос: ' + UserColorHair);
PrintForm.PrintDates.Lines.Add('Национальность: ' + Nationality);

PrintForm.PrintDates.Lines.Add('Комментарий: ' + UserComment);
end;
end;
end;
PrintForm.PrintDates.SelectAll;
PrintForm.PrintDates.CopyToClipboard;
except
end;
end;


procedure TMainForm.RecordsListDblClick(Sender: TObject);
begin
if SetForm.ch2.Checked then
begin
try
with RecordsList, RecordsList.Items do
begin
if ItemIndex = -1 then Exit;
if not Assigned(Objects[ItemIndex]) then
Objects[ItemIndex] := THuman.Create(Items[ItemIndex]);
with Objects[ItemIndex] as THuman do
begin

NoteForm.Caption := Blanket + ' - Свойства';

NoteForm.FirstUserName.Text := FirstName;
NoteForm.LastUserName.Text := LastName;
NoteForm.MiddleUserName.Text := MiddleName;
NoteForm.UserNickName.Text := NickName;
NoteForm.UsersEMail.Text := EMAIL;
NoteForm.BlanketName.Text := Blanket;

NoteForm.StreetAddress.Text := HomeStreet;
NoteForm.UserCity.Text := City;
NoteForm.UserCountry.Text := Country;
NoteForm.UserIndex.Text := PostIndex;
NoteForm.UserRegion.Text := Region;
NoteForm.UserWebAddress.Text := WebAddress;
NoteForm.UserPhone.Text := HomePhone;
NoteForm.UserFax.Text := HomeFax;
NoteForm.UserMobile.Text := Mobile;
NoteForm.StreetAddress2.Text := WorkStreet;
NoteForm.UserCity2.Text := WorkCity;
NoteForm.UserCountry2.Text := WorkCountry;
NoteForm.UserIndex2.Text := WorkIndex;
NoteForm.UserRegion2.Text := WorkRegion;
NoteForm.UserOrganization.Text := WorkOrganization;
NoteForm.UserWorker.Text := WorkProfessonal;
NoteForm.UserPlace.Text := WorkPlace;
NoteForm.UserRoom.Text := WorkRoom;
NoteForm.UserPhone2.Text := WorkPhone;
NoteForm.UserFax2.Text := WorkFax;
NoteForm.UserMessanger.Text := WorkPMessanger;

NoteForm.UserAgeBox.Value := Age;
NoteForm.UserHeight.Text := UserHeight;
NoteForm.UserColorEye.Text := UserColorEye;
NoteForm.UserColorHair.Text := UserColorHair;
NoteForm.UserNationality.Text := Nationality;

NoteForm.SexBox.ItemIndex := UserSex;
NoteForm.BirthBox.Date := UserBirth;
NoteForm.YearBox.Date := UserYear;
NoteForm.UserBride.Text := Bride;
NoteForm.UserChildren.ItemIndex := Children;

NoteForm.UserCommentText.Text := UserComment;

NoteForm.Position := poMainFormCenter;
NoteForm.ShowModal;
end;
end;
except
end;
end;
end;

procedure TMainForm.SearchBarItemClick(Sender: TObject);
begin
SearchBarItem.Checked := not SearchBarItem.Checked;
if SearchBarItem.Checked then
begin
QuickFindPanel.Visible := True;
QuickFindPanel.SetFocus;
end else
begin
QuickFindPanel.Visible := False;
end;
end;

procedure TMainForm.SearchBtClick(Sender: TObject);
begin
SearchBarItem.Checked := not SearchBarItem.Checked;
if SearchBarItem.Checked then
begin
QuickFindPanel.Visible := True;
QuickFindPanel.SetFocus;
end else
begin
QuickFindPanel.Visible := False;
end;
end;

procedure TMainForm.SysIntItemClick(Sender: TObject);
begin
IntForm.Position := poMainFormCenter;
IntForm.ShowModal;
end;

procedure TMainForm.GoogleSearchItemClick(Sender: TObject);
const
INTERNET_CONNECTION_MODEM = 1;
INTERNET_CONNECTION_LAN   = 2;
INTERNET_CONNECTdState = 3;
var
dwConnectionTypes: DWORD;
i: Integer;
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
if RecordsList.ItemIndex = -1 then
begin
Application.MessageBox('Выберите запись.',
'Адресная книга',
mb_IconAsterisk + mb_OK);
exit;
end else
begin
dwConnectionTypes:=INTERNET_CONNECTION_MODEM+INTERNET_CONNECTION_LAN+INTERNET_CONNECTdState;
if InternetGetConnectedState(@dwConnectionTypes,0) then
begin
i := RecordsList.ItemIndex;
OpenURL('http://www.google.com/search?hl=en&ie=UTF-8&oe=UTF-8&q=' + RecordsList.Items.Strings[i]);
end else begin
Application.MessageBox('Нет соединения с интернетом.',
'Адресная книга',
mb_IconAsterisk + mb_Ok);
end;
end;
end;

procedure AutoSendMail;
var
EMailDestinationString, SubjectString,
mailstring: string;
begin
EMailDestinationString := NoteForm.UsersEMail.Text;
SubjectString := 'Message Subject';
mailstring := 'mailto:' + EMailDestinationString;
if (ShellExecute(0, 'open', PChar(mailstring), '', '',
SW_SHOWNORMAL) <= 32) then

end;

procedure TMainForm.UserMail2ItemClick(Sender: TObject);
begin
if UserMail2Item.Enabled = False then
Exit else
AutoSendMail;
end;

procedure TMainForm.T1Timer(Sender: TObject);
begin
T1.Enabled := False;
if TipForm.ch1.Checked then
begin
TipForm.Position := poMainFormCenter;
TipForm.ShowModal;
end;
end;

procedure TMainForm.ToolBarDblClick(Sender: TObject);
begin
if SetForm.ch25.Checked then
begin
SetForm.SettingsPages.ActivePageIndex := 0;
SetForm.Position := poMainFormCenter;
SetForm.ShowModal;
end;
end;

procedure TMainForm.SortbyNameItemClick(Sender: TObject);
begin
RecordsList.Sorted := True;
end;

procedure TMainForm.RecordsListDragDrop(Sender, Source: TObject; X,
Y: Integer);
begin
with (Sender as TListBox) do
Items.Move(ItemIndex,ItemAtPos(Point(x,y),True));
end;

procedure TMainForm.RecordsListDragOver(Sender, Source: TObject; X,
Y: Integer; State: TDragState; var Accept: Boolean);
begin
Accept := (Sender=Source);
end;

procedure TMainForm.ClearBufferItemClick(Sender: TObject);
begin
Clipboard.Clear;
end;

procedure TMainForm.WinHeadItemClick(Sender: TObject);
begin
if WinHeadItem.Checked then
ShowProHeading else
HideProHeading;
end;

procedure TMainForm.HideProHeading;
var
Save: Longint;
begin
if BorderStyle=bsNone then
Exit;
Save:=GetWindowLong(Handle, GWL_STYLE);
if (Save and WS_CAPTION) = WS_CAPTION then
begin
case BorderStyle of
bsSingle, bsSizeable:
SetWindowLong(Handle, GWL_STYLE, Save and (not WS_CAPTION) or WS_BORDER);
bsDialog:
SetWindowLong(Handle, GWL_STYLE, Save and
(not WS_CAPTION) or DS_MODALFRAME or WS_DLGFRAME);
end;
Height := Height - GetSystemMetrics(SM_CYCAPTION);
Refresh;
end;
end;

procedure TMainForm.ShowProHeading;
var
Save: Longint;
begin
if BorderStyle = bsNone then
Exit;
Save := GetWindowLong(Handle, GWL_STYLE);
if (Save and WS_CAPTION) <> WS_CAPTION then
begin
case BorderStyle of
bsSingle, bsSizeable:
SetWindowLong(Handle, GWL_STYLE, Save or WS_CAPTION or WS_BORDER);
bsDialog:
SetWindowLong(Handle, GWL_STYLE, Save or WS_CAPTION or
DS_MODALFRAME or WS_DLGFRAME);
end;
Height := Height + getSystemMetrics(SM_CYCAPTION);
Refresh;
end;
end;

procedure TMainForm.MainMenuItemClick(Sender: TObject);
begin
if MainMenuItem.Checked then
begin
FileItem.Visible := True;
CreatingItem.Visible := True;
ViewItem.Visible := True;
ToolsItem.Visible := True;
HelpItem.Visible := True;
end else
begin
FileItem.Visible := False;
CreatingItem.Visible := False;
ViewItem.Visible := False;
ToolsItem.Visible := False;
HelpItem.Visible := False;
end;
end;

procedure TMainForm.SetStatusBarItemClick(Sender: TObject);
begin
StatusForm.Position := poMainFormCenter;
StatusForm.ShowModal;
end;

procedure TMainForm.ResetItemClick(Sender: TObject);
begin
try
PostMessage(Handle, WM_USER + 1024, 0, 0);
if Application.MessageBox('Вы хотите, чтобы все настройки были сброшены'
+ #13 + 'в состояние по умолчанию?',
'Адресная книга',
mb_IconQuestion + mb_YesNo) = idYes then
begin
MainForm.WindowState := wsNormal;
//Integration
IntForm.ch1.Checked := False;
IntForm.ch2.Checked := False;
IntForm.ch3.Checked := False;
Reg:=TRegistry.Create;
Reg.RootKey:=HKEY_CLASSES_ROOT;
Reg.OpenKey('\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\Shell\Адресная книга\Command', False);
Reg.DeleteKey('\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\Shell\Адресная книга\');
Reg.CloseKey;
Reg.Free;
Reg:= TRegistry.Create;
Reg.RootKey := HKEY_CLASSES_ROOT;
Reg.DeleteKey('*\Shell\Address Book');
Reg.CloseKey;
Reg.Free;
Reg:= TRegistry.Create;
Reg.RootKey := HKEY_LOCAL_MACHINE;
Reg.DeleteKey('\Software\Microsoft\Internet Explorer\Extensions\{66C445BA-6A61-4427-8D66-4DAC3812E6DD}\');
Reg.CloseKey;
Reg.Free;
Reg:= TRegistry.Create;
Reg.RootKey := HKEY_CLASSES_ROOT;
Reg.OpenKey('\Directory\Shell\Address Book\Command', False);
Reg.DeleteKey('\Directory\Shell\Address Book\');
Reg.CloseKey;
Reg.Free;
//License Window
TipForm.ch1.Checked := True;
//ToolBar
ToolBarItem.Checked := True;
ToolBar.Visible := True;
//StatusBar
StatusBarItem.Checked := True;
StatusBar.Visible := True;
//SearchBar
SearchBarItem.Checked := True;
QuickFindPanel.Visible := True;
//Stay on Top
OnTopItem.Checked := False;
if (GetMenuState(SM, OnTopFrm, MF_BYCOMMAND) and MF_CHECKED) <> 0
then begin
CheckMenuItem(SM, OnTopFrm, MF_BYCOMMAND+MF_UNCHECKED);
SetWindowPos(Handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOMOVE+SWP_NOSIZE);
end;
//Full Screen Mode
if FullScreenItem.Checked then
begin
FullScreenItem.Click;
end;
//Window Headline
WinHeadItem.Checked := True;
ShowProHeading;
//Main Menu
if not MainMenuItem.Checked then
MainMenuItem.Click;
//Screen Snap
MainForm.ScreenSnap := False;
AboutForm.ScreenSnap := False;
AttrForm.ScreenSnap := False;
IntForm.ScreenSnap := False;
LicForm.ScreenSnap := False;
NoteForm.ScreenSnap := False;
PrintForm.ScreenSnap := False;
SetForm.ScreenSnap := False;
StatusForm.ScreenSnap := False;
StyleForm.ScreenSnap := False;
TipForm.ScreenSnap := False;
//StatusBar Settings
StatusForm.ch1.Checked := True;
StatusForm.ch2.Checked := True;
StatusForm.ch3.Checked := True;
StatusForm.ch4.Checked := True;
//Preferences
SetForm.ch1.Checked := True;
SetForm.ch2.Checked := True;
SetForm.ch3.Checked := True;
SetForm.ch4.Checked := True;
SetForm.ch5.Checked := False;
SetForm.ch6.Checked := False;
SetForm.ch7.Checked := True;
SetForm.ch8.Checked := False;
SetForm.ch9.Checked := False;
SetForm.ch10.Checked := False;
SetForm.ch11.Checked := False;
SetForm.ch12.Checked := True;
SetForm.ch13.Checked := True;
SetForm.ch14.Checked := False;
SetForm.ch15.Checked := False;
SetForm.ch16.Checked := False;
SetForm.ch17.Checked := False;
SetForm.ch18.Checked := False;
SetForm.ch19.Checked := False;
SetForm.ch20.Checked := True;
SetForm.ch21.Checked := False;
SetForm.ch22.Checked := True;
SetForm.ch23.Checked := True;
SetForm.ch24.Checked := False;
SetForm.ch25.Checked := True;
SetForm.ch26.Checked := False;
SetForm.ch27.Checked := False;
SetForm.ch28.Checked := False;
SetForm.ch29.Checked := True;
SetForm.ColorPickDlg1.ActiveColor := clBlack;
SetForm.ColorPickDlg2.ActiveColor := clWhite;
SetForm.FontsNameCombo.Text := 'Tahoma';
SetForm.FontsSizeEdit.Value := 8;
//Preferences - Style Window
StyleForm.ch1.Checked := False;
StyleForm.ch2.Checked := False;
StyleForm.ch3.Checked := False;
StyleForm.ch4.Checked := False;
StyleForm.ch5.Checked := True;
//Print Window
PrintForm.PrintDates.Font.Name := 'Tahoma';
PrintForm.PrintDates.Font.Size := 8;
PrintForm.PrintDates.Font.Style := [];
SetForm.Cancel.OnClick(Self);
end;
except
end;
end;

procedure TMainForm.HaltItemClick(Sender: TObject);
var
F: TextFile;
i: Integer;
begin
MainForm.OnClose := nil;
MainForm.OnCloseQuery := nil;
Ini.WriteBool('Parameters', 'Tool bar', ToolBarItem.Checked);
Ini.WriteBool('Parameters', 'Status bar', StatusBarItem.Checked);
Ini.WriteBool('Parameters', 'Search bar', SearchBarItem.Checked);
Ini.WriteBool('Parameters', 'Always on top', OnTopItem.Checked);
Ini.WriteBool('Parameters', 'Double click in table', SetForm.ch2.Checked);
Ini.WriteBool('Parameters', 'Context menu', SetForm.ch3.Checked);
Ini.WriteBool('Parameters', 'Status bar show hint', SetForm.ch4.Checked);
Ini.WriteBool('Parameters', 'Minimize to tray', SetForm.ch5.Checked);
Ini.WriteBool('Parameters', 'Hide window to tray on exit', SetForm.ch6.Checked);
Ini.WriteBool('Parameters', 'Use of XP menu', SetForm.ch7.Checked);
Ini.WriteBool('Parameters', 'Confirm exit', SetForm.ch8.Checked);
Ini.WriteBool('Parameters', 'Run with Windows OS startup', SetForm.ch9.Checked);
Ini.WriteBool('Parameters', 'Run at full screen mode', SetForm.ch10.Checked);
Ini.WriteBool('Parameters', 'Hide message on creating shortcut', SetForm.ch11.Checked);
Ini.WriteBool('Parameters', 'Modal windows on Task Bar', SetForm.ch12.Checked);
Ini.WriteBool('Parameters', 'Move on the client area', SetForm.ch13.Checked);
Ini.WriteBool('Parameters', 'Screen snap', SetForm.ch14.Checked);
Ini.WriteBool('Parameters', 'Window only in the client area', SetForm.ch15.Checked);
Ini.WriteBool('Parameters', 'Confirm on delete record', SetForm.ch22.Checked);
Ini.WriteBool('Parameters', 'Anim main window', SetForm.ch23.Checked);
Ini.WriteBool('Parameters', 'Invisible images on tabs', SetForm.ch24.Checked);
Ini.WriteBool('Parameters', 'DblClk on tool bar', SetForm.ch25.Checked);
Ini.WriteBool('Parameters', 'Use of drag mode records', SetForm.ch26.Checked);
Ini.WriteBool('Parameters', 'Confirm on before add record', SetForm.ch27.Checked);
Ini.WriteBool('Parameters', 'Key enter on record', SetForm.ch28.Checked);
Ini.WriteBool('Full Screen Mode', 'Hide tool bar', SetForm.ch16.Checked);
Ini.WriteBool('Full Screen Mode', 'Hide status bar', SetForm.ch17.Checked);
Ini.WriteBool('Full Screen Mode', 'Hide search bar', SetForm.ch18.Checked);
Ini.WriteBool('On exit', 'Shutdown PC', SetForm.ch19.Checked);
Ini.WriteBool('On exit', 'Confirm before shutdown PC', SetForm.ch20.Checked);
Ini.WriteBool('On exit', 'Delete all records', SetForm.ch21.Checked);
Ini.WriteInteger('Style', 'Records color', SetForm.ColorPickDlg1.ActiveColor);
Ini.WriteInteger('Style', 'Table color', SetForm.ColorPickDlg2.ActiveColor);
Ini.WriteInteger('On exit', 'Fonts size', SetForm.FontsSizeEdit.Value);
Ini.WriteBool('Fonts settings', 'Underline', StyleForm.ch1.Checked);
Ini.WriteBool('Fonts settings', 'Strikeout', StyleForm.ch2.Checked);
Ini.WriteBool('Fonts settings', 'Bold', StyleForm.ch3.Checked);
Ini.WriteBool('Fonts settings', 'Italic', StyleForm.ch4.Checked);
Ini.WriteBool('Fonts settings', 'Def', StyleForm.ch5.Checked);
Ini.WriteBool('Status bar', 'Total records', StatusForm.ch1.Checked);
Ini.WriteBool('Status bar', 'Current date', StatusForm.ch2.Checked);
Ini.WriteBool('Status bar', 'Current time', StatusForm.ch3.Checked);
Ini.WriteBool('Status bar', 'Current month\current day', StatusForm.ch4.Checked);
Ini.WriteInteger('Tip window', 'Tip position', TipForm.NextBt.Tag);
Ini.WriteBool('Position', 'Save window position', SetForm.ch1.Checked);
if SetForm.ch1.Checked then
begin
Ini.WriteInteger('Position', 'Top', Top);
Ini.WriteInteger('Position', 'Left', Left);
Ini.WriteInteger('Position', 'Client Height', ClientHeight);
Ini.WriteInteger('Position', 'Client Width', ClientWidth);
end;
Ini.WriteBool('License on start', 'Show', TipForm.ch1.Checked);
try
with RecordsList.Items do
begin
SaveToFile(ParamStr(0) + '.abd');
AssignFile(F, Copy(ParamStr(0) + '.abd',1,Length('AddressBook.abd')-4)+'.lso');
Rewrite(F);
for i := 0 to Count - 1 do
if Objects[i] <> Nil then
begin

Writeln(F, (Objects[i] as THuman).FirstName);
Writeln(F, (Objects[i] as THuman).LastName);
Writeln(F, (Objects[i] as THuman).MiddleName);
Writeln(F, (Objects[i] as THuman).NickName);
Writeln(F, (Objects[i] as THuman).EMAIL);
Writeln(F, (Objects[i] as THuman).Blanket);

Writeln(F, (Objects[i] as THuman).HomeStreet);
Writeln(F, (Objects[i] as THuman).City);
Writeln(F, (Objects[i] as THuman).Country);
Writeln(F, (Objects[i] as THuman).PostIndex);
Writeln(F, (Objects[i] as THuman).Region);
Writeln(F, (Objects[i] as THuman).WebAddress);
Writeln(F, (Objects[i] as THuman).HomePhone);
Writeln(F, (Objects[i] as THuman).HomeFax);
Writeln(F, (Objects[i] as THuman).Mobile);
Writeln(F, (Objects[i] as THuman).WorkStreet);
Writeln(F, (Objects[i] as THuman).WorkCity);
Writeln(F, (Objects[i] as THuman).WorkCountry);
Writeln(F, (Objects[i] as THuman).WorkIndex);
Writeln(F, (Objects[i] as THuman).WorkRegion);
Writeln(F, (Objects[i] as THuman).WorkOrganization);
Writeln(F, (Objects[i] as THuman).WorkProfessonal);
Writeln(F, (Objects[i] as THuman).WorkPlace);
Writeln(F, (Objects[i] as THuman).WorkRoom);
Writeln(F, (Objects[i] as THuman).WorkPhone);
Writeln(F, (Objects[i] as THuman).WorkFax);
Writeln(F, (Objects[i] as THuman).WorkPMessanger);

Writeln(F, (Objects[i] as THuman).Age);
Writeln(F, (Objects[i] as THuman).UserHeight);
Writeln(F, (Objects[i] as THuman).UserColorEye);
Writeln(F, (Objects[i] as THuman).UserColorHair);
Writeln(F, (Objects[i] as THuman).Nationality);

Writeln(F, (Objects[i] as THuman).UserSex);
Writeln(F, (Objects[i] as THuman).UserBirth);
Writeln(F, (Objects[i] as THuman).UserYear);
Writeln(F, (Objects[i] as THuman).Bride);
Writeln(F, (Objects[i] as THuman).Children);

Writeln(F, (Objects[i] as THuman).UserComment);

end;
CloseFile(F);
end;
except
end;

MainForm.Close;
end;

procedure TMainForm.TipDayItemClick(Sender: TObject);
begin
TipForm.Position := poMainFormCenter;
TipForm.ShowModal;
end;

procedure TMainForm.RecordsListKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
if not FullScreenItem.Checked then
begin
if Key = vk_Escape then
Close;
end;
if FullScreenItem.Checked then
begin
if Key = vk_Escape then
FullScreenItem.Click;
end;
if SetForm.ch28.Checked then
begin
if Key = vk_Return then
begin
EditItem.OnClick(Self);
end;
end;
end;

procedure TMainForm.QuickFindPanelDblClick(Sender: TObject);
begin
QuickFindPanel.Clear;
end;

procedure TMainForm.HomePageItemClick(Sender: TObject);
begin
ShellExecute(Handle, nil, 'http://www.viacoding.mylivepage.ru/', nil,nil, Sw_ShowNormal);
end;

end.
