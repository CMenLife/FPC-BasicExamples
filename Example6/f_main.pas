unit f_main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { Tf_ex6_Main }

  Tf_ex6_Main = class(TForm)
    BStart: TButton;
    procedure BStartClick(Sender: TObject);
  private

  public

  end;

var
  f_ex6_Main: Tf_ex6_Main;

implementation

{$R *.lfm}

const Ok : Boolean = False;

procedure Step;
var r,g,b,w,h,x,y,xc,yc : integer;  CNV : TCanvas;
Begin
  w:=f_ex6_Main.ClientWidth;     //ширина формы
  h:=f_ex6_Main.ClientHeight;    //высота формы
  CNV:=f_ex6_Main.Canvas;
  x:=Random(w); y:=Random(h); //случайные координаты и цвет
  r:=55+Random(201);  g:=55+Random(201);  b:=55+Random(201);
  xc:=w div 2;              //координаты центра формы
  yc:=h div 2;
  with CNV do
   begin Pen.Color:=RGBToColor(r,g,b);
    MoveTo(xc,yc);
    LineTo(x,y);
   end;
  Application.ProcessMessages; //обработчик событий
End;

procedure Start;
Begin
  while Ok do Step;
End;

{ Tf_ex6_Main }

procedure Tf_ex6_Main.BStartClick(Sender: TObject);
begin
  if Ok then //если идет процесс рисования
   begin Ok:=False;
     BStart.Caption:='СТАРТ';
   end  else //если процесса рисования нет
   begin Ok:=True;
     BStart.Caption:='СТОП';
     Start;
   end;
end;

end.

