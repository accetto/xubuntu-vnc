// spell-checker:disable

// Add the preferences you want to force here.
// They will be forced for each session, but only in profiles containing this file.

// Disable WebRTC leaks as explained in https://ipleak.net/#webrtcleak
// user_pref("media.peerconnection.enabled", false);

// Issue #3: Firefox tab crashes "Gah. Your tab just crashed."
// Mitigate the tab crashing problem by forcing the following preferences.
// Saddly, this does not seem to help with the versions '68.0' and also '68.0.1'.
// I'm keeping it as the last hope for a case.
// user_pref("browser.tabs.remote.autostart", false);
// user_pref("browser.tabs.remote.autostart.2", false);

// Issue #2: Firefox prompting 'Firefox can't update to the latest version.'
// This was a temporary and an experimental try to disable Firefox automatic updates
// because of keeping the version '67.0.4' because of crashing version '68.0' (issue #3).
// Version 67.0.4 (explicit from mozilla) (LastVersion=67.0.4_20190619235627/20190619235627)
// (http://releases.mozilla.org/pub/firefox/releases/67.0.4/linux-x86_64/en-US/firefox-67.0.4.tar.bz2)
// Result: These settings do not help. The prompt still shows up.
// user_pref("app.update.auto", false);
// user_pref("app.update.enabled", false);
// user_pref("browser.sessionstore.debug.no_auto_updates", true);
// user_pref("browser.sessionstore.upgradeBackup.latestBuildID", "20190619235627");
