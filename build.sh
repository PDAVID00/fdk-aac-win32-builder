#! /bin/sh

cd stage

rm -rf $MINGW_CHOST
mkdir $MINGW_CHOST
cd $MINGW_CHOST

tar -zxvf ../../artifacts/fdk-aac-0.1.6.tar.gz
tar -zxvf ../../artifacts/fdk-aac-2.0.1.tar.gz

cd fdk-aac-0.1.6
./configure --prefix=$MINGW_PREFIX/$MINGW_CHOST/
make -j40
cd ..

cd fdk-aac-2.0.1
./configure --prefix=$MINGW_PREFIX/$MINGW_CHOST/
make -j40
cd ..

cd ../..

rm -rf artifacts/$MINGW_CHOST
mkdir artifacts/$MINGW_CHOST
cd artifacts/$MINGW_CHOST

cp ../../stage/$MINGW_CHOST/fdk-aac-0.1.6/.libs/libfdk-aac.a .
cp ../../stage/$MINGW_CHOST/fdk-aac-0.1.6/.libs/libfdk-aac.dll.a .
cp ../../stage/$MINGW_CHOST/fdk-aac-0.1.6/.libs/libfdk-aac-1.dll libfdk-aac.dll

cp ../../stage/$MINGW_CHOST/fdk-aac-2.0.1/.libs/libfdk-aac.a libfdk-aac-2.a
cp ../../stage/$MINGW_CHOST/fdk-aac-2.0.1/.libs/libfdk-aac.dll.a libfdk-aac-2.dll.a
cp ../../stage/$MINGW_CHOST/fdk-aac-2.0.1/.libs/libfdk-aac-2.dll .
