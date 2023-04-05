#!/bin/bash

[[ $ANDROID_BUILD_TOP ]] || { echo "[-] Can't find android environment"; exit 1; }

if [ $# -ne 0 ] && [ $1 = "-R" ]; then
   export is_revert=1    
else
   export is_revert=0
fi

export dir_proj=$ANDROID_BUILD_TOP/device/huawei/CRO_U00
export dir_patch=$dir_proj/patch

[[ -d $dir_patch ]] || { echo "[-] Patch directory '$dir_patch' does not exists"; exit 1; }

apply_patch() {

    cd $ANDROID_BUILD_TOP/$(dirname $1)
    patch="$dir_patch/$1"

    case $is_revert in
        1) 
            git apply --check $patch 2>/dev/null || git apply -R -v $patch
            ;;
        0)
            git apply --check $patch 2>/dev/null && git apply -v $patch
            ;;
    esac
}

export -f apply_patch

cd $dir_patch
find -type f -name '*.patch' \
    | if [ $is_revert -eq 1 ]; then sort -r; else sort ; fi \
    | xargs -i bash -c 'apply_patch {}'
