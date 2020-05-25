include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-forward-mail
PKG_VERSION=1.0
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-forward-mail
	SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:=forward-mail Client for LuCI
	PKGARCH:=all
endef

define Package/luci-app-forward-mail/description
	This package contains LuCI configuration pages for forward-mail.
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/luci-app-forward-mail/install
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller

	# $(INSTALL_DATA) ./files/etc/helloworld.conf $(1)/etc/config/helloworld
	$(INSTALL_DATA) ./src/controller/forward_mail.lua $(1)/usr/lib/lua/luci/controller/forward_mail.lua
	$(INSTALL_DATA) ./src/model/cbi/forward_mail.lua $(1)/usr/lib/lua/luci/model/cbi/forward_mail.lua
endef

$(eval $(call BuildPackage,luci-app-forward-mail))