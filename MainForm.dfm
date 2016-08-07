object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Teste2 - Leitura porta serial com thread'
  ClientHeight = 486
  ClientWidth = 645
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lblMensagem: TLabel
    Left = 8
    Top = 8
    Width = 544
    Height = 38
    Caption = 
      'Informe todos os campos de configura'#231#245'es e pressione conectar...' +
      '. '#13#10'Aguarde o recebimento dos dados'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object grpConfiguracoes: TGroupBox
    Left = 8
    Top = 58
    Width = 185
    Height = 401
    Caption = 'Configura'#231#245'es'
    TabOrder = 0
    object lblPorta: TLabel
      Left = 20
      Top = 23
      Width = 31
      Height = 13
      Caption = 'Porta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblVelocidade: TLabel
      Left = 20
      Top = 79
      Width = 61
      Height = 13
      Caption = 'Velocidade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblBitDados: TLabel
      Left = 20
      Top = 135
      Width = 70
      Height = 13
      Caption = 'Bit de Dados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblParidade: TLabel
      Left = 20
      Top = 191
      Width = 50
      Height = 13
      Caption = 'Paridade'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblBitParada: TLabel
      Left = 20
      Top = 247
      Width = 75
      Height = 13
      Caption = 'Bit de Parada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbbPorta: TComboBox
      Left = 20
      Top = 42
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 0
      Text = 'COM1'
      Items.Strings = (
        'COM1'
        'COM2'
        'COM3'
        'COM4'
        'COM5'
        'COM6'
        'COM7'
        'COM8'
        'COM9')
    end
    object cbbVelocidade: TComboBox
      Left = 20
      Top = 98
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemIndex = 5
      TabOrder = 1
      Text = '9600'
      Items.Strings = (
        '300'
        '600'
        '1200'
        '2400'
        '4800'
        '9600'
        '14400'
        '19200'
        '38400'
        '56000'
        '57600'
        '115200'
        '128000'
        '230400'
        '256000'
        '460800'
        '921600')
    end
    object cbbBitDados: TComboBox
      Left = 20
      Top = 154
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemIndex = 3
      TabOrder = 2
      Text = '8'
      Items.Strings = (
        '5'
        '6'
        '7'
        '8')
    end
    object cbbParidade: TComboBox
      Left = 20
      Top = 210
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 3
      Text = 'Nenhum'
      Items.Strings = (
        'Nenhum'
        'Par'
        #205'mpar'
        'Marca'
        'Espa'#231'o')
    end
    object cbbBitParada: TComboBox
      Left = 20
      Top = 266
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 4
      Text = '1'
      Items.Strings = (
        '1'
        '1.5'
        '2')
    end
    object btnConectar: TBitBtn
      Left = 44
      Top = 303
      Width = 97
      Height = 33
      Caption = 'Conectar'
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 5
      OnClick = btnConectarClick
    end
    object btnDesconectar: TBitBtn
      Left = 44
      Top = 346
      Width = 97
      Height = 33
      Caption = '&Desconectar'
      Enabled = False
      NumGlyphs = 2
      TabOrder = 6
      OnClick = btnDesconectarClick
    end
  end
  object statMain: TStatusBar
    Left = 0
    Top = 467
    Width = 645
    Height = 19
    Panels = <
      item
        Text = 'Desconectado'
        Width = 50
      end>
  end
  object mmoMensagems: TMemo
    Left = 199
    Top = 64
    Width = 438
    Height = 395
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
  end
end
