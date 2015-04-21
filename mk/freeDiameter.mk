# included mk file for the freeDiameter module

FREEDIAMETER_DIR := ${MODULE_DIR}/freeDiameter
FREEDIAMETER_BUILD_DIR := ${ROOT}/build/freeDiameter
FREEDIAMETER_MAKEFILE := ${FREEDIAMETER_BUILD_DIR}/build/Makefile

${FREEDIAMETER_BUILD_DIR}:
	mkdir -p ${FREEDIAMETER_BUILD_DIR}

${FREEDIAMETER_MAKEFILE}: ${FREEDIAMETER_BUILD_DIR}
	cd ${FREEDIAMETER_BUILD_DIR} && cmake ${FREEDIAMETER_DIR} -DBUILD_DICT_DCCA_STARENT=OFF -DBUILD_DICT_EAP=OFF -DBUILD_DICT_MIP6A=OFF -DBUILD_DICT_MIP6I=OFF -DBUILD_DICT_NAS_MIPV6=OFF -DBUILD_DICT_RFC5777=OFF -DBUILD_DICT_SIP=ON -DBUILD_RT_IGNORE_DH=ON -DBUILD_TESTING=OFF -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR} -DDEFAULT_CONF_PATH=/var/lib/ralf -DDEFAULT_EXTENSIONS_PATH=/usr/share/clearwater/lib/ralf/freeDiameter -DFD_PROJECT_NAME=Clearwater -DFD_PROJECT_VENDOR_ID=19444

freeDiameter: ${FREEDIAMETER_MAKEFILE}
	${MAKE} -C ${FREEDIAMETER_BUILD_DIR}
	${MAKE} -C ${FREEDIAMETER_BUILD_DIR} install

freeDiameter_test: ${FREEDIAMETER_MAKEFILE}
	# Commented out - for speed, these tests aren't built - enable BUILD_TESTING above to build
	# ${MAKE} -C ${FREEDIAMETER_BUILD_DIR} test

freeDiameter_clean: ${FREEDIAMETER_MAKEFILE}
	${MAKE} -C ${FREEDIAMETER_BUILD_DIR} clean

freeDiameter_distclean:
	rm -rf ${FREEDIAMETER_BUILD_DIR}

.PHONY: freeDiameter freeDiameter_test freeDiameter_clean freeDiameter_distclean
