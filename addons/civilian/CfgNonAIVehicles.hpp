class CfgNonAIVehicles {
    class EmptyDetector;
    class GVAR(Location): EmptyDetector {
        scope = 0;
        icon = "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
        class AttributeValues {
            size2[] = {50,50};
            size3[] = {50,50,-1};
        };
        class Attributes {
            class Name {
                control = "Edit";
                property = "LocationName";
                displayName = "Name";
                tooltip = "Name of the location";
                expression = QUOTE(_this setVariable [ARR_2(QQGVAR(locationName),_value]));
                typeName = "STRING";
                defaultValue = "Town X";
            };

            class MaxNumberOfUnits {
                control = "EditShort";
                property = "LocationMaxNumberOfUnits";
                displayName = CSTRING(MaxCiviliansPerLocationDisplayName);
                tooltip = CSTRING(MaxCiviliansPerLocationDescription);
                expression = QUOTE(_this setVariable [ARR_2(QQGVAR(maxNumberOfUnits),_value]));
                typeName = "NUMBER";
                defaultValue = 30;
            };

            class MinNumberOfUnits {
                control = "EditShort";
                property = "LocationMinNumberOfUnits";
                displayName = CSTRING(MinCiviliansPerLocationDisplayName);
                tooltip = CSTRING(MinCiviliansPerLocationDescription);
                expression = QUOTE(_this setVariable [ARR_2(QQGVAR(minNumberOfUnits),_value]));
                typeName = "NUMBER";
                defaultValue = 10;
            };
        };
    };

    class GVAR(Town): GVAR(Location) {
        scope = 2;
        displayName = "Town";
        class AttributeValues {
            MaxNumberOfUnits = 50;
            MinNumberOfUnits = 20;
        };
    };

    class GVAR(Village): GVAR(Location) {
        scope = 2;
        displayName = "Village";
        class AttributeValues {
            MaxNumberOfUnits = 30;
            MinNumberOfUnits = 10;
        };
    };
};