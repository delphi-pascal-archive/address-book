unit ATP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XPButton, XPCheckBox, XPGroupBox, ShellApi;

   type
   TWmMoving = record
   Msg: Cardinal;
   fwSide: Cardinal;
   lpRect: PRect;
   Result: Integer;
   end;

type
  TAttrForm = class(TForm)
    fr1: TXPGroupBox;
    PathNameEd: TEdit;
    PathEd: TEdit;
    DirParh: TEdit;
    fr2: TXPGroupBox;
    ChReadOnly: TXPCheckBox;
    ChArchive: TXPCheckBox;
    ChSystem: TXPCheckBox;
    ChHidden: TXPCheckBox;
    OK: TXPButton;
    Cancel: TXPButton;
    TypeEd: TEdit;
    SizeEd: TEdit;
    MoreInfo: TXPButton;
    procedure FormShow(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure MoreInfoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);

  private

    SM: HWND;
    
    procedure WMMoving(var msg: TWMMoving);
    message WM_MOVING;
    
  public

  end;

var
  AttrForm: TAttrForm;

implementation

uses SP;

{$R *.dfm}

procedure TAttrForm.FormShow(Sender: TObject);
begin
if SetForm.ch12.Checked then
begin
SetWindowLong(AttrForm.Handle, GWL_EXSTYLE,
GetWindowLOng(AttrForm.Handle, GWL_EXSTYLE) or WS_EX_APPWINDOW);
end;
end;

procedure TAttrForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
if SetForm.ch13.Checked then
begin
ReleaseCapture;
Perform(Wm_SysCommand, $f012, 0);
end;
end;

procedure TAttrForm.WMMoving(var msg: TWMMoving);
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

procedure ShowPropertiesDialog(FName: string);
var
SExInfo: TSHELLEXECUTEINFO;
begin
ZeroMemory(Addr(SExInfo),SizeOf(SExInfo));
SExInfo.cbSize := SizeOf(SExInfo);
SExInfo.lpFile := PChar(FName);
SExInfo.lpVerb := 'properties';
SExInfo.fMask  := SEE_MASK_INVOKEIDLIST;
ShellExecuteEx(Addr(SExInfo));
end;

procedure TAttrForm.FormKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
if Key = vk_Escape then
AttrForm.Close;
end;

procedure TAttrForm.FormDestroy(Sender: TObject);
begin
SM := GetSystemMenu(Handle, True);
AttrForm.OnActivate := nil;
PathNameEd.Free;
ChArchive.Free;
MoreInfo.Free;
ChHidden.Free;
ChSystem.Free;
DirParh.Free;
PathEd.Free;
Cancel.Free;
SizeEd.Free;
fr1.Free;
fr2.Free;
OK.Free;
end;

procedure TAttrForm.MoreInfoClick(Sender: TObject);
begin
ShowPropertiesDialog(ParamStr(0));
end;

procedure TAttrForm.FormActivate(Sender: TObject);
begin
SM := GetSystemMenu(Handle, False);
DeleteMenu(SM, Sc_Restore, Mf_String);
DeleteMenu(SM, Sc_Size, Mf_String);
DeleteMenu(SM, Sc_Minimize, Mf_String);
DeleteMenu(SM, Sc_Maximize, Mf_String);
end;

end.
