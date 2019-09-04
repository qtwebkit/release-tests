git clone --depth 1 https://github.com/annulen/phantomjs.git
set QT_QPA_PLATFORM=minimal
cd phantomjs
cd && "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" %VS_ARCH% ^
  && qmake ^
  && jom ^
  && dumpbin /dependents bin\phantomjs.exe ^
  && bin\phantomjs --version ^
  && REM python test\run-tests.py --verbose
cd ..
