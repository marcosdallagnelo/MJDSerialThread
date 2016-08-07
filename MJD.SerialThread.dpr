program MJD.SerialThread;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {frmMain},
  blcksock in 'synapse40\source\lib\blcksock.pas',
  clamsend in 'synapse40\source\lib\clamsend.pas',
  dnssend in 'synapse40\source\lib\dnssend.pas',
  ftpsend in 'synapse40\source\lib\ftpsend.pas',
  ftptsend in 'synapse40\source\lib\ftptsend.pas',
  httpsend in 'synapse40\source\lib\httpsend.pas',
  imapsend in 'synapse40\source\lib\imapsend.pas',
  ldapsend in 'synapse40\source\lib\ldapsend.pas',
  mimeinln in 'synapse40\source\lib\mimeinln.pas',
  mimemess in 'synapse40\source\lib\mimemess.pas',
  mimepart in 'synapse40\source\lib\mimepart.pas',
  nntpsend in 'synapse40\source\lib\nntpsend.pas',
  pingsend in 'synapse40\source\lib\pingsend.pas',
  pop3send in 'synapse40\source\lib\pop3send.pas',
  slogsend in 'synapse40\source\lib\slogsend.pas',
  smtpsend in 'synapse40\source\lib\smtpsend.pas',
  snmpsend in 'synapse40\source\lib\snmpsend.pas',
  sntpsend in 'synapse40\source\lib\sntpsend.pas',
  ssl_openssl in 'synapse40\source\lib\ssl_openssl.pas',
  ssl_openssl_lib in 'synapse40\source\lib\ssl_openssl_lib.pas',
  synachar in 'synapse40\source\lib\synachar.pas',
  synacode in 'synapse40\source\lib\synacode.pas',
  synacrypt in 'synapse40\source\lib\synacrypt.pas',
  synadbg in 'synapse40\source\lib\synadbg.pas',
  synafpc in 'synapse40\source\lib\synafpc.pas',
  synaicnv in 'synapse40\source\lib\synaicnv.pas',
  synaip in 'synapse40\source\lib\synaip.pas',
  synamisc in 'synapse40\source\lib\synamisc.pas',
  synaser in 'synapse40\source\lib\synaser.pas',
  synautil in 'synapse40\source\lib\synautil.pas',
  synsock in 'synapse40\source\lib\synsock.pas',
  tlntsend in 'synapse40\source\lib\tlntsend.pas',
  uLeituraSerialThread in 'uLeituraSerialThread.pas',
  asn1util in 'synapse40\source\lib\asn1util.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
