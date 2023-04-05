# Как собрать:

```
$ repo init --depth=1 -u https://github.com/LineageOS/android.git -b cm-13.0
```

Добавить в .repo/local_manifests/local_manifests.xml
```xml
<remote name="HWCRO-U00" fetch="https://github.com/usernameComputer01/"  />

<project path="device/huawei/CRO_U00" name="android_device_huawei_CRO_U00" clone-depth="1" revision="cm-13.0" remote="HWCRO-U00" />
<project path="device/mediatek/common" name="android_device_mediatek_common" clone-depth="1" revision="cm-13.0" remote="HWCRO-U00" />
<project path="device/mediatek/mt6580" name="android_device_mediatek_mt6580" clone-depth="1" revision="cm-13.0" remote="HWCRO-U00" />
<project path="vendor/mediatek/proprietary" name="android_vendor_mediatek_proprietary" clone-depth="1" revision="cm-13.0" remote="HWCRO-U00" />
```
Выполнить:
```bash
$ repo sync -j8 -c --no-clone-bundle
```

Если нужны OPEN GAPPS (https://github.com/opengapps/aosp_build):
1. Установить **git-lfs**
2. Добавить в .repo/local_manifests/local_manifests.xml
```xml
<remote name="opengapps" fetch="https://github.com/opengapps/"  />
<remote name="opengapps-gitlab" fetch="https://gitlab.opengapps.org/opengapps/"  />
    
<project path="vendor/opengapps/build" name="aosp_build" revision="master" remote="opengapps" />
<project path="vendor/opengapps/sources/all" name="all" clone-depth="1" revision="master" remote="opengapps-gitlab" />
<project path="vendor/opengapps/sources/arm" name="arm" clone-depth="1" revision="master" remote="opengapps-gitlab" />
```
3. Выполнить:
```bash
$ export WITH_OPEN_GAPPS=true
$ repo sync -j8 -c --no-clone-bundle
$ repo forall -c 'echo $REPO_PATH | grep -q opengapps && git lfs pull'
```

Если нужен DM-Verity:
```bash
$ export WITH_DM_VERITY=true
$ cd device/huawei/CRO_U00
$ git revert --no-edit 91699f7a2613061dddcfd06faa0a4e9f73b73894
```

Извлечь блобы (https://wiki.lineageos.org/extracting_blobs_from_zips):
1. Скачать офф. прошивку и извлечь из неё, и потом выполнить **./extract-files.sh**.
```bash
$ cd device/huwaei/CRO_U00
$ ./extract-files.sh путь/до/расположения/директории_system
```
2. Подключиться через adb и выдав **root-права**, выполнить **./extract-files.sh** без агрументов.

Начать сборку:
```bash
$ source build/environment.sh
$ breakfast CRO_U00 user
$ croot
$ device/huwaei/CRO_U00/patch/apply.sh # применить патчи
$ brunch CRO_U00 user
```
