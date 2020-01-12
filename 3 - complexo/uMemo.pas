unit uMemo;

interface

uses
  uComponente;

type

  TMemo_ = class(TComponente)
    public
      Constructor Create(posX, posY, tamAltura, tamLargura: integer);
      Destructor Destroy; Override;
      procedure AlteraTamanho(posX, posY: integer; tamAltura, tamLargura: real); override;
  end;

implementation

{ TMemo }

constructor TMemo_.Create(posX: Integer; posY: Integer; tamAltura: Integer; tamLargura: Integer);
begin
    self.X := posX;
    self.Y := posY;

    self.Altura  := tamAltura;
    self.Largura := tamLargura;
end;

destructor TMemo_.Destroy;
begin
  inherited;
end;

procedure TMemo_.AlteraTamanho(posX: Integer; posY: Integer; tamAltura: Real; tamLargura: Real);
begin
  //largura e altura
  self.Largura := Trunc(((tamAltura / 100) + 1) * self.Largura);
  self.Altura  := Trunc(((tamLargura / 100) + 1) * self.Altura);

  //pos de x e y
  self.X := Trunc(posX / 2 + self.X);
  self.Y := Trunc(posY / 2 + self.Y);
end;
end.
