// spell-checker:disable

// Add the preferences you want to force here.
// They will be forced for each session, but only in profiles containing this file.

// Issue: Firefox tab crashes "Gah. Your tab just crashed."
// Mitigate the tab crashing problem by forcing the following preferences:
// user_pref("browser.tabs.remote.autostart", false);

// Disable WebRTC leaks as explained in https://ipleak.net/#webrtcleak
// user_pref("media.peerconnection.enabled", false);
