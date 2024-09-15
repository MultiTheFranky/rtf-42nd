class GVAR(Door): House_F {
    scope = 2;
    scopeCurator = 2;
    displayName = CSTRING(DoorDisplayName);
    author = ECSTRING(main,Author);
    editorCategory = QEGVAR(main,Items);
    editorSubcategory = QEGVAR(main,Structure);
    model = QPATHTOF(data\door\door.p3d);
    class AnimationSources {
        class Door_source {
            source = QUOTE(user);
            initPhase = 0;
            animPeriod = 1;
            sound = QUOTE(GenericDoorsSound);
        };
    };
    class UserActions {
        class OpenDoor {
            displayNameDefault = "<img image='\A3\Ui_f\data\IGUI\Cfg\Actions\open_door_ca.paa' size='2.5' />";
            displayName = CSTRING(OpenDoorDisplayName);
            position = QUOTE(Door_trigger);
            priority = 0.4;
            radius = 1.5;
            onlyForPlayer = 0;
            condition = QUOTE((this animationPhase 'Door_rot') < 0.5);
            statement = QUOTE((ARR_4([this,'Door_rot','Door_Handle_rot_1','Door_Handle_rot_2']) call FUNC(DoorOpen)));
        };
        class CloseDoor: OpenDoor {
            displayName = CSTRING(CloseDoorDisplayName);
            priority = 0.2;
            condition = QUOTE(((this animationPhase 'Door_rot') >= 0.5));
            statement = QUOTE(ARR_4([this,'Door_rot','Door_Handle_rot_1','Door_Handle_rot_2']) call FUNC(DoorClose));
        };
    };
    actionBegin1 = QUOTE(OpenDoor);
    actionEnd1 = QUOTE(CloseDoor);
    numberOfDoors = 1;
};