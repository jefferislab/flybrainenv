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

ln -sf ${RVERSION}/bin/R .
ln -sf ${RVERSION}/bin/Rscript .