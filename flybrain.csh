setenv LD_LIBRARY_PATH ${LD_LIBRARY_PATH}:/public/flybrain/lib:/public/flybrain/R/lib:/public/flybrain/hdf5/lib:/public/flybrain/R/lib64/R/library/rJava/libs
set flybrainpaths = ( /public/flybrain/ /public/flybrain/R/ /public/flybrain/cmtk/lib/cmtk/bin/ /public/flybrain/hdf5/bin /public/flybrain/R/lib64/R/library/rJava/libs)

# avoid duplicates by testing if path is present
foreach dir ( $flybrainpaths )
    echo ${path} | egrep -i "$dir" >& /dev/null
    if ($status != 0) then
        set path = ( $dir $path )
    endif
end
