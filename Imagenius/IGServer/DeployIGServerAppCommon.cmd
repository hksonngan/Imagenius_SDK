IF %1==ServerRelease GOTO RELEASE
SET targetdir="C:\Imagenius\Testing\IGServer"
GOTO MAIN
:RELEASE
SET targetdir="C:\Imagenius\IGServer"
:MAIN

md "C:\Imagenius"
md "C:\Imagenius\IGServer"
md "C:\Imagenius\Testing
md "C:\Imagenius\Testing\IGServer"
md "%targetdir%\IGServerApplication"
md "%targetdir%\IGServerApplication\IGPictureEditor.dll"
md "%targetdir%\IGServerApplication\config"
md "%targetdir%\IGFaceDetector"
md "%targetdir%\IGFaceDetector\ANN"
md "%targetdir%\IGFaceDetector\db"
md "%targetdir%\IGFaceDetector\db\logs"
md "%targetdir%\IGFaceDetector\db\node"
md "%targetdir%\IGFaceDetector\db\registry"
md "C:\Imagenius\IGSMDesktop"
md "C:\Imagenius\IGSMDesktop\db"
md "C:\Imagenius\IGSMDesktop\db\logs"
md "C:\Imagenius\IGSMDesktop\db\node"
md "C:\Imagenius\IGSMDesktop\db\registry"
md "C:\Imagenius\Console"
md "C:\Imagenius\Testing\IGSMDesktop"
md "C:\Imagenius\Testing\IGSMDesktop\db_debug"
md "C:\Imagenius\Testing\IGSMDesktop\db_debug\logs"
md "C:\Imagenius\Testing\IGSMDesktop\db_debug\node"
md "C:\Imagenius\Testing\IGSMDesktop\db_debug\registry"
md "C:\Imagenius\Testing\Console"

copy /Y "%1\IGServer.exe" "%targetdir%\IGServerApplication"
copy /Y "IGServer.exe.manifest" "%targetdir%\IGServerApplication"
copy /Y "config\IGServerConfig.xml" "%targetdir%\IGServerApplication\config"
copy /Y "..\IGPictureEditor\%1\IGPictureEditor.dll" "%targetdir%\IGServerApplication\IGPictureEditor.dll"
copy /Y "..\IGPictureEditor\%1\IGPictureEditor.pdb" "%targetdir%\IGServerApplication\IGPictureEditor.dll"
copy /Y "IGPictureEditor.dll.manifest" "%targetdir%\IGServerApplication\IGPictureEditor.dll"
copy /Y "IGServerInstall.cmd" "%targetdir%\IGServerApplication"
copy /Y "..\IGLibrary\FaceDetection\opencv\dll\opencv_calib3d230.dll" "%targetdir%\IGFaceDetector"
copy /Y "..\IGLibrary\FaceDetection\opencv\dll\opencv_core230.dll" "%targetdir%\IGFaceDetector"
copy /Y "..\IGLibrary\FaceDetection\opencv\dll\opencv_features2d230.dll" "%targetdir%\IGFaceDetector"
copy /Y "..\IGLibrary\FaceDetection\opencv\dll\opencv_flann230.dll" "%targetdir%\IGFaceDetector"
copy /Y "..\IGLibrary\FaceDetection\opencv\dll\opencv_highgui230.dll" "%targetdir%\IGFaceDetector"
copy /Y "..\IGLibrary\FaceDetection\opencv\dll\opencv_imgproc230.dll" "%targetdir%\IGFaceDetector"
copy /Y "..\IGLibrary\FaceDetection\opencv\dll\opencv_objdetect230.dll" "%targetdir%\IGFaceDetector"
copy /Y "..\IGLibrary\FaceDetection\opencv\dll\tbb.dll" "%targetdir%\IGFaceDetector"
copy /Y "..\IGLibrary\FaceDetection\ANN\haarcascade_mcs_lefteye.xml" "%targetdir%\IGFaceDetector\ANN"
copy /Y "..\IGLibrary\FaceDetection\ANN\haarcascade_mcs_righteye.xml" "%targetdir%\IGFaceDetector\ANN"
copy /Y "..\IGLibrary\FaceDetection\ANN\haarcascade_frontalface_alt.xml" "%targetdir%\IGFaceDetector\ANN"
copy /Y "..\IGLibrary\FaceDetection\ANN\Mouth.xml" "%targetdir%\IGFaceDetector\ANN"
copy /Y "..\IGLibrary\FaceDetection\ANN\Nariz.xml" "%targetdir%\IGFaceDetector\ANN"
copy /Y "..\IGFaceDetectorIceClient\config.client" "%targetdir%\IGServerApplication"
copy /Y "..\IGFaceDetectorIce\config.grid" "%targetdir%\IGServerApplication"
copy /Y "..\IGFaceDetectorIce\config.client" "%targetdir%\IGFaceDetector"
copy /Y "..\%1\IGFaceDetectorIceClient.dll" "%targetdir%\IGServerApplication"
copy /Y "..\%1\IGFaceDetectorIceClient.pdb" "%targetdir%\IGServerApplication"
copy /Y "..\%1\IGFaceDetectorIceClient.dll" "%targetdir%\IGFaceDetector"
copy /Y "..\%1\IGFaceDetectorIceClient.pdb" "%targetdir%\IGFaceDetector"
copy /Y "..\%1\IGSmartProcessingFaceDetector.dll" "%targetdir%\IGFaceDetector"
copy /Y "..\%1\IGSmartProcessingFaceDetector.pdb" "%targetdir%\IGFaceDetector"

IF %1==ServerRelease GOTO ENDRELEASE
copy /Y "config\IGServerConfigDebug.xml" "C:\Imagenius\Testing\IGServer\IGServerApplication\config"
xcopy /Y /E "..\IGFaceDetectorIce\db_debug" "C:\Imagenius\Testing\IGServer\IGFaceDetector\db"
copy /Y "..\IGFaceDetectorIce\db_debug\config.grid" "C:\Imagenius\Testing\IGServer\IGFaceDetector"
copy /Y "..\ServerDebug\IGFaceDetectorIceServiced.dll" "C:\Imagenius\Testing\IGServer\IGFaceDetector"
copy /Y "..\ServerDebug\IGFaceDetectorIceServiced.pdb" "C:\Imagenius\Testing\IGServer\IGFaceDetector"
xcopy /Y /E "..\IGSMDesktopIce\bin\Debug" "C:\Imagenius\Testing\IGSMDesktop"
xcopy /Y /E "..\IGSMDesktopIce\db_debug" "C:\Imagenius\Testing\IGSMDesktop\db_debug"
copy /Y "..\IGSMDesktopIce\config_debug.grid" "C:\Imagenius\Testing\IGSMDesktop\config.grid"
xcopy /Y /E "..\IGSMDesktopIceClient\bin\Debug" "C:\Imagenius\Testing\Console"
copy /Y "..\IGSMDesktopIceClient\config_debug.client" "C:\Imagenius\Testing\Console\config.client"
:ENDRELEASE
IF %1==ServerDebug GOTO END
xcopy /Y /E "..\IGFaceDetectorIce\db" "C:\Imagenius\IGServer\IGFaceDetector\db"
copy /Y "..\IGFaceDetectorIce\config.grid" "C:\Imagenius\IGServer\IGFaceDetector"
copy /Y "..\ServerRelease\IGFaceDetectorIceService.dll" "C:\Imagenius\IGServer\IGFaceDetector"
copy /Y "..\ServerRelease\IGFaceDetectorIceService.pdb" "C:\Imagenius\IGServer\IGFaceDetector"
copy /Y "..\ServerRelease\IGFaceDetectorIceService.dll" "C:\Imagenius\IGServer\IGFaceDetector"
copy /Y "..\ServerRelease\IGFaceDetectorIceService.pdb" "C:\Imagenius\IGServer\IGFaceDetector"
xcopy /Y /E "..\IGSMDesktopIce\bin\Release" "C:\Imagenius\IGSMDesktop"
xcopy /Y /E "..\IGSMDesktopIce\db" "C:\Imagenius\IGSMDesktop\db"
copy /Y "..\IGSMDesktopIce\IGSMDesktopIce.exe.config" "C:\Imagenius\IGSMDesktop"
xcopy /Y /E "..\IGSMDesktopIceClient\bin\Release" "C:\Imagenius\Console"
:END

