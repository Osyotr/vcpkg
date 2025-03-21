vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO IfcOpenShell/IfcOpenShell
    #REF "${VERSION}"
    REF bonsai-0.8.1-alpha2501261011
    SHA512 54a8e4b441b89ffb4a2d18b0dc22dda508cf265c0757fc1f8979b345b9a9fe3f83fb379075186a4390c96b831aef95bb5c789f78b9dfea2d2eae394bbdcb0ab5
    PATCHES
        cmake.patch
)

vcpkg_check_features(OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        cgal WITH_CGAL
        convert BUILD_CONVERT
        geom BUILD_IFCGEOM
        geomserver BUILD_GEOMSERVER
        #ifcmax BUILD_IFCMAX # win
        opencascade WITH_OPENCASCADE
        python BUILD_IFCPYTHON
        #qtviewer BUILD_QTVIEWER
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}/cmake"
    OPTIONS
        -DBUILD_DOCUMENTATION=OFF
        -DBUILD_EXAMPLES=ON # TODO off
        "-DSCHEMA_VERSIONS=2x3;4;4x3_add2" # https://github.com/IfcOpenShell/IfcOpenShell/issues/1029#issuecomment-1882752366
        ${FEATURE_OPTIONS}

        -DCOLLADA_SUPPORT=OFF # TODO feature Build IfcConvert with COLLADA support
        -DGLTF_SUPPORT=OFF # TODO feature Build IfcConvert with glTF support
        -DHDF5_SUPPORT=OFF # TODO feature Enable HDF5 support
        -DWITH_PROJ=OFF # TODO feature Enable output of Earth-Centered Earth-Fixed glTF output using the PROJ library
        -DIFCXML_SUPPORT=OFF # TODO feature Build IfcParse with ifcXML support 
        -DUSD_SUPPORT=OFF # TODO feature Build IfcConvert with USD support
        -DCITYJSON_SUPPORT=OFF # TODO feature Build IfcConvert with CityJSON support
        -DWITH_RELATIONSHIP_VALIDATION=OFF # TODO feature Build IfcConvert with option to validate geometrical relationships
)

vcpkg_cmake_install()
vcpkg_copy_pdbs()

vcpkg_cmake_config_fixup()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/COPYING.LESSER")
