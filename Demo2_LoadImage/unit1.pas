unit Unit1;
{$mode objfpc}{$H+}
interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, OpenCV, IPL;

type
  { TForm1 }
  TForm1 = class(TForm)
    Image2: TImage;
    procedure FormCreate(Sender: TObject);
  public
  end;

var
  Form1: TForm1;
  frame: PIplImage;
implementation
{$R *.lfm}
{ TForm1 }
procedure TForm1.FormCreate(Sender: TObject);
var
   bmp : TBitmap;
begin
  frame:=cvLoadImage( 'pexels-photo-759200.jpeg');
  if frame = nil then begin
    ShowMessage('Could not load picture!');
    halt;
  end;
  bmp := TBitmap.Create;
  IplImage2Bitmap(frame, bmp);
  Form1.Image2.Picture.bitmap.assign(bmp);
  bmp.free;
end;

end.

