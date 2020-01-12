unit uSubstitui;

interface

uses
  uISubstitui;

type

  TSubstitui = class(TInterfacedObject, ISubstitui)
  public
    function Substituir(aStr, aVelho, aNovo: String): String;
  end;

implementation

function TSubstitui.Substituir(aStr, aVelho, aNovo: String): String;
var
  retorno, frase : String;  cont1, cont2, cont3, temp : integer;begin  retorno := '';  frase := aStr + '$';  cont1 := 1;  cont2 := 1;  repeat    if frase[cont1] = aVelho[cont2] then    begin      repeat        cont2 := cont2 + 1;        temp  := cont1 + 1;        if aVelho[cont2] = '' then        begin          retorno := retorno + aNovo;          cont1 := cont1 + cont2 - 2;          cont2 := 1;        end;        if frase[temp] = aVelho[cont2] then        begin          cont2 := cont2 + 1;        end        else        begin          for cont3 := 1 to temp - cont1 do          begin            retorno := retorno + frase[cont1];            cont1   := cont1 + 1;            cont2   := 1;          end;        end;      until cont2 = 1;    end    else    begin      retorno := retorno + frase[cont1];      cont1   := cont1 + 1;    end;  until (frase[cont1] = '$');  result := retorno;
end;
end.

