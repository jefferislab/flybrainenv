# to clear all the cruft before we build
set path = ( /bin /usr/bin /usr/local/bin /usr/local/sbin /usr/sbin )
# for me this sources the flybrain env I want
# I also like setting variables in bash but could do it in csh as well
bash
# one could also run this step explicitly
# . /public/flybrain/flybrain.sh 

module load compilers/gcc/9.1.0


# this should have been R-4.2.1 but there were versions lying around ...
export RVERSION="R-4.2"
export RPREFIX="/public/flybrain/R/${RVERSION}"

cd /public/flybrain/R/src

curl -O https://download.osgeo.org/geos/geos-3.11.0.tar.bz2

tar xvfj geos-3.11.0.tar.bz2
cd geos-3.11.0
mkdir _build
cd _build
cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=${RPREFIX} \
    ..
make -j8
ctest
make install

cd /public/flybrain/R/src/

wget https://www.sqlite.org/2022/sqlite-autoconf-3390300.tar.gz
tar xvf sqlite-autoconf-3390300.tar.gz 
cd sqlite-autoconf-3390300
./configure  --prefix="$RPREFIX" --libdir "$RPREFIX/lib64"
make -j8
make install



wget https://download.osgeo.org/proj/proj-9.1.0.tar.gz
tar xvf proj-9.1.0.tar.gz
cd proj-9.1.0
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX:PATH=$RPREFIX ..
ccmake .. # edit the sqlite3 bin
make -j8
make install

wget https://github.com/OSGeo/gdal/releases/download/v3.5.2/gdal-3.5.2.tar.gz
tar xvf gdal-3.5.2.tar.gz
cd gdal-3.5.2
mkdir build
cd build
# otherwise finds gcc 8.5
export CC=`which gcc`
export CXX=`which g++`
cmake -DCMAKE_INSTALL_PREFIX:PATH=$RPREFIX ..


cd /public/flybrain/R/src/

./configure --prefix=${RPREFIX} LDFLAGS="-L${RPREFIX}/lib" CPPFLAGS="-I${RPREFIX}/include"
# lib64?
./configure --prefix=${RPREFIX} LDFLAGS="-L${RPREFIX}/lib64" CPPFLAGS="-I${RPREFIX}/include"

make -j8
make install

cd /public/flybrain/R/
ln -sf ${RVERSION}/lib .
ln -sf ${RVERSION}/lib64 .
ln -sf ${RVERSION}/bin .


# no longer necessary since https://github.com/jefferislab/flybrainenv/commit/4558ba3d589b9e43986cb6e9d31944f2167ea074

# ln -sf ${RVERSION}/bin/R .
#ln -sf ${RVERSION}/bin/Rscript .

