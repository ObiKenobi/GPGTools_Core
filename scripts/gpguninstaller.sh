#!/bin/bash

if [ ! "$UID" == "0" ]; then
    echo "You've to be root";
    exit 1;
fi

echo "WARNING: this will remove MacGPG1 and MacGPG2 from your system!"
echo "Press ctrl+c to cancel.";
read

echo "Removing MacGPG2 >= 2.0.17...";
rm -f /usr/local/bin/gpg-agent
rm -f /usr/local/bin/gpg2
rm -fr /usr/local/MacGPG2
rm -f /Library/LaunchAgents/com.sourceforge.macgpg2.gpg-agent.plist
rm -f /Library/LaunchAgents/org.gpgtools.macgpg2.gpg-agent.plist
rm -f /private/etc/paths.d/MacGPG2
rm -f /private/etc/man.d/MacGPG2

echo "Removing MacGPG1...";
rm -f /usr/local/bin/gpg
rm -fr /usr/local/MacGPG1
rm -f /private/etc/paths.d/MacGPG1
rm -f /private/etc/man.d/MacGPG1

echo "WARNING: this will remove other gpg1 and gpg2 installations!"
echo "WARNING: the next steps might break your system!"
echo "You might want to remove gpg using brew/macports/fink/... instead.";
echo "Press ctrl+c to cancel.";
read

echo "Removing MacGPG2 <= 2.0.16 and other gpg2 installations...";
rm -fr /Applications/start-gpg-agent.app
rm -f /usr/local/lib/charset.alias
rm -fr /usr/local/lib/gettext
rm -f /usr/local/lib/libasprintf.0.0.0.dylib
rm -f /usr/local/lib/libasprintf.0.dylib
rm -f /usr/local/lib/libasprintf.dylib
rm -f /usr/local/lib/libasprintf.la
rm -f /usr/local/lib/libgettextlib-0.17.dylib
rm -f /usr/local/lib/libgettextlib.dylib
rm -f /usr/local/lib/libgettextlib.la
rm -f /usr/local/lib/libgettextpo.0.4.0.dylib
rm -f /usr/local/lib/libgettextpo.0.dylib
rm -f /usr/local/lib/libgettextpo.dylib
rm -f /usr/local/lib/libgettextpo.la
rm -f /usr/local/lib/libgettextsrc-0.17.dylib
rm -f /usr/local/lib/libgettextsrc.dylib
rm -f /usr/local/lib/libgettextsrc.la
rm -f /usr/local/lib/libintl.8.0.2.dylib
rm -f /usr/local/lib/libintl.8.dylib
rm -f /usr/local/lib/libintl.dylib
rm -f /usr/local/lib/libintl.la
rm -f /usr/local/bin/gpg-agent
rm -f /usr/local/bin/gpg-connect-agent
rm -f /usr/local/bin/gpg2
rm -f /usr/local/bin/gpgconf
rm -f /usr/local/bin/gpgkey2ssh
rm -f /usr/local/bin/gpgparsemail
rm -f /usr/local/bin/gpgsm
rm -f /usr/local/bin/gpgsm-gencert.sh
rm -f /usr/local/bin/gpgv2
rm -f /usr/local/bin/kbxutil
rm -f /usr/local/bin/scdaemon
rm -f /usr/local/bin/watchgnupg
rm -f /usr/local/libexec/gnupg-pcsc-wrapper
rm -f /usr/local/libexec/gpg-check-pattern
rm -f /usr/local/libexec/gpg-preset-passphrase
rm -f /usr/local/libexec/gpg-protect-tool
rm -f /usr/local/libexec/gpg2keys_curl
rm -f /usr/local/libexec/gpg2keys_finger
rm -f /usr/local/libexec/gpg2keys_hkp
rm -f /usr/local/libexec/gpg2keys_ldap
rm -f /usr/local/sbin/addgnupghome
rm -f /usr/local/sbin/applygnupgdefaults
rm -fr /usr/local/share/doc/gnupg
rm -fr /usr/local/share/gnupg
rm -f /usr/local/share/info/gnupg.info
rm -f /usr/local/share/info/gnupg.info-1
rm -f /usr/local/share/info/gnupg.info-2
rm -f /usr/local/share/locale/be/LC_MESSAGES/gnupg2.mo
rm -f /usr/local/share/locale/ca/LC_MESSAGES/gnupg2.mo
rm -f /usr/local/share/locale/cs/LC_MESSAGES/gnupg2.mo
rm -f /usr/local/share/locale/da/LC_MESSAGES/gnupg2.mo
rm -f /usr/local/share/locale/de/LC_MESSAGES/gnupg2.mo
rm -f /usr/local/share/locale/el/LC_MESSAGES/gnupg2.mo
rm -f /usr/local/share/locale/en@boldquot/LC_MESSAGES/gnupg2.mo
rm -f /usr/local/share/locale/en@quot/LC_MESSAGES/gnupg2.mo
rm -f /usr/local/share/locale/eo/LC_MESSAGES/gnupg2.mo
rm -f /usr/local/share/locale/es/LC_MESSAGES/gnupg2.mo
rm -f /usr/local/share/locale/et/LC_MESSAGES/gnupg2.mo
rm -f /usr/local/share/locale/fi/LC_MESSAGES/gnupg2.mo
rm -f /usr/local/share/locale/fr/LC_MESSAGES/gnupg2.mo
rm -f /usr/local/share/locale/gl/LC_MESSAGES/gnupg2.mo
rm -f /usr/local/share/locale/hu/LC_MESSAGES/gnupg2.mo
rm -f /usr/local/share/locale/id/LC_MESSAGES/gnupg2.mo
rm -f /usr/local/share/locale/it/LC_MESSAGES/gnupg2.mo
rm -f /usr/local/share/locale/ja/LC_MESSAGES/gnupg2.mo
rm -f /usr/local/share/locale/nb/LC_MESSAGES/gnupg2.mo
rm -f /usr/local/share/locale/pl/LC_MESSAGES/gnupg2.mo
rm -f /usr/local/share/locale/pt/LC_MESSAGES/gnupg2.mo
rm -f /usr/local/share/locale/pt_BR/LC_MESSAGES/gnupg2.mo
rm -f /usr/local/share/locale/ro/LC_MESSAGES/gnupg2.mo
rm -f /usr/local/share/locale/ru/LC_MESSAGES/gnupg2.mo
rm -f /usr/local/share/locale/sk/LC_MESSAGES/gnupg2.mo
rm -f /usr/local/share/locale/sv/LC_MESSAGES/gnupg2.mo
rm -f /usr/local/share/locale/tr/LC_MESSAGES/gnupg2.mo
rm -f /usr/local/share/locale/zh_CN/LC_MESSAGES/gnupg2.mo
rm -f /usr/local/share/locale/zh_TW/LC_MESSAGES/gnupg2.mo
rm -f /usr/local/share/man/man1/gpg-agent.1
rm -f /usr/local/share/man/man1/gpg-connect-agent.1
rm -f /usr/local/share/man/man1/gpg-preset-passphrase.1
rm -f /usr/local/share/man/man1/gpg-zip.1
rm -f /usr/local/share/man/man1/gpg2.1
rm -f /usr/local/share/man/man1/gpgconf.1
rm -f /usr/local/share/man/man1/gpgparsemail.1
rm -f /usr/local/share/man/man1/gpgsm-gencert.sh.1
rm -f /usr/local/share/man/man1/gpgsm.1
rm -f /usr/local/share/man/man1/gpgv2.1
rm -f /usr/local/share/man/man1/scdaemon.1
rm -f /usr/local/share/man/man1/symcryptrun.1
rm -f /usr/local/share/man/man1/watchgnupg.1
rm -f /usr/local/share/man/man8/addgnupghome.8
rm -f /usr/local/share/man/man8/applygnupgdefaults.8
rm -f /usr/local/lib/libassuan.0.dylib
rm -f /usr/local/lib/libassuan.dylib
rm -f /usr/local/lib/libassuan.la
rm -f /usr/local/bin/dumpsexp
rm -f /usr/local/bin/hmac256
rm -f /usr/local/lib/libgcrypt.11.6.0.dylib
rm -f /usr/local/lib/libgcrypt.11.dylib
rm -f /usr/local/lib/libgcrypt.dylib
rm -f /usr/local/lib/libgcrypt.la
rm -f /usr/local/bin/gpg-error
rm -f /usr/local/lib/libgpg-error.0.dylib
rm -f /usr/local/lib/libgpg-error.dylib
rm -f /usr/local/lib/libgpg-error.la
rm -f /usr/local/lib/charset.alias
rm -f /usr/local/lib/libcharset.1.dylib
rm -f /usr/local/lib/libcharset.dylib
rm -f /usr/local/lib/libcharset.la
rm -f /usr/local/lib/libiconv.2.dylib
rm -f /usr/local/lib/libiconv.dylib
rm -f /usr/local/lib/libiconv.la
rm -f /usr/local/lib/libksba.8.9.6.dylib
rm -f /usr/local/lib/libksba.8.dylib
rm -f /usr/local/lib/libksba.dylib
rm -f /usr/local/lib/libksba.la
rm -f /usr/local/lib/libusb-1.0.0.dylib
rm -f /usr/local/lib/libusb-1.0.dylib
rm -f /usr/local/lib/libusb-1.0.la
rm -f /usr/local/lib/libusb-0.1.4.dylib
rm -f /usr/local/lib/libusb.dylib
rm -f /usr/local/lib/libusb.la
rm -f /usr/local/lib/libpth.20.0.27.dylib
rm -f /usr/local/lib/libpth.20.dylib
rm -f /usr/local/lib/libpth.dylib
rm -f /usr/local/lib/libpth.la
rm -fr /usr/local/pinentry-mac.app

echo "Removing other gpg1 installations...";
rm -f /usr/local/bin/gpg
rm -f /usr/local/bin/gpg-agent
rm -f /usr/local/bin/gpg-error
rm -f /usr/local/bin/gpg-zip
rm -f /usr/local/bin/gpgsplit
rm -f /usr/local/bin/gpgv
rm -f /usr/local/bin/hmac256
rm -f /usr/local/lib/charset.alias
rm -f /usr/local/lib/libassuan.0.dylib
rm -f /usr/local/lib/libassuan.dylib
rm -f /usr/local/lib/libassuan.la
rm -f /usr/local/lib/libgcrypt.11.6.0.dylib
rm -f /usr/local/lib/libgcrypt.11.dylib
rm -f /usr/local/lib/libgcrypt.a
rm -f /usr/local/lib/libgcrypt.dylib
rm -f /usr/local/lib/libgcrypt.la
rm -f /usr/local/lib/libgpg-error.0.dylib
rm -f /usr/local/lib/libgpg-error.dylib
rm -f /usr/local/lib/libgpg-error.la
rm -f /usr/local/lib/libksba.8.dylib
rm -f /usr/local/lib/libksba.dylib
rm -f /usr/local/lib/libksba.la
rm -f /usr/local/lib/libpth.20.0.27.dylib
rm -f /usr/local/lib/libpth.20.dylib
rm -f /usr/local/lib/libpth.a
rm -f /usr/local/lib/libpth.dylib
rm -f /usr/local/lib/libpth.la
rm -fr /usr/local/libexec/gnupg
rm -f /usr/local/libexec/gpg-preset-passphrase
rm -f /usr/local/libexec/gpg-protect-tool
rm -fr /usr/local/share/gnupg
rm -f /usr/local/share/locale/be/LC_MESSAGES/gnupg.mo
rm -f /usr/local/share/locale/ca/LC_MESSAGES/gnupg.mo
rm -f /usr/local/share/locale/cs/LC_MESSAGES/gnupg.mo
rm -f /usr/local/share/locale/da/LC_MESSAGES/gnupg.mo
rm -f /usr/local/share/locale/de/LC_MESSAGES/gnupg.mo
rm -f /usr/local/share/locale/el/LC_MESSAGES/gnupg.mo
rm -f /usr/local/share/locale/en@boldquot/LC_MESSAGES/gnupg.mo
rm -f /usr/local/share/locale/en@quot/LC_MESSAGES/gnupg.mo
rm -f /usr/local/share/locale/eo/LC_MESSAGES/gnupg.mo
rm -f /usr/local/share/locale/es/LC_MESSAGES/gnupg.mo
rm -f /usr/local/share/locale/et/LC_MESSAGES/gnupg.mo
rm -f /usr/local/share/locale/fi/LC_MESSAGES/gnupg.mo
rm -f /usr/local/share/locale/fr/LC_MESSAGES/gnupg.mo
rm -f /usr/local/share/locale/gl/LC_MESSAGES/gnupg.mo
rm -f /usr/local/share/locale/hu/LC_MESSAGES/gnupg.mo
rm -f /usr/local/share/locale/id/LC_MESSAGES/gnupg.mo
rm -f /usr/local/share/locale/it/LC_MESSAGES/gnupg.mo
rm -f /usr/local/share/locale/ja/LC_MESSAGES/gnupg.mo
rm -f /usr/local/share/locale/locale.alias
rm -f /usr/local/share/locale/nb/LC_MESSAGES/gnupg.mo
rm -f /usr/local/share/locale/nl/LC_MESSAGES/gnupg.mo
rm -f /usr/local/share/locale/pl/LC_MESSAGES/gnupg.mo
rm -f /usr/local/share/locale/pt/LC_MESSAGES/gnupg.mo
rm -f /usr/local/share/locale/pt_BR/LC_MESSAGES/gnupg.mo
rm -f /usr/local/share/locale/ro/LC_MESSAGES/gnupg.mo
rm -f /usr/local/share/locale/ru/LC_MESSAGES/gnupg.mo
rm -f /usr/local/share/locale/sk/LC_MESSAGES/gnupg.mo
rm -f /usr/local/share/locale/sv/LC_MESSAGES/gnupg.mo
rm -f /usr/local/share/locale/tr/LC_MESSAGES/gnupg.mo
rm -f /usr/local/share/locale/zh_CN/LC_MESSAGES/gnupg.mo
rm -f /usr/local/share/locale/zh_TW/LC_MESSAGES/gnupg.mo
rm -f /usr/local/share/man/man1/gpg-zip.1
rm -f /usr/local/share/man/man1/gpg.1
rm -f /usr/local/share/man/man1/gpg.ru.1
rm -f /usr/local/share/man/man1/gpgv.1
rm -f /usr/local/share/man/man7/gnupg.7
rm -f /usr/local/bin/gpg-agent
rm -fr /usr/local/libexec/start-gpg-agent.app
rm -fr /usr/local/libexec/pinentry-mac.app
