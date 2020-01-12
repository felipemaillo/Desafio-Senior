unit uComponente;

interface

type

  TComponente = class;

  TComponenteArray = array of TComponente;

  TComponente = class
  private
    FX: Integer;
    FY: Integer;
    FAltura: Integer;
    FLargura: Integer;
    FComponentes: TComponenteArray;
	//-----
    procedure setarAltura(const tamAltura: Integer);
    procedure setarLargura(const tamLargura: Integer);

    procedure setarX(const posX: Integer);
    procedure setarY(const posY: Integer);
	//-----
  public
    procedure AdicionaComponente(aComponente: TComponente); virtual;
    procedure RemoveComponente(aComponente: TComponente); virtual;
	//-----
    property Altura : Integer read FAltura write setarAltura;
    property Largura : Integer read FLargura write setarLargura;
    property Componentes: TComponenteArray read FComponentes write FComponentes;
    property X : Integer read FX write setarX;
    property Y : Integer read FY write setarY;
    procedure AlteraTamanho(posX, posY : integer; tamAltura, tamLargura : real); virtual; Abstract;
	//-----
  end;

implementation

//sets
procedure TComponente.setarAltura(const tamAltura: Integer);
begin
  FAltura := tamAltura;
end;

procedure TComponente.setarLargura(const tamLargura: Integer);
begin
  FLargura := tamLargura;
end;

procedure TComponente.setarX(const posX: Integer);
begin
  FX := posX;
end;

procedure TComponente.setarY(const posY: Integer);
begin
  FY := posY;
end;
//-----

procedure TComponente.AdicionaComponente(aComponente: TComponente);
begin
  SetLength(Fcomponentes, length(Fcomponentes) + 1);
  Fcomponentes[length(Fcomponentes) - 1] := aComponente
end;

procedure TComponente.RemoveComponente(aComponente: TComponente);
var
  achou : boolean;
  cont1 : integer;
begin
  achou := false;
  cont1 := 0;

  if Length(Fcomponentes) <> 0 then
  begin
    repeat
      if achou = true then
      begin
        Fcomponentes[cont1] := Fcomponentes[cont1 + 1];
      end
      else
      begin
        if Fcomponentes[cont1] = aComponente then
        begin
          Fcomponentes[cont1] := Fcomponentes[cont1 + 1];
          achou := true;
        end;
      end;

      cont1 := cont1 + 1;
    until Length(Fcomponentes) = cont1;

    Fcomponentes[cont1] := nil;
    SetLength(Fcomponentes, length(Fcomponentes) - 1);
  end;
end;
end.
