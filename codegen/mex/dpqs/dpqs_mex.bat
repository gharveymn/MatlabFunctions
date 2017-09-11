@echo off
set MATLAB=C:\PROGRA~1\MATLAB\R2017a
set MATLAB_ARCH=win64
set MATLAB_BIN="C:\Program Files\MATLAB\R2017a\bin"
set ENTRYPOINT=mexFunction
set OUTDIR=.\
set LIB_NAME=dpqs_mex
set MEX_NAME=dpqs_mex
set MEX_EXT=.mexw64
call setEnv.bat
echo # Make settings for dpqs > dpqs_mex.mki
echo COMPILER=%COMPILER%>> dpqs_mex.mki
echo COMPFLAGS=%COMPFLAGS%>> dpqs_mex.mki
echo OPTIMFLAGS=%OPTIMFLAGS%>> dpqs_mex.mki
echo DEBUGFLAGS=%DEBUGFLAGS%>> dpqs_mex.mki
echo LINKER=%LINKER%>> dpqs_mex.mki
echo LINKFLAGS=%LINKFLAGS%>> dpqs_mex.mki
echo LINKOPTIMFLAGS=%LINKOPTIMFLAGS%>> dpqs_mex.mki
echo LINKDEBUGFLAGS=%LINKDEBUGFLAGS%>> dpqs_mex.mki
echo MATLAB_ARCH=%MATLAB_ARCH%>> dpqs_mex.mki
echo BORLAND=%BORLAND%>> dpqs_mex.mki
echo OMPFLAGS= >> dpqs_mex.mki
echo OMPLINKFLAGS= >> dpqs_mex.mki
echo EMC_COMPILER=msvc140>> dpqs_mex.mki
echo EMC_CONFIG=optim>> dpqs_mex.mki
"C:\Program Files\MATLAB\R2017a\bin\win64\gmake" -B -f dpqs_mex.mk
