unit INP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPCheckBox, XPGroupBox, XPButton, Registry, ExtCtrls;

type
  TIntForm = class(TForm)
    Cancel: TXPButton;
    OK: TXPButton;
    fr: TPanel;
    ch1: TXPCheckBox;
    ch2: TXPCheckBox;
    ch3: TXPCheckBox;
    ch4: TXPCheckBox;
    
    procedure FormShow(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure OKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private

    SM: HWND;

  public

  end;

var
  IntForm: TIntForm;

  Reg: TRegistry;

implementation

uses SP;

{$R *.dfm}

procedure TIntForm.FormShow(Sender: TObject);
begin
try
if SetForm.ch12.Checked then
begin
SetWindowLong(IntForm.Handle, GWL_EXSTYLE,
GetWindowLOng(IntForm.Handle, GWL_EXSTYLE) or WS_EX_APPWINDOW);
end;
Reg := TRegistry.Create;
with Reg do begin
RootKey := HKEY_LOCAL_MACHINE;
if not reg.KeyExists
('\Software\Microsoft\Internet Explorer\Extensions\{66C445BA-6A61-4427-8D66-4DAC3812E6DD}\') then
ch3.Checked := False else
ch3.Checked := True;
CloseKey;
Free;
end;
Reg := TRegistry.Create;
with Reg do begin
RootKey := HKEY_CLASSES_ROOT;
if not reg.KeyExists
('\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\Shell\Адресная книга\Command') then
ch2.Checked := False else
ch2.Checked := True;
CloseKey;
Free;
end;
Reg := TRegistry.Create;
with Reg do begin
RootKey := HKEY_CLASSES_ROOT;
if not reg.KeyExists
('\*\Shell\Address Book\Command\')then
ch1.Checked := False else
ch1.Checked := True;
CloseKey;
Free;
end;
Reg := TRegistry.Create;
with Reg do begin
RootKey := HKEY_CLASSES_ROOT;
if not reg.KeyExists
('\Directory\Shell\Address Book\Command\') then
ch4.Checked := False else
ch4.Checked := True;
CloseKey;
Free;
end;
except
end;
end;

procedure TIntForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
if SetForm.ch13.Checked then
begin
ReleaseCapture;
Perform(Wm_SysCommand, $f012, 0);
end;
end;

procedure TIntForm.FormKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
if Key = vk_Escape then
IntForm.Close;
end;

procedure TIntForm.FormDestroy(Sender: TObject);
begin
SM := GetSystemMenu(Handle, True);
IntForm.OnActivate := nil;
Cancel.Free;
OK.Free;
ch1.Free;
ch2.Free;
ch3.Free;
ch4.Free;
fr.Free;
end;

procedure TIntForm.FormActivate(Sender: TObject);
begin
SM := GetSystemMenu(Handle, False);
DeleteMenu(SM, Sc_Restore, Mf_String);
DeleteMenu(SM, Sc_Size, Mf_String);
DeleteMenu(SM, Sc_Minimize, Mf_String);
DeleteMenu(SM, Sc_Maximize, Mf_String);
end;

procedure TIntForm.OKClick(Sender: TObject);
const
TagID = '\{66C445BA-6A61-4427-8D66-4DAC3812E6DD}\';
var
ProgramPath: string;
RegKeyPath: string;
begin
try
if ch1.Checked then
begin
Reg:= TRegistry.Create;
Reg.RootKey := HKEY_CLASSES_ROOT;
Reg.OpenKey('*\Shell\Address Book',true);
Reg.WriteString('','MyPro');
Reg.WriteString('', 'Адресная книга');
Reg.CloseKey;
Reg.OpenKey('*\Shell\Address Book\command',true);
Reg.WriteString('','command');
Reg.WriteString('',paramstr(0)+' "1%"');
Reg.CloseKey;
Reg.Free;
end else
if not ch1.Checked then
begin
Reg:= TRegistry.Create;
Reg.RootKey := HKEY_CLASSES_ROOT;
Reg.DeleteKey('*\Shell\Address Book');
Reg.CloseKey;
Reg.Free;
end;

Reg:=TRegistry.Create;
Reg.RootKey:=HKEY_CLASSES_ROOT;
if Reg.OpenKey('\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\Shell\Адресная книга\Command', True) then
if ch2.Checked then
Reg.WriteString('', ParamStr(0)) else
Reg.DeleteKey('\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\Shell\Адресная книга');
Reg.CloseKey;
Reg.Free;


ProgramPath := Application.ExeName;
Reg := TRegistry.Create;
try
with Reg do begin
RootKey := HKEY_LOCAL_MACHINE;
RegKeyPath := 'Software\Microsoft\Internet Explorer\Extensions';
OpenKey(RegKeyPath + TagID, True);
WriteString('ButtonText', 'Адресная книга');
WriteString('MenuText', 'Адресная книга');
WriteString('MenuStatusBar', 'Адресная книга');
WriteString('ClSid', '{1FBA04EE-3024-11d2-8F1F-0000F87ABD16}');
WriteString('Default Visible', 'Yes');
WriteString('Exec', ProgramPath);
WriteString('HotIcon', ',4');
WriteString('Icon', ',5');
end
finally
if not ch3.Checked then
Reg.DeleteKey
('\Software\Microsoft\Internet Explorer\Extensions\{66C445BA-6A61-4427-8D66-4DAC3812E6DD}\');
Reg.CloseKey;
Reg.Free;
end;


if ch4.Checked then
begin
Reg:= TRegistry.Create;
Reg.RootKey := HKEY_CLASSES_ROOT;
Reg.OpenKey('\Directory\Shell\Address Book\',true);
Reg.WriteString('','MyPro');
Reg.WriteString('', 'Адресная книга');
Reg.CloseKey;
Reg.OpenKey('\Directory\Shell\Address Book\command',true);
Reg.WriteString('','command');
Reg.WriteString('',paramstr(0)+' "1%"');
Reg.CloseKey;
Reg.Free;
end else
if not ch4.Checked then
begin
Reg:= TRegistry.Create;
Reg.RootKey := HKEY_CLASSES_ROOT;
Reg.DeleteKey('\Directory\Shell\Address Book');
Reg.CloseKey;
Reg.Free;
end;
except
end;
end;

procedure TIntForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Cancel.SetFocus
end;

end.
