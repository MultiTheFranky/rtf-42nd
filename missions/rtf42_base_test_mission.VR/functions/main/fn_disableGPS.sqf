[] spawn {
	while { true } do {
		sleep 60;
		player enableInfoPanelComponent ["left", "MinimapDisplay", false];
		player enableInfoPanelComponent ["right", "MinimapDisplay", false];
	};
};