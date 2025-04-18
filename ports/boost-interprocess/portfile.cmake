# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_download_distfile(ARM32_PATCH
    URLS https://github.com/boostorg/interprocess/commit/f58e968f13e693ffaa78fb283972e8598dc48c9f.patch?full_index=1
    FILENAME boost-interprocess-arm32-f58e968f13e693ffaa78fb283972e8598dc48c9f.patch
    SHA512 7e9b5ebac8ef3c04327c29bad9b8b6259320fd9ebec80bac905b7bd4f68e5cb4f001e2c80f83a875cc12376df4f3b444b34251ac3ea88962982a147432ef0f7c
)
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/interprocess
    REF boost-${VERSION}
    SHA512 052eb0e5102e0ae96740f7e7fae3b42656dfb6f4f5701340bb881a4fcc84718369b59f1725616bcaca8b4735a3bcf6ce7966ba8277a03a05bfa75a1b3faae4ac
    HEAD_REF master
    PATCHES
        ${ARM32_PATCH}
)

set(FEATURE_OPTIONS "")
boost_configure_and_install(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS ${FEATURE_OPTIONS}
)
