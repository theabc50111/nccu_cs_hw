#include <iostream>
#include <vector>
#include <bitset>
#include <string>
#include <random>
#include <chrono>
#include <algorithm>
#include <unordered_set>
#include <typeinfo>
#include <opencv2/core.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/highgui.hpp>

#define PIC_WIDTH 2000

using namespace std;
using namespace cv;

class DrawPic {
    private:
        Mat img;

        void draw_circle( Mat img, Point center ){
            circle( img,center,PIC_WIDTH/(PIC_WIDTH/10) ,Scalar( 0, 0, 255 ),FILLED,LINE_8 );
        }

        void draw_line( Mat img, Point start, Point end ){
            int thickness = 2;
            int lineType = FILLED;
            line( img,start,end,Scalar( 0, 255, 0 ),thickness,lineType);
        }

    public:
        DrawPic(Mat x){
            this->img = x;
        }

        void draw(){
            draw_circle(this->img, Point( w/2, w/2));
            draw_line(this->img, Point( 0, 15*w/16 ), Point( w, 15*w/16 ));
        }

        void save_pic(string file_name){
            imwrite(file_name, this->img);
        }
};


int main( void ){
  char rook_window[] = "Drawing 2: Rook";
  Mat rook_image = Mat::zeros( w, w, CV_8UC3 );
  DrawPic pic1(rook_image);
  pic1.draw();
  pic1.save_pic("t1.png");

//   imshow( rook_window, rook_image );
//   imwrite("test.jpg", rook_image);
//   moveWindow( rook_window, w, 200 );
//   waitKey( 0 );
  return(0);
}

