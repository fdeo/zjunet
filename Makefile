include $(TOPDIR)/rules.mk

PKG_NAME:=zjunet
PKG_VERSION:=0.3.3
PKG_RELEASE:=6

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/fdeo/zjunet.git
PKG_SOURCE_VERSION:=HEAD

PKG_MAINTAINER:=Azuk 443 <me@azuk.top>
PKG_LICENSE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/zjunet
  SECTION:=net
  CATEGORY:=Network
  TITLE:=ZJU Campus Network Scripts
  DEPENDS:=+xl2tpd +bind-dig +bash
endef

define Package/zjunet/description
  Command-line scripts for VPN / WLAN / NEXTHOP access on ZJU campus.
endef

define Build/Compile
	# nothing to compile
endef

define Package/zjunet/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bin/zjunet $(1)/usr/bin/zjunet

	$(INSTALL_DIR) $(1)/usr/share/zjunet
	$(CP) $(PKG_BUILD_DIR)/miscellaneous/* $(1)/usr/share/zjunet/
	$(CP) $(PKG_BUILD_DIR)/VERSION $(1)/usr/share/zjunet/

	$(INSTALL_DIR) $(1)/usr/lib/zjunet
	$(CP) $(PKG_BUILD_DIR)/lib/*.sh $(1)/usr/lib/zjunet/
endef

$(eval $(call BuildPackage,zjunet))
