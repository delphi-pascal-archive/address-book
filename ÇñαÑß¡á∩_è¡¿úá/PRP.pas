unit PRP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, ComCtrls, Printers, ActnList, StdActns;

  function OpenSaveFileDialog(ParentHandle: THandle; const DefExt, Filter, InitialDir,
  Title: string; var FileName: string; IsOpenDialog: Boolean): Boolean;

type
  TPrintForm = class(TForm)
    MainMenu: TMainMenu;
    FileItem: TMenuItem;
    QuickPrintItem: TMenuItem;
    PrintItem: TMenuItem;
    sp1: TMenuItem;
    SaveAsItem: TMenuItem;
    sp2: TMenuItem;
    QuitItem: TMenuItem;
    FontItem: TMenuItem;
    StatusBar: TStatusBar;
    FullScreenItem: TMenuItem;
    ToolsItem: TMenuItem;
    sp4: TMenuItem;
    PrintDlg: TPrintDialog;
    PrintDates: TRichEdit;
    FontDlg: TFontDialog;
    ActionList: TActionList;
    EditCut: TEditCut;
    EditCopy: TEditCopy;
    EditPaste: TEditPaste;
    EditSelectAll: TEditSelectAll;
    EditUndo: TEditUndo;
    EditDelete: TEditDelete;
    EditItem: TMenuItem;
    Copytem: TMenuItem;
    Cuttem: TMenuItem;
    Deltem: TMenuItem;
    Pastetem: TMenuItem;
    SelectAlltem: TMenuItem;
    Undotem: TMenuItem;
    Cleartem: TMenuItem;
    sp5: TMenuItem;
    sp6: TMenuItem;
    PrintTextMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    s1: TMenuItem;
    s2: TMenuItem;
    s3: TMenuItem;
    s4: TMenuItem;
    s5: TMenuItem;
    s6: TMenuItem;
    s7: TMenuItem;
    s8: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    procedure SaveAsItemClick(Sender: TObject);
    procedure QuitItemClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
    procedure FullScreenItemClick(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
    procedure QuickPrintItemClick(Sender: TObject);
    procedure PrintItemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FontItemClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CleartemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private

    procedure WMGetMinMaxInfo(var msg: TWMGetMinMaxInfo);
    message WM_GETMINMAXINFO;

  public

  end;

var
  PrintForm: TPrintForm;

implementation

uses SP;

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

procedure TPrintForm.SaveAsItemClick(Sender: TObject);
var
s: String;
begin
try
if OpenSaveFileDialog(PrintForm.Handle, '*.txt', 'Normal text files (*.txt)|*.txt|',
ParamStr(0), 'Сохранить', s, False) then
begin
if FileExists(s) then
if Application.MessageBox(PChar('Файл "' + s +
'" уже существует.' +
#13 + 'Заменить его?'),
'Замена файла', MB_ICONQUESTION + mb_YesNo)
<> idYes then
begin
end else
begin
PrintDates.Lines.SaveToFile(s);
end;
if not FileExists(s) then
begin
PrintDates.Lines.SaveToFile(s);
end;
end;
except
end;
end;

procedure TPrintForm.QuitItemClick(Sender: TObject);
begin
PrintForm.Close;
end;

procedure TPrintForm.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TPrintForm.FullScreenItemClick(Sender: TObject);
begin
PrintForm.ScreenSnap := False;
FullScreen := not FullScreen;
if FullScreen then begin
FullScreenItem.Checked := True;
Rect := BoundsRect;
SetBounds( Left - ClientOrigin.X,
Top - ClientOrigin.Y, GetDeviceCaps( Canvas.handle,
HORZRES )
+ (Width - ClientWidth), GetDeviceCaps( Canvas.handle,
VERTRES )
+ (Height - ClientHeight ));
end else
begin
FullScreenItem.Checked := False;
BoundsRect := Rect;
if SetForm.Ch14.Checked then
PrintForm.ScreenSnap := True else
PrintForm.ScreenSnap := False;
end;
end;

procedure TPrintForm.WMGetMinMaxInfo(var msg: TWMGetMinMaxInfo);
begin
inherited;
with msg.MinMaxInfo^.ptMaxTrackSize do begin
X := GetDeviceCaps( Canvas.handle, HORZRES ) +
(Width - ClientWidth);
Y := GetDeviceCaps( Canvas.handle, VERTRES ) +
(Height - ClientHeight );
end;
end;

procedure TPrintForm.FormMouseDown(Sender: TObject; Button: TMouseButton;
Shift: TShiftState; X, Y: Integer);
begin
if SetForm.ch13.Checked then
begin
ReleaseCapture;
Perform(Wm_SysCommand, $f012, 0);
end;
end;

procedure TPrintForm.QuickPrintItemClick(Sender: TObject);
begin
PrintStrings(PrintDates.Lines);
end;

procedure TPrintForm.PrintItemClick(Sender: TObject);
var
s: String;
begin
if PrintDlg.Execute then
PrintDates.Print(s);
end;

procedure TPrintForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
try
if FullScreenItem.Checked = True then
begin
PrintForm.Hide;
FullScreenItem.Click;
end;
PrintForm.Hide;
ClientHeight := 350;
ClientWidth := 516;
except
end;
end;

procedure TPrintForm.FontItemClick(Sender: TObject);
begin
FontDlg.Font := PrintDates.Font;
if FontDlg.Execute then
PrintDates.Font.Assign(FontDlg.Font);
end;

procedure TPrintForm.FormDestroy(Sender: TObject);
begin
PrintForm.OnActivate := nil;
PrintTextMenu.Free;
ActionList.Free;
PrintDates.Free;
StatusBar.Free;
PrintDlg.Free;
MainMenu.Free;
FontDlg.Free;
end;

procedure TPrintForm.CleartemClick(Sender: TObject);
begin
PrintDates.Lines.Clear;
end;

procedure TPrintForm.FormShow(Sender: TObject);
begin
if SetForm.ch12.Checked then
begin
SetWindowLong(PrintForm.Handle, GWL_EXSTYLE,
GetWindowLOng(PrintForm.Handle, GWL_EXSTYLE) or WS_EX_APPWINDOW);
end;
end;

end.
