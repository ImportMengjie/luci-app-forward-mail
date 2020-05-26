local sys = require "luci.sys"
local fs = require "nixio.fs"
local uci = require "luci.model.uci".cursor()

m = Map("forward-mail", "forward-mail config",
    translate("配置转发邮件"))
    
if fs.access("/usr/bin/forward-mail") then
    user_mail_section = m:section(TypedSection, "user_mail", "用户邮箱设置")
    user_mail_section.anonymous = false
    user_mail_section.addremove = false
    user_mail_address = user_mail_section:option(Value, "address", "user mail address")
    user_mail_password = user_mail_section:option(Value, "password", "user mail password")
    user_mail_imap_url = user_mail_section:option(Value, "imap_url", "user mail imap_url")
    user_mail_smtp_url = user_mail_section:option(Value, "smtp_url", "user mail smtp_url")

    others_mail_section = m:section(TypedSection, "others_mail", "转发目的邮箱设置")
    others_mail_section.anonymous = false

    to_mail_address = others_mail_section:option(DynamicList, "to_address", "to mail address")


    local apply = luci.http.formvalue("cbi.apply")
    if apply then
        io.popen("/etc/init.d/forward-mail stop")
        io.popen("/etc/init.d/forward-mail start &")
    end
else
    m.pageaction = false
end

return m
