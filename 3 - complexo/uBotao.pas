unit uBotao;

interface

uses
  uComponente;

type

  TBotao = class(TComponente)
    public
      Constructor Create(posX, posY, tamAltura, tamLargura : integer);
      Destructor  Destroy; Override;
      procedure AlteraTamanho(posX, posY: integer; tamAltura, tamLargura: real); override;
  end;

implementation

{ TBotao }

constructor TBotao.Create(posX: Integer; posY: Integer; tamAltura: Integer; tamLargura: Integer);
begin
    self.X := posX;
    self.Y := posY;

    self.Altura  := tamAltura;
    self.Largura := tamLargura;
end;

destructor TBotao.Destroy;
begin
  inherited;
end;

procedure TBotao.AlteraTamanho(posX: Integer; posY: Integer; tamAltura: Real; tamLargura: Real);
begin
  //somente largura
  self.Largura := Trunc(((tamLargura / 100) + 1) * self.Largura);

  //pos de x e y
  self.X := Trunc(posX / 2 + self.X);
  self.Y := Trunc(posY / 2 + self.Y);
end;
end.
