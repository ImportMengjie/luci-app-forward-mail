module("luci.controller.forward_mail", package.seeall)


function index()
	local fs = require "nixio.fs"
	if fs.access("/usr/bin/forward-mail") then
		entry({"admin", "services", "forward-mail"}, cbi("forward_mail"), _("转发邮件"),48)
	end
end

