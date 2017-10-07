set flybrainpaths = ( /public/flybrain/R/ /public/flybrain/cmtk/lib/cmtk/bin/ )

# avoid duplicates by testing if path is present
foreach dir ( $flybrainpaths )
    echo ${path} | egrep -i "$dir" >& /dev/null
    if ($status != 0) then
        set path = ( $dir $path )
    endif
end
