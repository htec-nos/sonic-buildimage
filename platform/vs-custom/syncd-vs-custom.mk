$(LIBSAIREDIS)_DEB_BUILD_PROFILES += syncd vs-custom

SYNCD_VS_CUSTOM = syncd-vs-custom_1.0.0_$(CONFIGURED_ARCH).deb
$(SYNCD_VS_CUSTOM)_RDEPENDS += $(LIBSAIREDIS) $(LIBSAIMETADATA) $(LIBSAIVS)

ifeq ($(INCLUDE_VS_CUSTOM_DASH_SAI),y)
ifeq ($(BLDENV),bookworm)
# dash-sai only support sonic-vs-custom.img.gz. it don't support docker-sonic-vs-custom.gz
ifeq ($(findstring docker-sonic-vs-custom, $(SONIC_BUILD_TARGET)), )
  $(LIBSAIREDIS)_DEB_BUILD_PROFILES += dashsai
  $(LIBSAIREDIS)_DEPENDS += $(DASH_SAI)
  $(SYNCD_VS_CUSTOM)_RDEPENDS += $(DASH_SAI)
endif
else
  $(warning DASH_SAI cannot support this build environment $(BLDENV))
endif
endif

$(eval $(call add_derived_package,$(LIBSAIREDIS),$(SYNCD_VS_CUSTOM)))

SYNCD_VS_CUSTOM_DBG = syncd-vs-custom-dbgsym_1.0.0_$(CONFIGURED_ARCH).deb
$(SYNCD_VS_CUSTOM_DBG)_DEPENDS += $(SYNCD_VS_CUSTOM)
$(SYNCD_VS_CUSTOM_DBG)_RDEPENDS += $(SYNCD_VS_CUSTOM)
$(eval $(call add_derived_package,$(LIBSAIREDIS),$(SYNCD_VS_CUSTOM_DBG)))
