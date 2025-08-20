# docker image for virtual switch based sonic docker image

DOCKER_SONIC_VS_CUSTOM = docker-sonic-vs-custom.gz
$(DOCKER_SONIC_VS_CUSTOM)_PATH = $(PLATFORM_PATH)/docker-sonic-vs-custom
$(DOCKER_SONIC_VS_CUSTOM)_DEPENDS += $(SYNCD_VS_CUSTOM) \
                              $(PYTHON3_SWSSCOMMON) \
                              $(LIBTEAMDCTL) \
                              $(LIBTEAM_UTILS) \
                              $(SONIC_DEVICE_DATA) \
                              $(LIBYANG) \
                              $(LIBYANG_CPP) \
                              $(LIBYANG_PY3) \
                              $(SONIC_UTILITIES_DATA) \
                              $(SONIC_HOST_SERVICES_DATA) \
                              $(SYSMGR)

$(DOCKER_SONIC_VS_CUSTOM)_PYTHON_WHEELS += $(SONIC_PY_COMMON_PY3) \
                                    $(SONIC_PLATFORM_COMMON_PY3) \
                                    $(SONIC_YANG_MODELS_PY3) \
                                    $(SONIC_YANG_MGMT_PY3) \
                                    $(SONIC_UTILITIES_PY3) \
                                    $(SONIC_HOST_SERVICES_PY3)

ifeq ($(INSTALL_DEBUG_TOOLS), y)
$(DOCKER_SONIC_VS_CUSTOM)_DEPENDS += $(LIBSWSSCOMMON_DBG) \
                              $(LIBSAIREDIS_DBG) \
                              $(LIBSAIVS_DBG) \
                              $(SYNCD_VS_CUSTOM_DBG) \
                              $(SYSMGR_DBG)
endif

ifeq ($(SONIC_ROUTING_STACK), frr)
$(DOCKER_SONIC_VS_CUSTOM)_DEPENDS += $(FRR)
else
$(DOCKER_SONIC_VS_CUSTOM)_DEPENDS += $(GOBGP)
endif

ifeq ($(INCLUDE_FIPS), y)
$(DOCKER_SONIC_VS_CUSTOM)_DEPENDS += $(FIPS_KRB5_ALL)
endif

$(DOCKER_SONIC_VS_CUSTOM)_FILES += $(CONFIGDB_LOAD_SCRIPT) \
                            $(ARP_UPDATE_SCRIPT) \
                            $(ARP_UPDATE_VARS_TEMPLATE) \
                            $(BUFFERS_CONFIG_TEMPLATE) \
                            $(QOS_CONFIG_TEMPLATE) \
                            $(SONIC_VERSION) \
                            $(UPDATE_CHASSISDB_CONFIG_SCRIPT) \
                            $(COPP_CONFIG_TEMPLATE)

$(DOCKER_SONIC_VS_CUSTOM)_LOAD_DOCKERS += $(DOCKER_SWSS_LAYER_BOOKWORM)
SONIC_DOCKER_IMAGES += $(DOCKER_SONIC_VS_CUSTOM)

SONIC_BOOKWORM_DOCKERS += $(DOCKER_SONIC_VS_CUSTOM)
