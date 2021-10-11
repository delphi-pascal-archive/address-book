unit SPP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPRadioButton, XPCheckBox, XPButton, ExtCtrls, StdCtrls, IniFiles;

type
  TStyleForm = class(TForm)
    ch2: TXPCheckBox;
    ch5: TXPRadioButton;
    ch3: TXPRadioButton;
    ch4: TXPRadioButton;
    ch1: TXPCheckBox;
    Cancel: TXPButton;
    sp1: TBevel;
    OK: TXPButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure CancelClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure OKClick(Sender: TObject);

  private

    Ini: TIniFile;

    SM: HWND;

  public

  end;

var
  StyleForm: TStyleForm;

implementation

uses SP, NP;

{$R *.dfm}

procedure TStyleForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
try
Cancel.OnClick(Self);
Cancel.SetFocus;
except
end;
end;

procedure TStyleForm.FormKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
if Key = vk_Escape then
StyleForm.Close;
end;

procedure TStyleForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
if SetForm.ch13.Checked then
begin
ReleaseCapture;
Perform(Wm_SysCommand, $f012, 0);
end;
end;

procedure TStyleForm.FormShow(Sender: TObject);
begin
if MainForm.RecordsList.Font.Style = [fsUnderline] then
StyleForm.ch1.Checked := True;
if MainForm.RecordsList.Font.Style = [fsStrikeOut] then
StyleForm.ch2.Checked := True;
if MainForm.RecordsList.Font.Style = [fsBold] then
StyleForm.ch3.Checked := True;
if MainForm.RecordsList.Font.Style = [fsItalic] then
StyleForm.ch4.Checked := True;
if MainForm.RecordsList.Font.Style = [] then
StyleForm.ch5.Checked := True;
if SetForm.ch12.Checked then
begin
SetWindowLong(StyleForm.Handle, GWL_EXSTYLE,
GetWindowLOng(StyleForm.Handle, GWL_EXSTYLE) or WS_EX_APPWINDOW);
end;
end;

procedure TStyleForm.CancelClick(Sender: TObject);
begin
Ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
try
ch1.Checked := Ini.ReadBool('Fonts settings', 'Underline', ch1.Checked);
ch2.Checked := Ini.ReadBool('Fonts settings', 'Strikeout', ch2.Checked);
ch3.Checked := Ini.ReadBool('Fonts settings', 'Bold', ch3.Checked);
ch4.Checked := Ini.ReadBool('Fonts settings', 'Italic', ch4.Checked);
ch5.Checked := Ini.ReadBool('Fonts settings', 'Def', ch5.Checked);
except
end;
end;

procedure TStyleForm.FormDestroy(Sender: TObject);
begin
SM := GetSystemMenu(Handle, True);
StyleForm.OnActivate := nil;
Cancel.Free;
ch1.Free;
ch2.Free;
ch3.Free;
ch4.Free;
ch5.Free;
sp1.Free;
OK.Free;
end;

procedure TStyleForm.FormCreate(Sender: TObject);
begin
Ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
try
ch1.Checked := Ini.ReadBool('Fonts settings', 'Underline', ch1.Checked);
ch2.Checked := Ini.ReadBool('Fonts settings', 'Strikeout', ch2.Checked);
ch3.Checked := Ini.ReadBool('Fonts settings', 'Bold', ch3.Checked);
ch4.Checked := Ini.ReadBool('Fonts settings', 'Italic', ch4.Checked);
ch5.Checked := Ini.ReadBool('Fonts settings', 'Def', ch5.Checked);
except
end;
end;

procedure TStyleForm.FormActivate(Sender: TObject);
begin
SM := GetSystemMenu(Handle, False);
DeleteMenu(SM, Sc_Restore, Mf_String);
DeleteMenu(SM, Sc_Size, Mf_String);
DeleteMenu(SM, Sc_Minimize, Mf_String);
DeleteMenu(SM, Sc_Maximize, Mf_String);
end;

procedure TStyleForm.OKClick(Sender: TObject);
begin
Ini.WriteBool('Fonts settings', 'Underline', ch1.Checked);
Ini.WriteBool('Fonts settings', 'Strikeout', ch2.Checked);
Ini.WriteBool('Fonts settings', 'Bold', ch3.Checked);
Ini.WriteBool('Fonts settings', 'Italic', ch4.Checked);
Ini.WriteBool('Fonts settings', 'Def', ch5.Checked);
end;

end.
