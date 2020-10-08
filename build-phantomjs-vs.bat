git clone --depth 1 https://github.com/annulen/phantomjs.git
set QT_QPA_PLATFORM=minimal
cd phantomjs
cd && "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvarsall.bat" %VS_ARCH% ^
  && qmake ^
  && jom ^
  && bin\phantomjs --version ^
  && REM python test\run-tests.py --verbose
cd ..
