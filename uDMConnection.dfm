object DMConnection: TDMConnection
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 211
  Width = 304
  object FDConnection: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=masterkey'
      'Port=3050'
      'CharacterSet=WIN1252'
      'Database=D:\Easy2Solutions\Gestao\Dados\Spader.FDB'
      'DriverID=FB')
    LoginPrompt = False
    Left = 32
    Top = 32
  end
end
