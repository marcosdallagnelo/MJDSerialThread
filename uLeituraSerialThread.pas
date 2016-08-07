unit uLeituraSerialThread;

interface

uses classes, SysUtils, synaser, Dialogs;

type
  TSerialConfig = record
    Porta: string;
    Velocidade: Integer;
    Data: Integer;
    Paridade: Char;
    Parada: Integer;
  end;

  TLeitura = procedure(Sender: TObject; Msg: string) of object;
  TErro = procedure(Sender: TObject; MsgErro: string) of object;

  TLeituraSerialThread = class(TThread)
  private
    StrRecebido: string;
    MensagemErro: String;
    Serial : TBlockSerial;
    FLeitura: TLeitura;
    FErro: TErro;
    FSerialConfig: TSerialConfig;
    function ConectarSerial: Boolean;
    procedure DesconectarSerial;
    procedure ConfiguraPortaSerial;
  protected
    procedure Execute; override;

    procedure DoExecuteLeitura(Str: string);
    procedure ExecuteLeitura;

    procedure DoExecuteErro(Msg: string);
    procedure ExecuteErro;
  public
    constructor Create(const CreateSuspended: boolean; Config: TSerialConfig);
    destructor Destroy; override;

    property SerialConfig: TSerialConfig read FSerialConfig;
    property OnLeitura: TLeitura read FLeitura write FLeitura;
    property OnErro: TErro read FErro write FErro;
  end;

implementation

{ TLeituraSerialThread }

function TLeituraSerialThread.ConectarSerial: Boolean;
begin
  Result := True;
  try
    Serial.CloseSocket ;
    Serial.DeadlockTimeout := 3000;
    Serial.Connect(SerialConfig.Porta);
    ConfiguraPortaSerial();
    Serial.Purge();
  except
    on E: ESynaSerError do
    begin
      try
         Serial.RaiseExcept := false ;
         Serial.CloseSocket ;
      finally
         Serial.RaiseExcept := true ;
      end ;

      DoExecuteErro(E.ErrorMessage);
      Result := False;
    end;
    on E: Exception do
    begin
      DoExecuteErro(E.Message);
      Result := False;
    end;
  end ;
end;

procedure TLeituraSerialThread.ConfiguraPortaSerial;
begin
  if not Serial.InstanceActive then exit;

  Serial.Config( SerialConfig.Velocidade, SerialConfig.Data, SerialConfig.Paridade, SerialConfig.Parada, False, False);
  Serial.RTS := False;
  Serial.DTR := False;
end;

constructor TLeituraSerialThread.Create(const CreateSuspended: boolean; Config: TSerialConfig);
begin
  FSerialConfig := Config;

  Serial := TBlockSerial.Create;
  Serial.RaiseExcept := True;

  inherited Create(CreateSuspended);
end;

procedure TLeituraSerialThread.DesconectarSerial;
begin
  try
    Serial.RaiseExcept := false;
    Serial.CloseSocket;
  finally
    Serial.RaiseExcept := true;
  end;
end;

destructor TLeituraSerialThread.Destroy;
begin
  Serial.Free;
  inherited;
end;

procedure TLeituraSerialThread.DoExecuteLeitura(Str: string);
begin
  StrRecebido := Str;
  Synchronize(ExecuteLeitura);
end;

procedure TLeituraSerialThread.DoExecuteErro(Msg: string);
begin
  MensagemErro := Msg;
  Synchronize(ExecuteErro);
end;

procedure TLeituraSerialThread.Execute;
begin
  if ConectarSerial() then
  begin
    while not Self.Terminated do
    begin
      if (Serial.CanRead(1000)) then
      begin
        DoExecuteLeitura(Serial.Recvstring(1000));
      end;
    end;
  end;

  DesconectarSerial();
end;

procedure TLeituraSerialThread.ExecuteLeitura;
begin
  if (StrRecebido <> '') then
    if (Assigned(FLeitura)) then
      FLeitura(Self, StrRecebido);
end;

procedure TLeituraSerialThread.ExecuteErro;
begin
  if (MensagemErro <> '') then
    if (Assigned(FErro)) then
      FErro(Self, MensagemErro);
end;

end.
