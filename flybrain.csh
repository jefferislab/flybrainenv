source /public/gcc/gcc4_8_3.csh
setenv LD_LIBRARY_PATH ${LD_LIBRARY_PATH}:/public/flybrain/R/lib
set flybrainpaths = ( /public/flybrain/R/ /public/flybrain/cmtk/lib/cmtk/bin/ )

# avoid duplicates by testing if path is present
foreach dir ( $flybrainpaths )
    echo ${path} | egrep -i "$dir" >& /dev/null
    if ($status != 0) then
        set path = ( $dir $path )
    endif
end
