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
'Хочешь получить исходный код проекта "Адресная книга"?  ' +
'Легко, для этого нужно отправить на "GoodWinNix@mail.ru"  ' +
'или "viacoding@mail.ru" письмо с пометкой о высылке исходного кода.';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
1: begin
NextBt.tag:=2;
TipText.Clear;
TipText.Text :=
'Клавиша Escape при полноэкранном режиме действует как восстановление окна ' +
'в обычный режим, а при обычном режиме окна действует как выход из программы.';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
2: begin
NextBt.tag:=3;
TipText.Clear;
TipText.Text :=
'Если Вы не хотите, чтобы компьютер отключил питание (при установленной опции) ' +
'при закрытии адресной книги, то безопасным выходом в этом случае является контекстное ' +
'меню в системном лотке. Также при закрытии окна из системного лотка не будет выдан запрос ' +
'подтверждающий выход или произведена очистка всех записей в таблице. В некоторых случаях ' +
'это очень удобно.';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
3: begin
NextBt.tag:=4;
TipText.Clear;
TipText.Text :=
'В окне "Свойства..." можно просмотреть, а также изменить атрибуты адресной книги.';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
4: begin
NextBt.tag:=5;
TipText.Clear;
TipText.Text :=
'Если Вы хотите вывести данные адресата на печать из другой программы, то просто ' +
'скопируйте выделенную запись в буфер обмена, а затем вставьте ее в любом текстовом ' +
'редакторе.';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
5: begin
NextBt.tag:=6;
TipText.Clear;
TipText.Text :=
'Для того, чтобы отсортировать все записи в алфавитном порядке используйте горячую клавишу F5. ' +
'Также можете установить опцию "Менять позиции записей с помощью мыши", в этом случае ' +
'будет возможность перемещать записи в таблице с помощью механизма "Drag and Drop".';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
6: begin
NextBt.tag:=7;
TipText.Clear;
TipText.Text :=
'Со временем количество записей может стать очень много, для поиска нужной информации ' +
'используйте глобальный фильтр. Глобальный фильтр ищет текст в таблице записей по мере ' +
'набора.';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
7: begin
NextBt.tag:=8;
TipText.Clear;
TipText.Text :=
'Для того, чтобы сбросить все настройки в состояние по умолчанию, нужно выбрать из меню ' +
'"Инструменты" команду "Инициализация..." или осуществить все это дело горячими клавишами ' +
'Ctrl+F5.';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
8: begin
NextBt.tag:=9;
TipText.Clear;
TipText.Text :=
'Быстро найти запись по первым символам, входящим в заголовок, можно осуществить следующим ' +
'образом, установивите фокус ввода на таблице и наберите соответствующие символы ' +
'(например: VICTORIA - буква V или V+I).';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
9: begin
NextBt.tag:=10;
TipText.Clear;
TipText.Text :=
'Если считаете, что с текущей базой данных может что-либо случиться, то сделайте резервную копию ' +
'методом экспорта, выберите из меню "Адресная книга" команду "Экспорт..." ' +
'или нажмите горячие клавиши Ctrl+S. ' +
'';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
10: begin
NextBt.tag:=11;
TipText.Clear;
TipText.Text :=
'Все библиотеки стронних разработчиков использованные в программе несут в себе ' +
'только оформительный характер. При получении исходного кода адресной книги без архива с ' +
'компонентами сторонних фирм, Вы можете обойтись и стандартной библиотекой VCL Delphi. ' +
'Но в этом случае Вам придется корректировать исходник самостоятельно, к примеру, вместо ' +
'флажков-переключателей TXPCheckBox использовать стандартные компоненты TCheckBox.';
tx2.Caption := IntToStr(Nextbt.Tag) + '/12';
end;
11: begin
NextBt.tag:=12;
TipText.Clear;
TipText.Text :=
'Если Вы заметите какие - либо неточности или ошибки в этой программе, пожалуйста, сообщите ' +
'о них по адресу "GoodWinNix@mail.ru" или "viacoding@mail.ru", а также по ICQ: 461059698, и возможно в следующей версии ' +
'программы они будут устранены.';
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
