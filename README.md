# flybrainenv
Shared login scripts and other configuration info for the lmb linux cluster

## use
You should add the following at the end of your lmb `~/.login`.

```csh
source /public/flybrain/flybrain.csh  
```

Note do not put it in your `.cshrc` because the /public/com/lmbwide.login which is called from your `.login` will still clobber your path after `.cshrc` has been run.

There is a corresponding file to add to your `.bashrc` so that your path can be set for bash scripts running on the cluster.

```sh
source /public/flybrain/flybrain.sh  
```

## installing software

You have two options when using `/public/flybrain/`
1. Use the `prefix=/public/flybrain/`
    1. this will then have folders like `/public/flybrain/bin` `/public/flybrain/lib` and `/public/flybrain/include` analogous to the corresponding folders in `/usr/local`.
3. Make a subfolder such as `/public/flybrain/R`
   1. add a versioned subsubfolder e.g. `R-3.5.1` 
   2. symlink the main executable from the subsubfolder to the subfolder
   3. add the subfolder `/public/flybrain/R` to the path in `flybrain.csh`/`flybrain.sh`  

Option 1 is simpler, but option 2 is good if there may be multiple versions of the software installed over time.

## location
These scripts are designed to live in `/public/flybrain/` on the lmb cluster.
