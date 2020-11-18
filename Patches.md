# rebase from upstream

```
# isntall git-imerge via brew
git imerge rebase upstream/master
# fix merge conflicts till `git imerge continue` finishes
git imerge simplify --goal=rebase
```

# Patch submodules

```
# update patch
git diff --submodule=diff > submodules.patch

git apply submodules.patch

#reset
git submodule foreach git reset --hard 
```

**Patched submodules**:
- submodules/TgVoip/libtgvoip
- submodules/TgVoipWebrtc/tgcalls
- third-party/webrtc/webrtc-ios
