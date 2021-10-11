unit UP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Spin, StdCtrls, ComCtrls, XPEdit, XPLabel, XPButton, Buttons,
  rmBaseEdit, rmBtnEdit, rmComboBox, rmCalendar, rmSpin, LbButton, ShellAPI,
  Registry, ImgList, ExtCtrls;

   type
    TTabSheet = class(ComCtrls.TTabSheet);

   const
    AlignCenter = Wm_User + 1024;
  
   type
    TWmMoving = record
    Msg: Cardinal;
    fwSide: Cardinal;
    lpRect: PRect;
    Result: Integer;
   end;

  type
   TNoteForm = class(TForm)
    NotePages: TPageControl;
    GeneralTab: TTabSheet;
    HouseTab: TTabSheet;
    WorkTab: TTabSheet;
    FamilyTab: TTabSheet;
    CommentTab: TTabSheet;
    tx1: TLabel;
    FirstUserName: TXPEdit;
    tx2: TLabel;
    MiddleUserName: TXPEdit;
    tx3: TLabel;
    LastUserName: TXPEdit;
    tx4: TLabel;
    FullUserName: TXPEdit;
    tx6: TLabel;
    UsersEMail: TXPEdit;
    tx7: TLabel;
    tx8: TLabel;
    UserCity: TXPEdit;
    tx9: TLabel;
    UserCountry: TXPEdit;
    tx10: TLabel;
    UserIndex: TXPEdit;
    tx11: TLabel;
    UserRegion: TXPEdit;
    UserPhone: TXPEdit;
    tx13: TLabel;
    UserFax: TXPEdit;
    tx14: TLabel;
    UserMobile: TXPEdit;
    tx15: TLabel;
    tx12: TLabel;
    UserWebAddress: TXPEdit;
    GoToSite: TXPButton;
    tx16: TLabel;
    UserCity2: TXPEdit;
    UserCountry2: TXPEdit;
    UserIndex2: TXPEdit;
    UserRegion2: TXPEdit;
    tx20: TLabel;
    tx19: TLabel;
    tx18: TLabel;
    tx17: TLabel;
    tx21: TLabel;
    tx22: TLabel;
    tx23: TLabel;
    UserPlace: TXPEdit;
    UserWorker: TXPEdit;
    UserOrganization: TXPEdit;
    tx24: TLabel;
    UserRoom: TXPEdit;
    tx25: TLabel;
    UserPhone2: TXPEdit;
    UserFax2: TXPEdit;
    tx26: TLabel;
    tx27: TLabel;
    UserMessanger: TXPEdit;
    tx29: TLabel;
    tx28: TLabel;
    SexBox: TrmNewComboBox;
    tx30: TLabel;
    tx31: TLabel;
    tx32: TLabel;
    tx33: TLabel;
    UserBride: TXPEdit;
    ViewTab: TTabSheet;
    tx34: TLabel;
    tx35: TLabel;
    tx36: TLabel;
    tx37: TLabel;
    UserColorHair: TXPEdit;
    UserColorEye: TXPEdit;
    UserHeight: TXPEdit;
    UserAgeBox: TrmSpinEdit;
    OK: TXPButton;
    Cancel: TXPButton;
    UserChildren: TrmNewComboBox;
    BirthBox: TDateTimePicker;
    YearBox: TDateTimePicker;
    tx5: TLabel;
    UserNickName: TXPEdit;
    tx38: TLabel;
    UserNationality: TXPEdit;
    StreetAddress: TXPEdit;
    StreetAddress2: TXPEdit;
    UserCommentText: TXPEdit;
    tx39: TLabel;
    TabImages: TImageList;
    BlanketName: TXPEdit;
    tx40: TLabel;
    procedure FirstUserNameChange(Sender: TObject);
    procedure MiddleUserNameChange(Sender: TObject);
    procedure LastUserNameChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GoToSiteClick(Sender: TObject);
    procedure CancelClick(Sender: TObject);
    procedure OKClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure FirstUserNameKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure UserWebAddressKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);

  private

    SM: HWND;

    FColor: TColor;

    procedure SetColor(Value: TColor);

    procedure WMEraseBkGnd(var Msg: TWMEraseBkGnd); 
    message WM_ERASEBKGND;

    procedure ChangeMessageBoxPosition(var Msg: TMessage);
    message AlignCenter;

    procedure wmNCLButtonDown(var Msg: TWMNCLButtonDown);
    message WM_NCLBUTTONDOWN;
    
    procedure wmNCLButtonUp(var Msg: TWMNCLButtonUp);
    message WM_NCLBUTTONUP;

    procedure WMMoving(var msg: TWMMoving);
    message WM_MOVING;
    
  public

    constructor Create(aOwner: TComponent); override;
    property Color: TColor read FColor write SetColor;

  end;

var
  NoteForm: TNoteForm;
  msgCaption: PChar;

implementation

uses NP, SP;

{$R *.dfm}

procedure TNoteForm.FirstUserNameChange(Sender: TObject);
begin
FullUserName.Text := FirstUserName.Text + ' ' + MiddleUserName.Text + ' ' + LastUserName.Text;
end;

procedure TNoteForm.MiddleUserNameChange(Sender: TObject);
begin
FullUserName.Text := FirstUserName.Text + ' ' + MiddleUserName.Text + ' ' + LastUserName.Text;
end;

procedure TNoteForm.LastUserNameChange(Sender: TObject);
begin
FullUserName.Text := FirstUserName.Text + ' ' + MiddleUserName.Text + ' ' + LastUserName.Text;
end;

procedure TNoteForm.FormShow(Sender: TObject);
begin
NotePages.ActivePageIndex := 0;
FullUserName.Text := FirstUserName.Text + ' ' + MiddleUserName.Text + ' ' + LastUserName.Text;
if SetForm.ch12.Checked then
begin
SetWindowLong(NoteForm.Handle, GWL_EXSTYLE,
GetWindowLOng(NoteForm.Handle, GWL_EXSTYLE) or WS_EX_APPWINDOW);
end;
if SexBox.ItemIndex = -1 then
begin
SexBox.ItemIndex := 0;
end;
if UserChildren.ItemIndex = -1 then
begin
UserChildren.ItemIndex := 0;
end;
if SetForm.ch24.Checked then
begin
GeneralTab.ImageIndex := 0;
HouseTab.ImageIndex := 1;
WorkTab.ImageIndex := 2;
FamilyTab.ImageIndex := 3;
ViewTab.ImageIndex := 4;
CommentTab.ImageIndex := 5;
end else
begin
GeneralTab.ImageIndex := -1;
HouseTab.ImageIndex := -1;
WorkTab.ImageIndex := -1;
FamilyTab.ImageIndex := -1;
ViewTab.ImageIndex := -1;
CommentTab.ImageIndex := -1;
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

procedure TNoteForm.GoToSiteClick(Sender: TObject);
begin
if UserWebAddress.Text = '' then
Exit else
OpenURL(UserWebAddress.Text);
end;

procedure TNoteForm.CancelClick(Sender: TObject);
begin
NoteForm.Close;
end;

procedure TNoteForm.OKClick(Sender: TObject);
begin
if FirstUserName.Text = '' then
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
Application.MessageBox('Введите имя пользователя.', 'Адресная книга',
mb_IconWarning + mb_OK);
NotePages.ActivePageIndex := 0;
FirstUserName.SetFocus;
Exit;
end;
if BlanketName.Text = '' then
begin
PostMessage(Handle, WM_USER + 1024, 0, 0);
Application.MessageBox('Введите имя бланка.', 'Адресная книга',
mb_IconWarning + mb_OK);
NotePages.ActivePageIndex := 0;
BlanketName.SetFocus;
end else
begin
NoteForm.Close;
MainForm.SaveItem.OnClick(Self);
end;
end;

procedure TNoteForm.FormActivate(Sender: TObject);
begin  
SM := GetSystemMenu(Handle, False);
DeleteMenu(SM, Sc_Restore, Mf_String);
DeleteMenu(SM, Sc_Size, Mf_String);
DeleteMenu(SM, Sc_Minimize, Mf_String);
DeleteMenu(SM, Sc_Maximize, Mf_String);
end;

procedure TNoteForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
if SetForm.ch13.Checked then
begin
ReleaseCapture;
Perform(Wm_SysCommand, $f012, 0);
end;
end;

procedure TNoteForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin  
NotePages.ActivePageIndex := 0;
FirstUserName.SetFocus;
end;

procedure TNoteForm.WMMoving(var msg: TWMMoving);
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

procedure TNoteForm.FormDestroy(Sender: TObject);
begin
NoteForm.OnActivate := nil;
UserOrganization.Free;
UserNationality.Free;
UserCommentText.Free;
MiddleUserName.Free;
UserWebAddress.Free;
StreetAddress2.Free;
UserColorHair.Free;
UserColorHair.Free;
StreetAddress.Free;
FirstUserName.Free;
UserMessanger.Free;
UserCountry2.Free;
LastUserName.Free;
UserColorEye.Free;
FullUserName.Free;
UserNickName.Free;
UserChildren.Free;
BlanketName.Free;
UserRegion2.Free;
UserCountry.Free;
UsersEMail.Free;
UserRegion.Free;
UserMobile.Free;
UserIndex2.Free;
UserWorker.Free;
UserPhone2.Free;
UserAgeBox.Free;
UserHeight.Free;
TabImages.Free;
UserIndex.Free;
UserPhone.Free;
UserCity2.Free;
UserBride.Free;
UserPlace.Free;
UserRoom.Free;
BirthBox.Free;
UserFax2.Free;
UserCity.Free;
GoToSite.Free;
YearBox.Free;
UserFax.Free;
SexBox.Free;
Cancel.Free;
OK.Free;
end;

procedure TNoteForm.ChangeMessageBoxPosition(var Msg: TMessage);
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
x := NoteForm.Left + ((NoteForm.Width - w) div 2);
if x < 0 then
x := 0
else if x + w > Screen.Width then x := Screen.Width - w;
y := NoteForm.Top + ((NoteForm.Height - h) div 2);
if y < 0 then y := 0
else if y + h > Screen.Height then y := Screen.Height - h;
SetWindowPos(MBHWnd, 0, x, y, 0, 0, SWP_NOACTIVATE or SWP_NOSIZE or SWP_NOZORDER);
end;
end;

procedure TNoteForm.wmNCLButtonDown(var Msg: TWMNCLButtonDown);
begin
if Msg.HitTest = HTHELP then
begin
Msg.Result := 0;
end else
inherited;
end;

procedure TNoteForm.wmNCLButtonUp(var Msg: TWMNCLButtonUp);
begin
if Msg.HitTest = HTHELP then
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
end
else
inherited;
end;

constructor TNoteForm.Create(aOwner: TComponent);
begin
inherited;
FColor := $00FFE7CE;
end;

procedure TNoteForm.SetColor(Value: TColor);
begin
if FColor = Value then
begin
FColor := Value;
Invalidate;
end;
end;

procedure TNoteForm.WMEraseBkGnd(var Msg: TWMEraseBkGnd);
begin
if FColor = clBtnFace then
inherited else
begin
Brush.Color := FColor;
Windows.FillRect(Msg.dc, ClientRect, Brush.Handle);
Msg.Result := 1;
end;
end;

procedure TNoteForm.FormKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
if Key = vk_Escape then
NoteForm.Close;
end;

procedure TNoteForm.FirstUserNameKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
if Key = vk_Escape then
NoteForm.Close;
if Key = vk_Return then
OK.OnClick(Self);
end;

procedure TNoteForm.UserWebAddressKeyDown(Sender: TObject; var Key: Word;
Shift: TShiftState);
begin
if Key = vk_Escape then
NoteForm.Close;
if Key = vk_Return then
GoToSite.OnClick(Self);
end;

end.
