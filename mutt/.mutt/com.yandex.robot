# GENERAL OPTIONS
set header_cache = ~/.mutt/com.yandex.robot/cache/headers
set message_cachedir = ~/.mutt/com.yandex.robot/cache/bodies

unmailboxes *
# RECEIVE OPTIONS
set imap_user = "mr.robot.de@yandex.com"
set imap_pass = "PASSWORDxxj"
#set imap_check_subscribed
#unset imap_passive
#set imap_keepalive = 900
#set mail_check     = 1800

# REMOTE YANDEX FOLDERS
set folder    = "imaps://imap.yandex.com:993"
set spoolfile = "+INBOX"
set postponed = "+[Yandex]/Drafts"


# SEND OPTIONS
set ssl_starttls  = yes
set ssl_force_tls = yes
set realname      = "Mr. Robot"
set from          = "mr.robot.de@yandex.com"
set smtp_url      = "smtps://mr.robot.de@smtp.yandex.com:465/"
set smtp_pass 	  = "password"



mailboxes "+---- Yandex Mailbox -----"
set spoolfile = +INBOX
set postponed = +Draft
set record=+Sent
mailboxes +INBOX
mailboxes +Drafts
mailboxes +Sent
