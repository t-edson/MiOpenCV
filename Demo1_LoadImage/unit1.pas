unit Unit1;
{$mode objfpc}{$H+}
interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls
  , OpenCV, IPL;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}
{ TForm1 }
procedure TForm1.FormShow(Sender: TObject);
begin
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  im: PIplImage;
begin
  im := cvLoadImage('pexels-photo-759200.jpeg', CV_LOAD_IMAGE_COLOR);
  cvNamedWindow('foto1');
  cvShowImage('foto1', im);
  cvWaitKey(0);
  cvReleaseImage(im);
end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  cvDestroyAllWindows();
end;

end.

