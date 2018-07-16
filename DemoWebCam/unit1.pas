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
var
  capture: PCvCapture;

procedure TForm1.FormShow(Sender: TObject);
begin
  try
    capture := cvCaptureFromCAM(0);
  except
    on ex : exception  do begin
    	ShowMessage('Start capturing error - '+ex.message);
    	halt;
    end;
  end;
  if not(assigned(capture ))  then begin
      ShowMessage('Could not initialize capturing from camera!!');
      halt;
  end;
  //  cvSetCaptureProperty(capture, CV_CAP_PROP_FRAME_WIDTH, 640);
  //  cvSetCaptureProperty(capture, CV_CAP_PROP_FRAME_HEIGHT, 480);
  ShowMessage('Cámara iniciada correctamente.');

end;
procedure TForm1.Button1Click(Sender: TObject);
var
  im: PIplImage;
begin
  im := cvQueryFrame(capture);
  cvNamedWindow('gray');
  cvShowImage('gray', im);
  cvWaitKey(0);
  cvReleaseImage(im);
end;
procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  cvReleaseCapture(@capture);
  cvDestroyAllWindows();
end;

end.

