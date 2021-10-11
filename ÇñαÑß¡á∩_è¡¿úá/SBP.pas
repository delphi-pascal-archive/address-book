unit SBP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPButton, ExtCtrls, XPLabel, XPCheckBox, IniFiles;

type
  TStatusForm = class(TForm)
    ch1: TXPCheckBox;
    ch2: TXPCheckBox;
    ch3: TXPCheckBox;
    ch4: TXPCheckBox;
    tx1: TXPLabel;
    sp1: TBevel;
    Cancel: TXPButton;
    sp2: TBevel;
    OK: TXPButton;
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure CancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OKClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private

    SM: HWND;
    
    Ini: TIniFile;

  public

  end;

var
  StatusForm: TStatusForm;

implementation

uses SP;

{$R *.dfm}

procedure TStatusForm.FormDestroy(Sender: TObject);
begin
SM := GetSystemMenu(Handle, True);
StatusForm.OnActivate := nil;
Cancel.Free;
ch1.Free;
ch2.Free;
ch3.Free;
ch4.Free;
sp1.Free;
sp2.Free;
tx1.Free;
OK.Free;
end;

procedure TStatusForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Cancel.OnClick(Self);
Cancel.SetFocus;
end;

procedure TStatusForm.FormKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
if Key = vk_Escape then
StatusForm.Close;
end;

procedure TStatusForm.FormShow(Sender: TObject);
begin
if SetForm.ch12.Checked then
begin
SetWindowLong(StatusForm.Handle, GWL_EXSTYLE,
GetWindowLOng(StatusForm.Handle, GWL_EXSTYLE) or WS_EX_APPWINDOW);
end;
end;

procedure TStatusForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
if SetForm.ch13.Checked then
begin
ReleaseCapture;
Perform(Wm_SysCommand, $f012, 0);
end;
end;

procedure TStatusForm.CancelClick(Sender: TObject);
begin
Ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
try
ch1.Checked := Ini.ReadBool('Status bar', 'Total records', ch1.Checked);
ch2.Checked := Ini.ReadBool('Status bar', 'Current date', ch2.Checked);
ch3.Checked := Ini.ReadBool('Status bar', 'Current time', ch3.Checked);
ch4.Checked := Ini.ReadBool('Status bar', 'Current month\current day', ch4.Checked);
except
end;
end;

procedure TStatusForm.FormCreate(Sender: TObject);
begin
Ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
try
ch1.Checked := Ini.ReadBool('Status bar', 'Total records', ch1.Checked);
ch2.Checked := Ini.ReadBool('Status bar', 'Current date', ch2.Checked);
ch3.Checked := Ini.ReadBool('Status bar', 'Current time', ch3.Checked);
ch4.Checked := Ini.ReadBool('Status bar', 'Current month\current day', ch4.Checked);
except
end;
end;

procedure TStatusForm.OKClick(Sender: TObject);
begin
Ini.WriteBool('Status bar', 'Total records', ch1.Checked);
Ini.WriteBool('Status bar', 'Current date', ch2.Checked);
Ini.WriteBool('Status bar', 'Current time', ch3.Checked);
Ini.WriteBool('Status bar', 'Current month\current day', ch4.Checked);
end;

procedure TStatusForm.FormActivate(Sender: TObject);
begin
SM := GetSystemMenu(Handle, False);
DeleteMenu(SM, Sc_Restore, Mf_String);
DeleteMenu(SM, Sc_Size, Mf_String);
DeleteMenu(SM, Sc_Minimize, Mf_String);
DeleteMenu(SM, Sc_Maximize, Mf_String);
end;

end.
