unit uFrame;

interface

uses
  uComponente;

type

  TFrame = class(TComponente)
    Constructor Create(posX, posY, tamAltura, tamLargura : integer);
    Destructor Destroy; Override;
    procedure NovoTamanho(tamAltura, tamLargura : integer);
    procedure AlteraTamanho(posX, posY : integer; tamAltura, tamLargura : real); override;
  end;

implementation

{ TFrame }

constructor TFrame.Create(posX: Integer; posY: Integer; tamAltura: Integer; tamLargura: Integer);
begin
  self.X := posX;
  self.Y := posY;

  self.Altura  := tamAltura;
  self.Largura := tamLargura;
end;

destructor TFrame.Destroy;
begin
  inherited;
end;

procedure TFrame.NovoTamanho(tamAltura: Integer; tamLargura: Integer);
var
  posX, posY, cont1 : integer;
  tamAlt, tamLar : real;
begin
  posX := tamAltura - self.Altura;
  posY := tamLargura - self.Largura;

  tamAlt := ((tamAltura * 100) / self.Altura) - 100;
  tamLar := ((tamLargura * 100) / self.Largura) - 100;
  self.Altura := tamAltura;
  self.Largura := tamLargura;

  for cont1 := 0 to Length(self.Componentes) - 1 do
  begin
    self.Componentes[cont1].AlteraTamanho(posX,posY,tamAlt,tamLar);
  end;
end;

procedure TFrame.AlteraTamanho(posX: Integer; posY: Integer; tamAltura: Real; tamLargura: Real);
begin
  self.Altura := Trunc(((tamAltura / 100) + 1) * self.Altura);
  self.Largura := Trunc(((tamLargura / 100) + 1) * self.Largura);

  self.X := Trunc((posX / 2) + self.X);
  self.Y := Trunc((posY / 2) + self.Y);
end;
end.
