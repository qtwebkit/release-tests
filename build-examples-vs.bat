git clone --depth 1 -b no_example_installs https://github.com/annulen/qtwebkit-examples.git
cd qtwebkit-examples\examples
cd && "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" %VS_ARCH% ^
  && qmake ^
  && jom ^
  && jom install
cd ..\..
