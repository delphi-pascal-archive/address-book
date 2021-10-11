unit SP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPButton, ComCtrls, XPCheckBox, XPGroupBox, XPEdit, XPLabel, ExtCtrls,
  StdCtrls, Spin, RtColorPicker, IniFiles, Registry, ActiveX, ComObj, ShlObj,
  XPRadioButton, rmBaseEdit, rmBtnEdit, ImgList, Buttons;

  type
   TWmMoving = record
   Msg: Cardinal;
   fwSide: Cardinal;
   lpRect: PRect;
   Result: Integer;
  end;

  const
   AlignCenter = Wm_User + 1024;

  type
   TTabSheet = class(ComCtrls.TTabSheet);

 type
   TSetForm = class(TForm)
    SettingsPages: TPageControl;
    GeneralTab: TTabSheet;
    EventsTab: TTabSheet;
    ShortcutTab: TTabSheet;
    WindowTab: TTabSheet;
    FullScreenTab: TTabSheet;
    OK: TXPButton;
    tx1: TXPLabel;
    TextName: TXPEdit;
    tx2: TXPLabel;
    tx3: TXPLabel;
    tx4: TXPLabel;
    tx5: TXPLabel;
    tx6: TXPLabel;
    ch11: TXPCheckBox;
    sep8: TBevel;
    ch9: TXPCheckBox;
    ch8: TXPCheckBox;
    OnExitTab: TTabSheet;
    ch19: TXPCheckBox;
    ch20: TXPCheckBox;
    ch1: TXPCheckBox;
    sep1: TBevel;
    ch5: TXPCheckBox;
    ch6: TXPCheckBox;
    ch13: TXPCheckBox;
    ch14: TXPCheckBox;
    ch15: TXPCheckBox;
    sep10: TBevel;
    ch12: TXPCheckBox;
    StyleTab: TTabSheet;
    ch4: TXPCheckBox;
    ch10: TXPCheckBox;
    ch7: TXPCheckBox;
    sep6: TBevel;
    sep7: TBevel;
    sep9: TBevel;
    sep11: TBevel;
    tx7: TXPLabel;
    ch16: TXPCheckBox;
    ch17: TXPCheckBox;
    tx9: TXPLabel;
    ColorPickDlg1: TColorPickCombo;
    sep3: TBevel;
    tx14: TXPLabel;
    ch3: TXPCheckBox;
    sep2: TBevel;
    tx8: TXPLabel;
    sep12: TBevel;
    ch18: TXPCheckBox;
    sep13: TBevel;
    ch21: TXPCheckBox;
    ch2: TXPCheckBox;
    tx10: TXPLabel;
    sep5: TBevel;
    FontsNameCombo: TComboBox;
    tx11: TXPLabel;
    FontsSizeEdit: TSpinEdit;
    tx12: TXPLabel;
    tx15: TXPLabel;
    tx13: TXPLabel;
    StyleBt: TXPButton;
    sep4: TBevel;
    TabImages: TImageList;
    ch22: TXPCheckBox;
    ch23: TXPCheckBox;
    DifferentTab: TTabSheet;
    ch24: TXPCheckBox;
    ch25: TXPCheckBox;
    tx16: TXPLabel;
    ColorPickDlg2: TColorPickCombo;
    ch26: TXPCheckBox;
    ch27: TXPCheckBox;
    tx17: TXPLabel;
    tx18: TXPLabel;
    sep14: TBevel;
    ch28: TXPCheckBox;
    sep15: TBevel;
    BackTab: TSpeedButton;
    ForwardTab: TSpeedButton;
    sep16: TBevel;
    Cancel: TXPButton;
    ch29: TXPCheckBox;
    procedure OKClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure tx2Click(Sender: TObject);
    procedure tx3Click(Sender: TObject);
    procedure tx4Click(Sender: TObject);
    procedure tx5Click(Sender: TObject);
    procedure tx6Click(Sender: TObject);
    procedure tx14Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure StyleBtClick(Sender: TObject);
    procedure ch6Click(Sender: TObject);
    procedure tx17Click(Sender: TObject);
    procedure tx17MouseLeave(Sender: TObject);
    procedure tx17MouseUp(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure tx17MouseMove(Sender: TObject; Shift: TShiftState; X,
    Y: Integer);
    procedure tx18MouseMove(Sender: TObject; Shift: TShiftState; X,
    Y: Integer);
    procedure tx18MouseUp(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure tx18MouseLeave(Sender: TObject);
    procedure tx14MouseLeave(Sender: TObject);
    procedure tx14MouseMove(Sender: TObject; Shift: TShiftState; X,
    Y: Integer);
    procedure tx14MouseDown(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure tx14MouseUp(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure ForwardTabClick(Sender: TObject);
    procedure BackTabClick(Sender: TObject);
    procedure CancelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private

    LinkFile:IPersistFile;

    ShellObject:IUnknown;

    ShellLink:IShellLink;

    FileName,ShortcutPosition:string;

    WShortcutPosition:WideString;

    P:PItemIDList;

    C:array[0..1000] of char;

    R : TRegistry;

    SM: HWND;

    Ini : TIniFile;

    FColor: TColor;

    procedure WMMoving(var msg: TWMMoving);
    message WM_MOVING;

    procedure SetColor(Value: TColor);

    procedure WMEraseBkGnd(var Msg: TWMEraseBkGnd); 
    message WM_ERASEBKGND;

    procedure CMMouseLeave(var msg: TMessage);
    message CM_MOUSELEAVE;

    procedure ChangeMessageBoxPosition(var Msg: TMessage);
    message AlignCenter;

  public

    constructor Create(aOwner: TComponent); override;
    property Color: TColor read FColor write SetColor;

  end;

var
  SetForm: TSetForm;
  msgCaption: PChar;

implementation

uses NP, AP, ATP, LP, UP, SPP, PRP, INP, SBP, TP;

{$R *.dfm}

constructor TSetForm.Create(aOwner: TComponent);
begin
inherited;
FColor := $00FFE7CE;
end;

procedure TSetForm.SetColor(Value: TColor);
begin
if FColor = Value then
begin
FColor := Value;
Invalidate;
end;
end;

procedure TSetForm.WMEraseBkGnd(var Msg: TWMEraseBkGnd);
begin
if FColor = clBtnFace then
inherited else
begin
Brush.Color := FColor;
Windows.FillRect(Msg.dc, ClientRect, Brush.Handle);
Msg.Result := 1;
end;
end;

procedure TSetForm.OKClick(Sender: TObject);
begin
if StyleForm.ch1.Checked then
begin
if not StyleForm.ch2.Checked then
MainForm.RecordsList.Font.Style := [fsUnderline];
end;
if StyleForm.ch2.Checked then
begin
if not StyleForm.ch1.Checked then
MainForm.RecordsList.Font.Style := [fsStrikeout];
end;
if StyleForm.ch1.Checked then
if StyleForm.ch2.Checked then
MainForm.RecordsList.Font.Style := [fsUnderline, fsStrikeout];
if not StyleForm.ch1.Checked then
if not StyleForm.ch2.Checked then
MainForm.RecordsList.Font.Style := [];
begin
if StyleForm.Ch3.Checked then
begin
if StyleForm.Ch1.Checked then
MainForm.RecordsList.Font.Style := [fsUnderline, fsBold];
if StyleForm.Ch2.Checked then
MainForm.RecordsList.Font.Style := [fsStrikeOut, fsBold];
if StyleForm.Ch1.Checked then
if StyleForm.Ch2.Checked then
MainForm.RecordsList.Font.Style := [fsUnderline, fsStrikeOut, fsBold];
if not StyleForm.Ch1.Checked then
if not StyleForm.Ch2.Checked then
MainForm.RecordsList.Font.Style := [fsBold];
end;
begin
if StyleForm.Ch4.Checked then
begin
if StyleForm.Ch1.Checked then
MainForm.RecordsList.Font.Style := [fsUnderline, fsItalic];
if StyleForm.Ch2.Checked then
MainForm.RecordsList.Font.Style := [fsStrikeOut, fsItalic];
if StyleForm.Ch1.Checked then
if StyleForm.Ch2.Checked then
MainForm.RecordsList.Font.Style := [fsUnderline, fsStrikeOut, fsItalic];
if not StyleForm.Ch1.Checked then
if not StyleForm.Ch2.Checked then
MainForm.RecordsList.Font.Style := [fsItalic];
end;
end;
end;
begin
if StyleForm.Ch5.Checked then
begin
if StyleForm.Ch1.Checked then
MainForm.RecordsList.Font.Style := [fsUnderline];
if StyleForm.Ch2.Checked then
MainForm.RecordsList.Font.Style := [fsStrikeOut];
if StyleForm.Ch1.Checked then
if StyleForm.Ch2.Checked then
MainForm.RecordsList.Font.Style := [fsUnderline, fsStrikeOut];
if not StyleForm.Ch1.Checked then
if not StyleForm.Ch2.Checked then
MainForm.RecordsList.Font.Style := [];
end;
end;
MainForm.RecordsList.Font.Color := ColorPickDlg1.ActiveColor;
MainForm.RecordsList.Color := ColorPickDlg2.ActiveColor;
MainForm.RecordsList.Font.Name := FontsNameCombo.Text;
MainForm.RecordsList.Font.Size := FontsSizeEdit.Value;
if ch14.Checked then
begin
MainForm.ScreenSnap := True;
AboutForm.ScreenSnap := True;
AttrForm.ScreenSnap := True;
IntForm.ScreenSnap := True;
LicForm.ScreenSnap := True;
NoteForm.ScreenSnap := True;
PrintForm.ScreenSnap := True;
SetForm.ScreenSnap := True;
StatusForm.ScreenSnap := True;
StyleForm.ScreenSnap := True;
TipForm.ScreenSnap := True;
end else
begin
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
end;
if ch24.Checked then
begin
GeneralTab.ImageIndex := -1;
StyleTab.ImageIndex := -1;
EventsTab.ImageIndex := -1;
ShortcutTab.ImageIndex := -1;
WindowTab.ImageIndex := -1;
FullScreenTab.ImageIndex := -1;
OnExitTab.ImageIndex := -1;
DifferentTab.ImageIndex := -1;
end else
begin
GeneralTab.ImageIndex := 0;
StyleTab.ImageIndex := 1;
EventsTab.ImageIndex := 2;
ShortcutTab.ImageIndex := 3;
WindowTab.ImageIndex := 4;
FullScreenTab.ImageIndex := 5;
OnExitTab.ImageIndex := 6;
DifferentTab.ImageIndex := 7;
end;
if ch26.Checked then
begin
MainForm.RecordsList.DragMode := dmAutomatic;
end else
begin
MainForm.RecordsList.DragMode := dmManual;
end;
if ch29.Checked then
SettingsPages.MultiLine := True else
SettingsPages.MultiLine := False;
R := TRegistry.Create;
R.RootKey := HKEY_LOCAL_MACHINE;
R.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run', false);
if ch9.Checked then
R.WriteString(Application.Title, ParamStr(0)) else
R.DeleteValue(Application.Title);
R.Free;
SetForm.Close;
MainForm.BringToFront;
Ini.WriteBool('Position', 'Save window position', ch1.Checked);
Ini.WriteBool('Parameters', 'Double click in table', ch2.Checked);
Ini.WriteBool('Parameters', 'Context menu', ch3.Checked);
Ini.WriteBool('Parameters', 'Status bar show hint', ch4.Checked);
Ini.WriteBool('Parameters', 'Minimize to tray', ch5.Checked);
Ini.WriteBool('Parameters', 'Hide window to tray on exit', ch6.Checked);
Ini.WriteBool('Parameters', 'Use of XP menu', ch7.Checked);
Ini.WriteBool('Parameters', 'Confirm exit', ch8.Checked);
Ini.WriteBool('Parameters', 'Run with Windows OS startup', ch9.Checked);
Ini.WriteBool('Parameters', 'Run at full screen mode', ch10.Checked);
Ini.WriteBool('Parameters', 'Hide message on creating shortcut', ch11.Checked);
Ini.WriteBool('Parameters', 'Modal windows on Task Bar', ch12.Checked);
Ini.WriteBool('Parameters', 'Move on the client area', ch13.Checked);
Ini.WriteBool('Parameters', 'Screen snap', ch14.Checked);
Ini.WriteBool('Parameters', 'Window only in the client area', ch15.Checked);
Ini.WriteBool('Full Screen Mode', 'Hide tool bar', ch16.Checked);
Ini.WriteBool('Full Screen Mode', 'Hide status bar', ch17.Checked);
Ini.WriteBool('Full Screen Mode', 'Hide search bar', ch18.Checked);
Ini.WriteBool('On exit', 'Shutdown PC', ch19.Checked);
Ini.WriteBool('On exit', 'Confirm before shutdown PC', ch20.Checked);
Ini.WriteBool('On exit', 'Delete all records', ch21.Checked);
Ini.WriteBool('Parameters', 'Confirm on delete record', ch22.Checked);
Ini.WriteBool('Parameters', 'Anim main window', ch23.Checked);
Ini.WriteBool('Parameters', 'Invisible images on tabs', ch24.Checked);
Ini.WriteBool('Parameters', 'DblClk on tool bar', ch25.Checked);
Ini.WriteBool('Parameters', 'Use of drag mode records', ch26.Checked);
Ini.WriteBool('Parameters', 'Confirm on before add record', ch27.Checked);
Ini.WriteBool('Parameters', 'Key enter on record', ch28.Checked);
Ini.WriteBool('Parameters', 'Multiline tab', ch29.Checked);
Ini.WriteInteger('Style', 'Records color', ColorPickDlg1.ActiveColor);
Ini.WriteInteger('Style', 'Table color', ColorPickDlg2.ActiveColor);
Ini.WriteInteger('On exit', 'Fonts size', FontsSizeEdit.Value);
end;

procedure TSetForm.FormKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
if Key = vk_Escape then
SetForm.Close;
end;

procedure TSetForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
if SetForm.ch13.Checked then
begin
ReleaseCapture;
Perform(Wm_SysCommand, $f012, 0);
end;
end;

procedure TSetForm.FormShow(Sender: TObject);
begin
FontsNameCombo.Items := Screen.Fonts;
FontsNameCombo.Text := MainForm.RecordsList.Font.Name;
TextName.Height := 19;
if SetForm.ch12.Checked then
begin
SetWindowLong(SetForm.Handle, GWL_EXSTYLE,
GetWindowLOng(SetForm.Handle, GWL_EXSTYLE) or WS_EX_APPWINDOW);
end;
if ch24.Checked then
begin
GeneralTab.ImageIndex := 0;
StyleTab.ImageIndex := 1;
EventsTab.ImageIndex := 2;
ShortcutTab.ImageIndex := 3;
WindowTab.ImageIndex := 4;
FullScreenTab.ImageIndex := 5;
OnExitTab.ImageIndex := 6;
DifferentTab.ImageIndex := 7;
end else
begin
GeneralTab.ImageIndex := -1;
StyleTab.ImageIndex := -1;
EventsTab.ImageIndex := -1;
ShortcutTab.ImageIndex := -1;
WindowTab.ImageIndex := -1;
FullScreenTab.ImageIndex := -1;
OnExitTab.ImageIndex := -1;
DifferentTab.ImageIndex := -1;
end;
if ch29.Checked then
SettingsPages.MultiLine := True else
SettingsPages.MultiLine := False;
end;

procedure TSetForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Cancel.OnClick(Self);
Cancel.SetFocus;
end;

procedure TSetForm.FormCreate(Sender: TObject);
begin
Ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
try
ch1.Checked := Ini.ReadBool('Position', 'Save window position', ch1.Checked);
ch2.Checked := Ini.ReadBool('Parameters', 'Double click in table', ch2.Checked);
ch3.Checked := Ini.ReadBool('Parameters', 'Context menu', ch3.Checked);
ch4.Checked := Ini.ReadBool('Parameters', 'Status bar show hint', ch4.Checked);
ch5.Checked := Ini.ReadBool('Parameters', 'Minimize to tray', ch5.Checked);
ch6.Checked := Ini.ReadBool('Parameters', 'Hide window to tray on exit', ch6.Checked);
ch7.Checked := Ini.ReadBool('Parameters', 'Use of XP menu', ch7.Checked);
ch8.Checked := Ini.ReadBool('Parameters', 'Confirm exit', ch8.Checked);
ch9.Checked := Ini.ReadBool('Parameters', 'Run with Windows OS startup', ch9.Checked);
ch10.Checked := Ini.ReadBool('Parameters', 'Run at full screen mode', ch10.Checked);
ch11.Checked := Ini.ReadBool('Parameters', 'Hide message on creating shortcut', ch11.Checked);
ch12.Checked := Ini.ReadBool('Parameters', 'Modal windows on Task Bar', ch12.Checked);
ch13.Checked := Ini.ReadBool('Parameters', 'Move on the client area', ch13.Checked);
ch14.Checked := Ini.ReadBool('Parameters', 'Screen snap', ch14.Checked);
ch15.Checked := Ini.ReadBool('Parameters', 'Window only in the client area', ch15.Checked);
ch16.Checked := Ini.ReadBool('Full Screen Mode', 'Hide tool bar', ch16.Checked);
ch17.Checked := Ini.ReadBool('Full Screen Mode', 'Hide status bar', ch17.Checked);
ch18.Checked := Ini.ReadBool('Full Screen Mode', 'Hide search bar', ch18.Checked);
ch19.Checked := Ini.ReadBool('On exit', 'Shutdown PC', ch19.Checked);
ch20.Checked := Ini.ReadBool('On exit', 'Confirm before shutdown PC', ch20.Checked);
ch21.Checked := Ini.ReadBool('On exit', 'Delete all records', ch21.Checked);
ch22.Checked := Ini.ReadBool('Parameters', 'Confirm on delete record', ch22.Checked);
ch23.Checked := Ini.ReadBool('Parameters', 'Anim main window', ch23.Checked);
ch24.Checked := Ini.ReadBool('Parameters', 'Invisible images on tabs', ch24.Checked);
ch25.Checked := Ini.ReadBool('Parameters', 'DblClk on tool bar', ch25.Checked);
ch26.Checked := Ini.ReadBool('Parameters', 'Use of drag mode records', ch26.Checked);
ch27.Checked := Ini.ReadBool('Parameters', 'Confirm on before add record', ch27.Checked);
ch28.Checked := Ini.ReadBool('Parameters', 'Key enter on record', ch28.Checked);
ch29.Checked := Ini.ReadBool('Parameters', 'Multiline tab', ch29.Checked);
ColorPickDlg1.ActiveColor := Ini.ReadInteger('Style', 'Records color', ColorPickDlg1.ActiveColor);
ColorPickDlg2.ActiveColor := Ini.ReadInteger('Style', 'Table color', ColorPickDlg2.ActiveColor);
FontsSizeEdit.Value := Ini.ReadInteger('On exit', 'Fonts size', FontsSizeEdit.Value);
except
end;
end;

procedure TSetForm.tx2Click(Sender: TObject);
begin
ShellObject:=CreateComObject(CLSID_ShellLink);
LinkFile:=ShellObject as IPersistFile;
ShellLink:=ShellObject as IShellLink;
FileName:=ParamStr(0);
ShellLink.SetPath(pchar(FileName));
ShellLink.SetWorkingDirectory(pchar(ExtractFilePath(FileName)));
if SHGetSpecialFolderLocation(Handle,CSIDL_DESKTOP,P)=NOERROR then begin
SHGetPathFromIDList(P,C);
ShortcutPosition:=StrPas(C);
PostMessage(Handle, WM_USER + 1024, 0, 0);
if not Ch11.Checked then
if Application.MessageBox(PChar('Вы хотите разместить ярлык "' + TextName.Text + '" на Рабочем Столе?'),
'Создание ярлыка',
Mb_IconQuestion + mb_YesNo) = IdYes then
ShortcutPosition:=ShortcutPosition+'\'+ TextName.Text + '.lnk';
if Ch11.Checked then
ShortcutPosition:=ShortcutPosition+'\'+ TextName.Text + '.lnk';
WShortcutPosition:=ShortcutPosition;
LinkFile.Save(PWChar(WShortcutPosition),False);
end;
end;

procedure TSetForm.tx3Click(Sender: TObject);
begin
ShellObject:=CreateComObject(CLSID_ShellLink);
LinkFile:=ShellObject as IPersistFile;
ShellLink:=ShellObject as IShellLink;
FileName:=ParamStr(0);
ShellLink.SetPath(pchar(FileName));
ShellLink.SetWorkingDirectory(pchar(ExtractFilePath(FileName)));
if SHGetSpecialFolderLocation(Handle,CSIDL_STARTMENU,P)=NOERROR then begin
SHGetPathFromIDList(P,C);
ShortcutPosition:=StrPas(C);
PostMessage(Handle, WM_USER + 1024, 0, 0);
if not Ch11.Checked then
if Application.MessageBox(PChar('Вы хотите разместить ярлык "' + TextName.Text + '" в Главном Меню?'),
'Создание ярлыка',
Mb_IconQuestion + mb_YesNo) = IdYes then
ShortcutPosition:=ShortcutPosition+'\'+ TextName.Text + '.lnk';
if Ch11.Checked then
ShortcutPosition:=ShortcutPosition+'\'+ TextName.Text + '.lnk';
WShortcutPosition:=ShortcutPosition;
LinkFile.Save(PWChar(WShortcutPosition),False);
end;
end;

procedure TSetForm.tx4Click(Sender: TObject);
begin
ShellObject:=CreateComObject(CLSID_ShellLink);
LinkFile:=ShellObject as IPersistFile;
ShellLink:=ShellObject as IShellLink;
FileName:=ParamStr(0);
ShellLink.SetPath(pchar(FileName));
ShellLink.SetWorkingDirectory(pchar(ExtractFilePath(FileName)));
if SHGetSpecialFolderLocation(Handle,CSIDL_PROGRAMS,P)=NOERROR then begin
SHGetPathFromIDList(P,C);
ShortcutPosition:=StrPas(C);
PostMessage(Handle, WM_USER + 1024, 0, 0);
if not Ch11.Checked then
if Application.MessageBox(PChar('Вы хотите разместить ярлык "' + TextName.Text + '" в Меню Программы?'),
'Создание ярлыка',
Mb_IconQuestion + mb_YesNo) = IdYes then
ShortcutPosition:=ShortcutPosition+'\'+ TextName.Text + '.lnk';
if Ch11.Checked then
ShortcutPosition:=ShortcutPosition+'\'+ TextName.Text + '.lnk';
WShortcutPosition:=ShortcutPosition;
LinkFile.Save(PWChar(WShortcutPosition),False);
end;
end;

procedure TSetForm.tx5Click(Sender: TObject);
begin
ShellObject:=CreateComObject(CLSID_ShellLink);
LinkFile:=ShellObject as IPersistFile;
ShellLink:=ShellObject as IShellLink;
FileName:=ParamStr(0);
ShellLink.SetPath(pchar(FileName));
ShellLink.SetWorkingDirectory(pchar(ExtractFilePath(FileName)));
if SHGetSpecialFolderLocation(Handle,CSIDL_STARTUP,P)=NOERROR then begin
SHGetPathFromIDList(P,C);
ShortcutPosition:=StrPas(C);
PostMessage(Handle, WM_USER + 1024, 0, 0);
if not Ch11.Checked then
if Application.MessageBox(PChar('Вы хотите разместить ярлык "' + TextName.Text + '" в папке Автозагрузки?'),
'Создание ярлыка',
Mb_IconQuestion + mb_YesNo) = IdYes then
ShortcutPosition:=ShortcutPosition+'\'+ TextName.Text + '.lnk';
if Ch11.Checked then
ShortcutPosition:=ShortcutPosition+'\'+ TextName.Text + '.lnk';
WShortcutPosition:=ShortcutPosition;
LinkFile.Save(PWChar(WShortcutPosition),False);
end;
end;

procedure TSetForm.tx6Click(Sender: TObject);
begin
ShellObject:=CreateComObject(CLSID_ShellLink);
LinkFile:=ShellObject as IPersistFile;
ShellLink:=ShellObject as IShellLink;
FileName:=ParamStr(0);
ShellLink.SetPath(pchar(FileName));
ShellLink.SetWorkingDirectory(pchar(ExtractFilePath(FileName)));
if SHGetSpecialFolderLocation(Handle,CSIDL_FAVORITES,P)=NOERROR then begin
SHGetPathFromIDList(P,C);
ShortcutPosition:=StrPas(C);
PostMessage(Handle, WM_USER + 1024, 0, 0);
if not Ch11.Checked then
if Application.MessageBox(PChar('Вы хотите разместить ярлык "' + TextName.Text + '" в Избранном?'),
'Создание ярлыка',
Mb_IconQuestion + mb_YesNo) = IdYes then
ShortcutPosition:=ShortcutPosition+'\'+ TextName.Text + '.lnk';
if Ch11.Checked then
ShortcutPosition:=ShortcutPosition+'\'+ TextName.Text + '.lnk';
WShortcutPosition:=ShortcutPosition;
LinkFile.Save(PWChar(WShortcutPosition),False);
end;
end;

procedure TSetForm.ChangeMessageBoxPosition(var Msg: TMessage);
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
x := SetForm.Left + ((SetForm.Width - w) div 2);
if x < 0 then
x := 0
else if x + w > Screen.Width then x := Screen.Width - w;
y := SetForm.Top + ((SetForm.Height - h) div 2);
if y < 0 then y := 0
else if y + h > Screen.Height then y := Screen.Height - h;
SetWindowPos(MBHWnd, 0, x, y, 0, 0, SWP_NOACTIVATE or SWP_NOSIZE or SWP_NOZORDER);
end;
end;

procedure TSetForm.WMMoving(var msg: TWMMoving);
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

procedure TSetForm.tx14Click(Sender: TObject);
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
if Application.MessageBox('Восстановить все настройки начертаний по умолчанию?',
'Адресная книга',
mb_IconQuestion + mb_YesNo) = idYes then
begin
ColorPickDlg1.ActiveColor := clBlack;
ColorPickDlg2.ActiveColor := clWhite;
FontsNameCombo.Text := 'Tahoma';
FontsSizeEdit.Value := 8;
StyleForm.ch1.Checked := False;
StyleForm.ch2.Checked := False;
StyleForm.ch3.Checked := False;
StyleForm.ch4.Checked := False;
StyleForm.ch5.Checked := True;
end;
end;

procedure TSetForm.FormDestroy(Sender: TObject);
begin
SM := GetSystemMenu(Handle, True);
SetForm.OnActivate := nil;
ColorPickDlg1.Free;
ColorPickDlg2.Free;
SettingsPages.Free;
ForwardTab.Free;
TabImages.Free;
TextName.Free;
StyleBt.Free;
BackTab.Free;
ch1.Free;
ch2.Free;
ch3.Free;
ch4.Free;
ch5.Free;
ch6.Free;
ch7.Free;
ch8.Free;
ch9.Free;
ch10.Free;
ch10.Free;
ch11.Free;
ch12.Free;
ch13.Free;
ch14.Free;
ch15.Free;
ch16.Free;
ch17.Free;
ch18.Free;
ch19.Free;
ch20.Free;
ch21.Free;
ch22.Free;
ch23.Free;
ch24.Free;
ch25.Free;
ch26.Free;
ch27.Free;
ch28.Free;
ch29.Free;
tx1.Free;
tx2.Free;
tx3.Free;
tx4.Free;
tx5.Free;
tx6.Free;
tx7.Free;
tx8.Free;
tx9.Free;
tx10.Free;
tx11.Free;
tx12.Free;
tx13.Free;
tx14.Free;
tx15.Free;
tx16.Free;
tx17.Free;
tx18.Free;
Ini.Free;
OK.Free;
end;

procedure TSetForm.StyleBtClick(Sender: TObject);
begin
StyleForm.Left := SetForm.Left + 25;
StyleForm.Top := SetForm.Top + 10;
StyleForm.ShowModal;
end;

procedure TSetForm.ch6Click(Sender: TObject);
begin
if ch6.Checked then
begin
if ch8.Checked then
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
Application.MessageBox('Настройка "Подтверждать выход" не будет работать!',
'Адресная книга',
mb_IconWarning + mb_OK);
end;
end;
end;

procedure TSetForm.tx17Click(Sender: TObject);
begin
TipForm.NextBt.tag:=3;
TipForm.Left := SetForm.Left + 25;
TipForm.Top := SetForm.Top + 10;
TipForm.ShowModal;
end;

procedure TSetForm.CMMouseLeave(var msg: TMessage);
begin
tx14.ForegroundColor := $00FF8000;
tx17.ForegroundColor := $00FF8000;
tx18.ForegroundColor := $00FF8000;
end;

procedure TSetForm.tx17MouseLeave(Sender: TObject);
begin
tx17.ForegroundColor := $00FF8000;
tx18.ForegroundColor := $00FF8000;
end;

procedure TSetForm.tx17MouseUp(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
tx17.ForegroundColor := $00FF8000;
tx18.ForegroundColor := $00FF8000;
end;

procedure TSetForm.tx17MouseMove(Sender: TObject; Shift: TShiftState; X,
Y: Integer);
begin
tx17.ForegroundColor := clRed;
tx18.ForegroundColor := clRed;
end;

procedure TSetForm.tx18MouseMove(Sender: TObject; Shift: TShiftState; X,
Y: Integer);
begin
tx17.ForegroundColor := clRed;
tx18.ForegroundColor := clRed;
end;

procedure TSetForm.tx18MouseUp(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
tx17.ForegroundColor := $00FF8000;
tx18.ForegroundColor := $00FF8000;
end;

procedure TSetForm.tx18MouseLeave(Sender: TObject);
begin
tx17.ForegroundColor := $00FF8000;
tx18.ForegroundColor := $00FF8000;
end;

procedure TSetForm.tx14MouseLeave(Sender: TObject);
begin
tx14.ForegroundColor := $00FF8000;
end;

procedure TSetForm.tx14MouseMove(Sender: TObject; Shift: TShiftState; X,
Y: Integer);
begin
tx14.ForegroundColor := clRed;
end;

procedure TSetForm.tx14MouseDown(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
tx14.ForegroundColor := $00FF8000;
end;

procedure TSetForm.tx14MouseUp(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
tx14.ForegroundColor := $00FF8000;
end;

procedure TSetForm.ForwardTabClick(Sender: TObject);
begin
if SettingsPages.ActivePageIndex >= 7 then
exit else
SettingsPages.ActivePageIndex := SettingsPages.ActivePageIndex + 1;
end;

procedure TSetForm.BackTabClick(Sender: TObject);
begin
if SettingsPages.ActivePageIndex <= 0 then
exit else
SettingsPages.ActivePageIndex := SettingsPages.ActivePageIndex - 1;
end;

procedure TSetForm.CancelClick(Sender: TObject);
begin
Ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
try
ch1.Checked := Ini.ReadBool('Position', 'Save window position', ch1.Checked);
ch2.Checked := Ini.ReadBool('Parameters', 'Double click in table', ch2.Checked);
ch3.Checked := Ini.ReadBool('Parameters', 'Context menu', ch3.Checked);
ch4.Checked := Ini.ReadBool('Parameters', 'Status bar show hint', ch4.Checked);
ch5.Checked := Ini.ReadBool('Parameters', 'Minimize to tray', ch5.Checked);
ch6.Checked := Ini.ReadBool('Parameters', 'Hide window to tray on exit', ch6.Checked);
ch7.Checked := Ini.ReadBool('Parameters', 'Use of XP menu', ch7.Checked);
ch8.Checked := Ini.ReadBool('Parameters', 'Confirm exit', ch8.Checked);
ch9.Checked := Ini.ReadBool('Parameters', 'Run with Windows OS startup', ch9.Checked);
ch10.Checked := Ini.ReadBool('Parameters', 'Run at full screen mode', ch10.Checked);
ch11.Checked := Ini.ReadBool('Parameters', 'Hide message on creating shortcut', ch11.Checked);
ch12.Checked := Ini.ReadBool('Parameters', 'Modal windows on Task Bar', ch12.Checked);
ch13.Checked := Ini.ReadBool('Parameters', 'Move on the client area', ch13.Checked);
ch14.Checked := Ini.ReadBool('Parameters', 'Screen snap', ch14.Checked);
ch15.Checked := Ini.ReadBool('Parameters', 'Window only in the client area', ch15.Checked);
ch16.Checked := Ini.ReadBool('Full Screen Mode', 'Hide tool bar', ch16.Checked);
ch17.Checked := Ini.ReadBool('Full Screen Mode', 'Hide status bar', ch17.Checked);
ch18.Checked := Ini.ReadBool('Full Screen Mode', 'Hide search bar', ch18.Checked);
ch19.Checked := Ini.ReadBool('On exit', 'Shutdown PC', ch19.Checked);
ch20.Checked := Ini.ReadBool('On exit', 'Confirm before shutdown PC', ch20.Checked);
ch21.Checked := Ini.ReadBool('On exit', 'Delete all records', ch21.Checked);
ch22.Checked := Ini.ReadBool('Parameters', 'Confirm on delete record', ch22.Checked);
ch23.Checked := Ini.ReadBool('Parameters', 'Anim main window', ch23.Checked);
ch24.Checked := Ini.ReadBool('Parameters', 'Invisible images on tabs', ch24.Checked);
ch25.Checked := Ini.ReadBool('Parameters', 'DblClk on tool bar', ch25.Checked);
ch26.Checked := Ini.ReadBool('Parameters', 'Use of drag mode records', ch26.Checked);
ch27.Checked := Ini.ReadBool('Parameters', 'Confirm on before add record', ch27.Checked);
ch28.Checked := Ini.ReadBool('Parameters', 'Key enter on record', ch28.Checked);
ch29.Checked := Ini.ReadBool('Parameters', 'Multiline tab', ch29.Checked);
ColorPickDlg1.ActiveColor := Ini.ReadInteger('Style', 'Records color', ColorPickDlg1.ActiveColor);
ColorPickDlg2.ActiveColor := Ini.ReadInteger('Style', 'Table color', ColorPickDlg2.ActiveColor);
FontsSizeEdit.Value := Ini.ReadInteger('On exit', 'Fonts size', FontsSizeEdit.Value);
except
end;
end;

procedure TSetForm.FormActivate(Sender: TObject);
begin
SM := GetSystemMenu(Handle, False);
DeleteMenu(SM, Sc_Restore, Mf_String);
DeleteMenu(SM, Sc_Size, Mf_String);
DeleteMenu(SM, Sc_Minimize, Mf_String);
DeleteMenu(SM, Sc_Maximize, Mf_String);
end;

end.
