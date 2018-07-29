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
  storage: pCvMemStorage = nil;
  ClassifierCascade: pCvHaarClassifierCascade ;

implementation
{$R *.lfm}

procedure detect_and_draw( image: pIplImage);
var
   scale: Integer;
   temp: pIplImage;
   // two points to represent the face locations
   pt1, pt2: CvPoint;
   i: Integer;
   faces: pCvSeq;
   r: pCvRect;
   mycvSize:TcvSize;
   bmp : TBitmap;
begin
   scale := 1;
   // Create a new image based on the input image
   mycvSize.width:=image^.width div scale;
   mycvSize.height:=image^.height div scale;
   temp := cvCreateImage(mycvSize , 8, 3);
   cvCopy(image, temp, nil);

   // Clear the memory storage which was used before
   cvClearMemStorage(storage);

       // There can be more than one face in an image. So create a growable sequence of faces.
       // Detect the objects and store them in the sequence
       faces := cvHaarDetectObjects(image, ClassifierCascade, storage, 1.1, 2, CV_HAAR_SCALE_IMAGE or CV_HAAR_DO_CANNY_PRUNING, cvSize(40, 40), cvSize(0, 0));
       // Loop the number of faces found.
       for i := 1 to faces^.total do begin
         // Create a new rectangle for drawing the face
         r := pCvRect(cvGetSeqElem(faces, i));
         // Find the dimensions of the face,and scale it if necessary
         pt1.x := r^.x * scale;
         pt2.x := (r^.x + r^.width) * scale;
         pt1.y := r^.y * scale;
         pt2.y := (r^.y + r^.height) * scale;
         // Draw the rectangle in the input image
         cvRectangle(temp, pt1, pt2, CV_RGB(255, 0, 0), 3, 8, 0);
       end;

   bmp := TBitmap.Create;
   IplImage2Bitmap(temp, bmp);
   Form1.Image2.Picture.bitmap.assign(bmp);
   bmp.free;
   // Release the temp image created.
   cvReleaseImage(temp);
end;

{ TForm1 }
procedure TForm1.FormCreate(Sender: TObject);
begin
  frame:=cvLoadImage( 'pexels-photo-759200.jpeg');
  if frame = nil then begin
    ShowMessage('Could not load picture!');
    halt;
  end;
  storage := cvCreateMemStorage(0);
  ClassifierCascade := cvLoad(pCVChar('haarcascade_frontalface_alt.xml'));
 detect_and_draw( frame);

end;

end.

