unit uLabel;

interface

uses
  uComponente;

type

  TLabel_ = class(TComponente)
    public
      procedure AlteraTamanho(posX, posY: integer; tamAltura, tamLargura: real); override;
      Constructor Create(posX, posY, tamAltura, tamLargura : integer);
      Destructor  Destroy; Override;
  end;

implementation

{ TLabel }

constructor TLabel_.Create(posX: Integer; posY: Integer; tamAltura: Integer; tamLargura: Integer);
begin
    self.X := posX;
    self.y := posY;

    self.Altura  := tamAltura;
    self.Largura := tamLargura;
end;

destructor TLabel_.Destroy;
begin
  inherited;
end;

procedure TLabel_.AlteraTamanho(posX: Integer; posY: Integer; tamAltura: Real; tamLargura: Real);
begin
  //pos de x e y
  self.X := Trunc(posX / 2 + self.X);
  self.Y := Trunc(posY / 2 + self.Y);
end;
end.
