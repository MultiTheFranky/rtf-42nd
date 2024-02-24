// CUP Compatibility for suicide vest
class Land;
class Man: Land {
    class EventHandlers;
};
class Civilian_F;
class CUP_Creatures_Civil_Takistan_Base: Civilian_F {
    class EventHandlers;
};
class GVAR(Takistan_Base): CUP_Creatures_Civil_Takistan_Base {
    class EventHandlers: EventHandlers {
        init = "";
        class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
    };
};
