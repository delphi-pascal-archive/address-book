unit TP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPButton, ExtCtrls, XPLabel, StdCtrls, IniFiles, XPCheckBox;

type
  TTipForm = class(TForm)
    TipText: TMemo;
    fr2: TPanel;
    OK: TXPButton;
    NextBt: TXPButton;
    BackBt: TXPButton;
    logo2: TImage;
    Logo: TImage;
    tx1: TXPLabel;
    tx2: TXPLabel;
    ch1: TXPCheckBox;
    procedure BackBtClick(Sender: TObject);
    procedure NextBtClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private

    SM: HWND;

    Ini: TIniFile;

  public

  end;

var
  TipForm: TTipForm;

implementation

uses SP;

{$R *.dfm}

procedure TTipForm.BackBtClick(Sender: TObject);
begin
if NextBt.Tag <= 1 then
begin
NextBt.Tag := NextBt.Tag + 10;
NextBt.OnClick(Self);
end else
begin
NextBt.Tag := NextBt.Tag - 2;
NextBt.OnClick(Self);
end;
end;

procedure TTipForm.NextBtClick(Sender: TObject);
begin
case NextBt.tag of
0: begin
NextBt.tag:=1;
TipText.Clear;
TipText.Text :=
'������ �������� �������� ��� ������� "�������� �����"?  ' +
'�����, ��� ����� ����� ��������� �� "GoodWinNix@mail.ru"  ' +
'��� "viacoding@mail.ru" ������ � �������� � ������� ��������� ����.';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
1: begin
NextBt.tag:=2;
TipText.Clear;
TipText.Text :=
'������� Escape ��� ������������� ������ ��������� ��� �������������� ���� ' +
'� ������� �����, � ��� ������� ������ ���� ��������� ��� ����� �� ���������.';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
2: begin
NextBt.tag:=3;
TipText.Clear;
TipText.Text :=
'���� �� �� ������, ����� ��������� �������� ������� (��� ������������� �����) ' +
'��� �������� �������� �����, �� ���������� ������� � ���� ������ �������� ����������� ' +
'���� � ��������� �����. ����� ��� �������� ���� �� ���������� ����� �� ����� ����� ������ ' +
'�������������� ����� ��� ����������� ������� ���� ������� � �������. � ��������� ������� ' +
'��� ����� ������.';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
3: begin
NextBt.tag:=4;
TipText.Clear;
TipText.Text :=
'� ���� "��������..." ����� �����������, � ����� �������� �������� �������� �����.';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
4: begin
NextBt.tag:=5;
TipText.Clear;
TipText.Text :=
'���� �� ������ ������� ������ �������� �� ������ �� ������ ���������, �� ������ ' +
'���������� ���������� ������ � ����� ������, � ����� �������� �� � ����� ��������� ' +
'���������.';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
5: begin
NextBt.tag:=6;
TipText.Clear;
TipText.Text :=
'��� ����, ����� ������������� ��� ������ � ���������� ������� ����������� ������� ������� F5. ' +
'����� ������ ���������� ����� "������ ������� ������� � ������� ����", � ���� ������ ' +
'����� ����������� ���������� ������ � ������� � ������� ��������� "Drag and Drop".';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
6: begin
NextBt.tag:=7;
TipText.Clear;
TipText.Text :=
'�� �������� ���������� ������� ����� ����� ����� �����, ��� ������ ������ ���������� ' +
'����������� ���������� ������. ���������� ������ ���� ����� � ������� ������� �� ���� ' +
'������.';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
7: begin
NextBt.tag:=8;
TipText.Clear;
TipText.Text :=
'��� ����, ����� �������� ��� ��������� � ��������� �� ���������, ����� ������� �� ���� ' +
'"�����������" ������� "�������������..." ��� ����������� ��� ��� ���� �������� ��������� ' +
'Ctrl+F5.';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
8: begin
NextBt.tag:=9;
TipText.Clear;
TipText.Text :=
'������ ����� ������ �� ������ ��������, �������� � ���������, ����� ����������� ��������� ' +
'�������, ������������ ����� ����� �� ������� � �������� ��������������� ������� ' +
'(��������: VICTORIA - ����� V ��� V+I).';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
9: begin
NextBt.tag:=10;
TipText.Clear;
TipText.Text :=
'���� ��������, ��� � ������� ����� ������ ����� ���-���� ���������, �� �������� ��������� ����� ' +
'������� ��������, �������� �� ���� "�������� �����" ������� "�������..." ' +
'��� ������� ������� ������� Ctrl+S. ' +
'';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
10: begin
NextBt.tag:=11;
TipText.Clear;
TipText.Text :=
'��� ���������� �������� ������������� �������������� � ��������� ����� � ���� ' +
'������ ������������� ��������. ��� ��������� ��������� ���� �������� ����� ��� ������ � ' +
'������������ ��������� ����, �� ������ �������� � ����������� ����������� VCL Delphi. ' +
'�� � ���� ������ ��� �������� �������������� �������� ��������������, � �������, ������ ' +
'�������-�������������� TXPCheckBox ������������ ����������� ���������� TCheckBox.';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
11: begin
NextBt.tag:=12;
TipText.Clear;
TipText.Text :=
'���� �� �������� ����� - ���� ���������� ��� ������ � ���� ���������, ����������, �������� ' +
'� ��� �� ������ "GoodWinNix@mail.ru" ��� "viacoding@mail.ru", � ����� �� ICQ: 461059698, � �������� � ��������� ������ ' +
'��������� ��� ����� ���������.';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
12: begin
NextBt.tag:=0;
NextBt.OnClick(Self);
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
end;
TipText.SetFocus;
end;

procedure TTipForm.FormDestroy(Sender: TObject);
begin
SM := GetSystemMenu(Handle, True);
TipForm.OnActivate := nil;
TipText.Free;
BackBt.Free;
NextBt.Free;
Logo2.Free;
Logo.Free;
tx1.Free;
tx2.Free;
ch1.Free;
OK.Free;
end;

procedure TTipForm.FormShow(Sender: TObject);
begin
NextBt.Tag := NextBt.Tag - 1;
NextBt.OnClick(Self);
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
if SetForm.ch12.Checked then
begin
SetWindowLong(TipForm.Handle, GWL_EXSTYLE,
GetWindowLOng(TipForm.Handle, GWL_EXSTYLE) or WS_EX_APPWINDOW);
end;
end;

procedure TTipForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
if SetForm.ch13.Checked then
begin
ReleaseCapture;
Perform(Wm_SysCommand, $f012, 0);
end;
end;

procedure TTipForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
TipText.SetFocus;
end;

procedure TTipForm.OKClick(Sender: TObject);
begin
TipForm.Close;
end;

procedure TTipForm.FormKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
if Key = vk_Escape then
TipForm.Close;
end;

procedure TTipForm.FormCreate(Sender: TObject);
begin
Ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
try
NextBt.Tag := Ini.ReadInteger('Tip window', 'Tip position', NextBt.Tag);
ch1.Checked := Ini.ReadBool('License on start', 'Show', ch1.Checked);
except
end;
end;

procedure TTipForm.FormActivate(Sender: TObject);
begin
SM := GetSystemMenu(Handle, False);
DeleteMenu(SM, Sc_Restore, Mf_String);
DeleteMenu(SM, Sc_Size, Mf_String);
DeleteMenu(SM, Sc_Minimize, Mf_String);
DeleteMenu(SM, Sc_Maximize, Mf_String);
end;

end.
