program AddressBook;

uses
  Forms,
  NP in 'NP.pas' {MainForm},
  UP in 'UP.pas' {NoteForm},
  LP in 'LP.pas' {LicForm},
  AP in 'AP.pas' {AboutForm},
  SP in 'SP.pas' {SetForm},
  ATP in 'ATP.pas' {AttrForm},
  SPP in 'SPP.pas' {StyleForm},
  PRP in 'PRP.pas' {PrintForm},
  INP in 'INP.pas' {IntForm},
  SBP in 'SBP.pas' {StatusForm},
  TP in 'TP.pas' {TipForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Адресная книга';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.CreateForm(TNoteForm, NoteForm);
  Application.CreateForm(TLicForm, LicForm);
  Application.CreateForm(TSetForm, SetForm);
  Application.CreateForm(TAttrForm, AttrForm);
  Application.CreateForm(TStyleForm, StyleForm);
  Application.CreateForm(TPrintForm, PrintForm);
  Application.CreateForm(TIntForm, IntForm);
  Application.CreateForm(TStatusForm, StatusForm);
  Application.CreateForm(TTipForm, TipForm);
  Application.Run;
end.
