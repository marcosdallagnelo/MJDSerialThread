unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,
  uLeituraSerialThread;

type
  TfrmMain = class(TForm)
    grpConfiguracoes: TGroupBox;
    lblPorta: TLabel;
    cbbPorta: TComboBox;
    lblVelocidade: TLabel;
    cbbVelocidade: TComboBox;
    lblBitDados: TLabel;
    cbbBitDados: TComboBox;
    lblParidade: TLabel;
    cbbParidade: TComboBox;
    lblBitParada: TLabel;
    cbbBitParada: TComboBox;
    statMain: TStatusBar;
    btnConectar: TBitBtn;
    btnDesconectar: TBitBtn;
    lblMensagem: TLabel;
    mmoMensagems: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConectarClick(Sender: TObject);
    procedure btnDesconectarClick(Sender: TObject);
  private
    LeituraSerial: TLeituraSerialThread;

    function GetVelocidade: Integer;
    function GetData: Integer;
    function GetParidade: Char;
    function GetParada: Integer;
    function GetSerialConfig: TSerialConfig;
    procedure SetupInicial;
  public
    procedure RecebeLeitura(Sender: TObject; Msg: string);
    procedure RecebeErro(Sender: TObject; MsgErro: string);

    property Velocidade: Integer read GetVelocidade;
    property Data: Integer read GetData;
    property Paridade: Char read GetParidade;
    property Parada: Integer read GetParada;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

const
  STR_CONECTADO = 'Conectado';
  STR_DESCONECTADO = 'Desconectado';

procedure TfrmMain.btnConectarClick(Sender: TObject);
var Recebido: string;
begin
  btnConectar.Enabled := False;
  statMain.Panels[0].Text := STR_CONECTADO;
  mmoMensagems.Clear();

  LeituraSerial := TLeituraSerialThread.Create(True, GetSerialConfig());
  LeituraSerial.OnLeitura := RecebeLeitura;
  LeituraSerial.OnErro := RecebeErro;
  LeituraSerial.FreeOnTerminate := True;
  LeituraSerial.Start();

  btnDesconectar.Enabled := True;
end;

procedure TfrmMain.btnDesconectarClick(Sender: TObject);
begin
  SetupInicial();
  LeituraSerial.Terminate();
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (btnDesconectar.Enabled) then
    btnDesconectarClick(btnDesconectar);

  Action := caFree;
end;

function TfrmMain.GetVelocidade: Integer;
begin
  try
    Result := StrToInt(cbbVelocidade.Text);
  except
    Result := 9600;
  end;
end;

procedure TfrmMain.RecebeErro(Sender: TObject; MsgErro: string);
begin
  LeituraSerial.Terminate();
  ShowMessage(MsgErro);
  SetupInicial();
end;

procedure TfrmMain.SetupInicial;
begin
  btnConectar.Enabled := True;
  btnDesconectar.Enabled := False;
  statMain.Panels[0].Text := STR_DESCONECTADO;
end;

procedure TfrmMain.RecebeLeitura(Sender: TObject; Msg: string);
begin
  mmoMensagems.Lines.Add(Msg);
end;

function TfrmMain.GetData: Integer;
begin
  try
    Result := StrToInt(cbbBitDados.Text);
  except
    Result := 8;
  end;
end;

function TfrmMain.GetParada: Integer;
begin
  Result := cbbBitParada.ItemIndex;
end;

function TfrmMain.GetParidade: Char;
begin
  case cbbParidade.ItemIndex of
    1: Result := 'O';
    2: Result := 'E';
    3: Result := 'M';
    4: Result := 'S';
  else
    Result := 'N';
  end;
end;

function TfrmMain.GetSerialConfig: TSerialConfig;
var Config: TSerialConfig;
begin
  Config.Porta := cbbPorta.Text;
  Config.Velocidade := Velocidade;
  Config.Data := Data;
  Config.Paridade := Paridade;
  Config.Parada := Parada;

  Result := Config;
end;

end.
