unit uMaquina;

interface

uses
  uIMaquina, Classes, uTroco, SysUtils;

type

  TMaquina = class(TInterfacedObject, IMaquina)
  public
    function MontarTroco(aTroco: Double): TList;
  private
    function VerificaCedula(valor : Double): TCedula;
  end;

implementation

function TMaquina.VerificaCedula(valor: Double): TCedula;
var
  cash: TCedula;
begin
  if valor = 100 then
    cash := ceNota100
  else if valor = 50 then
    cash := ceNota50
  else if valor = 20 then
    cash := ceNota20
  else if valor = 10 then
    cash := ceNota10
  else if valor = 5 then
    cash :=  ceNota5
  else if valor = 2 then
    cash := ceNota2
  else if valor = 1 then
    cash := ceMoeda100
  else if valor = 0.5 then
    cash := ceMoeda50
  else if valor = 0.25 then
    cash := ceMoeda25
  else if valor = 0.1 then
    cash := ceMoeda10
  else if valor = 0.05 then
    cash := ceMoeda5
  else if valor = 0.01 then
    cash := ceMoeda1;

  result := cash;
end;

function TMaquina.MontarTroco(aTroco: Double): TList;
var
  cedula: Tcedula;
  retorno: TList;

  falta, valor: currency;
  numNotas: integer;
begin
  retorno := Tlist.Create;
  falta := aTroco;

  if falta >= 0 then
  begin
    for valor in CValorCedula do
    begin
      if falta <= 0 then
        break;

      numNotas := 0;
      if falta >= valor then
      begin
        cedula := VerificaCedula(valor); //Function para trazer a cedula.

        numNotas := trunc(falta / valor);
        falta := falta - Trunc(valor * 100) / 100 * numNotas;

        retorno.Add(Ttroco.Create(cedula,numNotas));
      end;
    end;
    Result := retorno;
  end
  else
    Result := nil;
end;
end.
