class GVAR(intel_document_wrinkled): Leaflet_05_F {
    scope = 2;
    scopeCurator = 2;
    displayName = CSTRING(intel_document_wrinkledDisplayName);
    author = ECSTRING(main,Author);
    editorCategory = QEGVAR(main,Items);
    editorSubcategory = QEGVAR(main,Props);
    hiddenSelectionsTextures[] = {QPATHTOF(data\intel_document\intel_document_ca.paa)};
    editorPreview = QPATHTOF(data\intel_document\intel_document_wrinkled.jpg);
    #include "actions.hpp"
};

class GVAR(intel_document): Leaflet_05_New_F {
    scope = 2;
    scopeCurator = 2;
    displayName = CSTRING(intel_documentDisplayName);
    author = ECSTRING(main,Author);
    editorCategory = QEGVAR(main,Items);
    editorSubcategory = QEGVAR(main,Props);
    model = QPATHTOF(data\intel_document\intel_document.p3d);
    hiddenSelectionsTextures[] = {QPATHTOF(data\intel_document\intel_document_ca.paa)};
    editorPreview = QPATHTOF(data\intel_document\intel_document.jpg);
    #include "actions.hpp"
};

class GVAR(multi_intel_document): GVAR(intel_document) {
    scope = 2;
    scopeCurator = 2;
    displayName = CSTRING(multi_intel_documentDisplayName);
    author = ECSTRING(main,Author);
    editorCategory = QEGVAR(main,Items);
    editorSubcategory = QEGVAR(main,Props);
    hiddenSelectionsTextures[] = {QPATHTOF(data\intel_document\intel_document_multi_ca.paa)};
    editorPreview = QPATHTOF(data\intel_document\intel_document_multi.jpg);
    #include "actions.hpp"
};

class GVAR(top_secret_intel_document): GVAR(intel_document) {
    scope = 2;
    scopeCurator = 2;
    displayName = CSTRING(top_secret_intel_documentDisplayName);
    author = ECSTRING(main,Author);
    editorCategory = QEGVAR(main,Items);
    editorSubcategory = QEGVAR(main,Props);
    hiddenSelectionsTextures[] = {QPATHTOF(data\intel_document\intel_document_top_secret_ca.paa)};
    editorPreview = QPATHTOF(data\intel_document\intel_document_top_secret.jpg);
    #include "actions.hpp"
};

class GVAR(missile_intel_document): GVAR(intel_document) {
    scope = 2;
    scopeCurator = 2;
    displayName = CSTRING(missile_intel_documentDisplayName);
    author = ECSTRING(main,Author);
    editorCategory = QEGVAR(main,Items);
    editorSubcategory = QEGVAR(main,Props);
    hiddenSelectionsTextures[] = {QPATHTOF(data\intel_document\intel_document_missile_ca.paa)};
    editorPreview = QPATHTOF(data\intel_document\intel_document_missile.jpg);
    #include "actions.hpp"
};