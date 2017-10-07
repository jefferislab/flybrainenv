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

## location
These scripts are designed to live in `/public/flybrain/` on the lmb cluster.
