unit AP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Drawer, StdCtrls, XPButton, ComCtrls, ExtCtrls, XPLabel, ShellApi,
  Registry;
  
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
   TAboutForm = class(TForm)
    fr1: TPanel;
    Logo: TImage;
    tx1: TXPLabel;
    tx2: TXPLabel;
    tx5: TXPLabel;
    tx4: TXPLabel;
    tx3: TXPLabel;
    spr1: TBevel;
    spr2: TBevel;
    tx9: TXPLabel;
    License: TRichEdit;
    fr2: TPanel;
    Closed: TXPButton;
    SendMail: TEdit;
    Drawer: TDrawer;
    tx8: TXPLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure LogoClick(Sender: TObject);
    procedure tx8Click(Sender: TObject);
    procedure tx9Click(Sender: TObject);
    procedure SendMailClick(Sender: TObject);
    procedure ClosedClick(Sender: TObject);
    procedure tx9MouseMove(Sender: TObject; Shift: TShiftState; X,
    Y: Integer);
    procedure tx9MouseLeave(Sender: TObject);
    procedure tx9MouseUp(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure tx8MouseUp(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure tx8MouseLeave(Sender: TObject);
    procedure tx8MouseMove(Sender: TObject; Shift: TShiftState; X,
    Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private

    SM: HWND;

    r: TRegistry;

    MS: TMemoryStatus;

    procedure WMMoving(var msg: TWMMoving);
    message WM_MOVING;

    procedure wmNCLButtonDown(var Msg: TWMNCLButtonDown);
    message WM_NCLBUTTONDOWN;
    
    procedure wmNCLButtonUp(var Msg: TWMNCLButtonUp);
    message WM_NCLBUTTONUP;

    procedure CMMouseLeave(var msg: TMessage);
    message CM_MOUSELEAVE;

    procedure ChangeMessageBoxPosition(var Msg: TMessage);
    message AlignCenter;

  public

  end;

var
  AboutForm: TAboutForm;
  msgCaption: PChar;

implementation

uses SP;

{$R *.dfm}

procedure TAboutForm.FormActivate(Sender: TObject);
begin
SM := GetSystemMenu(Handle, False);
DeleteMenu(SM, Sc_Restore, Mf_String);
DeleteMenu(SM, Sc_Size, Mf_String);
DeleteMenu(SM, Sc_Minimize, Mf_String);
DeleteMenu(SM, Sc_Maximize, Mf_String);
end;

procedure TAboutForm.FormDestroy(Sender: TObject);
begin
AboutForm.OnActivate := nil;
SendMail.Free;
License.Free;
Drawer.Free;
Closed.Free;
Logo.Free;
spr1.Free;
spr2.Free;
fr1.Free;
fr2.Free;
tx1.Free;
tx2.Free;
tx3.Free;
tx4.Free;
tx5.Free;
tx8.Free;
tx9.Free;
end;

procedure TAboutForm.FormKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
if Key = vk_Escape then
AboutForm.Close;
end;

procedure TAboutForm.FormCreate(Sender: TObject);
begin
r:=TRegistry.Create;
r.RootKey:=HKEY_LOCAL_MACHINE;
r.OpenKey('\Software\Microsoft\Windows NT\CurrentVersion', True);
tx4.Caption := r.ReadString('ProductName');
GlobalMemoryStatus(MS);
tx5.Caption := 'Memory Available to Windows: ' + FormatFloat('#,###" KB"', MS.dwTotalPhys / 1024);
end;

procedure TAboutForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
if SetForm.ch13.Checked then
begin
ReleaseCapture;
Perform(Wm_SysCommand, $f012, 0);
end;
end;

procedure TAboutForm.LogoClick(Sender: TObject);
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
if Application.MessageBox(PChar(
'Copyright @2008 Домани Олег (aka ?КТО_Я?)' + #13 +
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

procedure TAboutForm.CMMouseLeave(var msg: TMessage);
begin
tx8.ForegroundColor := $00FF8000;
tx9.ForegroundColor := $00FF8000;
end;

procedure TAboutForm.wmNCLButtonDown(var Msg: TWMNCLButtonDown);
begin
if Msg.HitTest = HTHELP then
begin
Msg.Result := 0;
end else
inherited;
end;

procedure TAboutForm.wmNCLButtonUp(var Msg: TWMNCLButtonUp);
begin
try
if Msg.HitTest = HTHELP then
begin
Logo.OnClick(Self);
end
else
inherited;
except
end;
end;

procedure TAboutForm.tx8Click(Sender: TObject);
begin
ShellExecute(Handle,'open',
'mailto:GoodWinNix@mail.ru?Subject=Address Book Project'+
'',
'','',SW_SHOW);
end;

procedure TAboutForm.tx9Click(Sender: TObject);
begin
ShellExecute(Handle, nil, 'http://www.viacoding.mylivepage.ru/', nil,nil, Sw_ShowNormal);
end;

procedure TAboutForm.SendMailClick(Sender: TObject);
begin
Drawer.Open;
end;

procedure TAboutForm.ClosedClick(Sender: TObject);
begin
AboutForm.Close;
end;

procedure TAboutForm.tx9MouseMove(Sender: TObject; Shift: TShiftState; X,
Y: Integer);
begin
tx9.ForegroundColor := clRed;
end;

procedure TAboutForm.tx9MouseLeave(Sender: TObject);
begin
tx9.ForegroundColor := $00FF8000;
end;

procedure TAboutForm.tx9MouseUp(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
tx9.ForegroundColor := $00FF8000;
end;

procedure TAboutForm.tx8MouseUp(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
tx8.ForegroundColor := $00FF8000;
end;

procedure TAboutForm.tx8MouseLeave(Sender: TObject);
begin
tx8.ForegroundColor := $00FF8000;
end;

procedure TAboutForm.tx8MouseMove(Sender: TObject; Shift: TShiftState; X,
Y: Integer);
begin
tx8.ForegroundColor := clRed;
end;

procedure TAboutForm.ChangeMessageBoxPosition(var Msg: TMessage);
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
x := AboutForm.Left + ((AboutForm.Width - w) div 2);
if x < 0 then
x := 0
else if x + w > Screen.Width then x := Screen.Width - w;
y := AboutForm.Top + ((AboutForm.Height - h) div 2);
if y < 0 then y := 0
else if y + h > Screen.Height then y := Screen.Height - h;
SetWindowPos(MBHWnd, 0, x, y, 0, 0, SWP_NOACTIVATE or SWP_NOSIZE or SWP_NOZORDER);
end;
end;

procedure TAboutForm.FormShow(Sender: TObject);
begin
if SetForm.ch12.Checked then
begin
SetWindowLong(AboutForm.Handle, GWL_EXSTYLE,
GetWindowLOng(AboutForm.Handle, GWL_EXSTYLE) or WS_EX_APPWINDOW);
end;
end;

procedure TAboutForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Closed.SetFocus;
end;

procedure TAboutForm.WMMoving(var msg: TWMMoving);
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

end.
