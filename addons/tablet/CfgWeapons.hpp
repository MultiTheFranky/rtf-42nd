class CfgWeapons {
	class ItemCore;
 	class InventoryItem_Base_F;
    class GVAR(Tablet): ItemCore {
        descriptionshort = "Super Tablet";//CSTRING(tabletDescriptionShort);
        descriptionuse = "<t color='#9cf953'>Use: </t>Show Commander's Tablet"; //CSTRING(tabletDescriptionUse);
        displayname = "Tablet"; //CSTRING(tabletDisplayName);
        picture = QPATHTOF(ui\icon_tablet.paa);
        model = QPATHTOF(data\tablet.p3d);
        scope = 2;
        simulation = "ItemGPS";
        class ItemInfo {
            mass = 56;
        };
        author = ECSTRING(main,Author);
    };
};