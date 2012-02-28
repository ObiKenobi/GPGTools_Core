#!/bin/bash

disclaimer="A lot of your personal info is contained in this log! Please consider to edit it before sending if you don't wish to send us all that!"

echo "=============================================="
echo "DISCLAIMER"
echo "=============================================="
echo ""
echo "$disclaimer"
echo ""
echo "Press 'y' to continue..."
read n

if [ "y" != "$n" ] && [ "Y" != "$n" ]; then
  exit 1;
fi

echo ""
echo "=============================================="
echo "If you're asked for a user ID just press enter"
echo "=============================================="
:> $0.log
exec 3>&1 4>&2 >$0.log 2>&1

echo "*** Applications...";
echo "========================================================================="
[ ! -d /Applications/GPG\ Keychain\ Access.app ]; echo "  * GKA: $?";
[ ! -d /Library/Services/GPGServices.service ]; echo "  * GPGServices in /: $?";
[ ! -d "$HOME/Library/Services/GPGServices.service" ]; echo "  * GPGServices in '$HOME': $?";
[ ! -d /usr/local/MacGPG1 ]; echo "  * MacGPG1: $?";
[ ! -d /usr/local/MacGPG2 ]; echo "  * MacGPG2: $?";
[ ! -d /Library/Mail/Bundles/GPGMail.mailbundle ]; echo "  * GPGMail in /: $?";
[ ! -d "$HOME/Library/Mail/Bundles/GPGMail.mailbundle" ]; echo "  * GPGMail in '$HOME': $?";
[ ! -d /Library/PreferencePanes/GPGPreferences.prefPane ]; echo "  * GPGPref in /: $?";
[ ! -d "$HOME/Library/PreferencePanes/GPGPreferences.prefPane" ]; echo "  * GPGPref in '$HOME': $?";
echo "========================================================================="

echo "** MacGPG agent...";
echo "========================================================================="
[ ! -f /Library/LaunchAgents/org.gpgtools.macgpg2.gpg-agent.plist ]; echo "  * MacGPGAgent in /: $?";
[ ! -f "$HOME/Library/LaunchAgents/org.gpgtools.macgpg2.gpg-agent.plist" ]; echo "  * MacGPGAgent in '$HOME': $?";
[ ! -S "$HOME/.gnupg/S.gpg-agent" ]; echo "  * MacGPGAgent has a socket: $?";
[ "`launchctl list|grep gpg-agent`" == "" ]; echo "  * MacGPGAgent in launchd: $?";
[ "`ps waux|grep gpg-agent|grep -v grep`" == "" ]; echo "  * MacGPGAgent running: $?";
echo -n "  * Path to agent: "; which gpg-agent;
echo -n "  * Is agent running (directly): "; /usr/local/MacGPG2/bin/gpg-agent
echo -n "  * Version of agent: "; gpg-agent --version
echo -n "  * Version of agent (directly): "; /usr/local/MacGPG2/bin/gpg-agent --version;
echo "========================================================================="

echo "*** Permissions...";
echo "========================================================================="
echo -n " * LS: "; ls -lad /Library/Services/
echo -n " * LSG: "; ls -lad /Library/Services/GPGServices.service
echo -n " * HLS: "; ls -lad "$HOME/Library/Services/"
echo -n " * HLSG: "; ls -lad "$HOME/Library/Services/GPGServices.service"
echo -n " * UL: "; ls -lad /usr/local/
echo -n " * UL1: "; ls -lad /usr/local/MacGPG1
echo -n " * UL2: "; ls -lad /usr/local/MacGPG2
echo -n " * LMB: "; ls -lad /Library/Mail/Bundles
echo -n " * HLMB: "; ls -lad "$HOME/Library/Mail/Bundles"
echo -n " * LMBG: "; ls -lad /Library/Mail/Bundles/GPGMail.mailbundle
echo -n " * HLMBG: "; ls -lad "$HOME/Library/Mail/Bundles/GPGMail.mailbundle"
echo -n " * HG: "; ls -lade "$HOME/.gnupg"
echo -n " * HGS: "; ls -lade "$HOME/.gnupg/S.gpg-agent"
echo "========================================================================="

echo "*** Setup...";
YOURKEY="`grep ^default-key '$HOME/.gnupg/gpg.conf'|awk '{print $2}'`"
echo "  * Default key: $YOURKEY";


echo "*** Showing installed binaries...";
bin="`which gpg`"; echo "  * GPG1: `ls -l $bin`"; gpg --version;
bin="`which gpg2`"; echo "  * GPG2: `ls -l $bin`"; gpg2 --version;

echo "*** Testing configuration...";
gpg2 --gpgconf-test; echo "  * Config check: $?";

echo "*** The secret keys:";
echo "  * GPG1:"
gpg -K
echo "  * GPG2:"
gpg2 -K

echo "*** Testing encryption (1/2)...";
if [ ! ""  == "$YOURKEY" ]; then
  echo "  * GPG1:"
  echo "test"|gpg -aer "$YOURKEY"|gpg
  echo "  * GPG2:"
  echo "test"|gpg2 -aer "$YOURKEY"|gpg2
fi

echo "*** Testing encryption (2/2)...";
echo "  * GPG1:"
echo "test"|gpg -ae --default-recipient-self|gpg
echo "  * GPG2:"
echo "test"|gpg2 -ae --default-recipient-self|gpg2
echo "test"|gpg2 --default-recipient-self -ae
echo "test"|gpg2 -as
echo "test"|gpg2 --default-recipient-self -aes

echo "*** Showing installed bundles...";
echo "  * /L/M/B:"
ls -lad /Library/Mail/Bundles*
ls -l /Library/Mail/Bundles*
echo "  * '$HOME/L/M/B':"
ls -lad "$HOME"/Library/Mail/Bundles*
ls -l "$HOME"/Library/Mail/Bundles*

echo "*** Bundle configuration...";
echo "  * Bundles enabled: ";
defaults read com.apple.mail EnableBundles
echo "  * Bundles compatibility: ";
defaults read com.apple.mail BundleCompatibilityVersion

echo "*** More about the configuration...";
uname -a
ls -lae "$HOME/.gnupg/"
file "$HOME/.gnupg/S.gpg-agent"
cat "$HOME/.gnupg/gpg.conf"
mount

echo "*** Some debugging information...";
defaults write org.gpgtools.gpgmail GPGMailDebug -int 1
/Applications/Mail.app/Contents/MacOS/Mail &
sleep 2
defaults write org.gpgtools.gpgmail GPGMailDebug -int 0
exec 1>&3 2>&4

echo "Thank you. Please send the file `pwd`/$0.log to gpgtools-devel@lists.gpgtools.org";

echo "tell application \"Mail\"
    activate
    set MyEmail to make new outgoing message with properties {visible:true, subject:\"Debugging GPGTools\", content:\"DISCLAIMER: $disclaimer\n\n\n\"}
    tell MyEmail
        make new to recipient at end of to recipients with properties {address:\"gpgtools-org@lists.gpgtools.org\"}
        make new attachment with properties {file name:((\"`pwd`/$0.log\" as POSIX file) as alias)}
    end tell
end tell
" | osascript
