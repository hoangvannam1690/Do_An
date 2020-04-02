#include <QtQml/qqmlprivate.h>
#include <QtCore/qdir.h>
#include <QtCore/qurl.h>

static const unsigned char qt_resource_tree[] = {
0,
0,0,0,0,2,0,0,0,2,0,0,0,1,0,0,0,
8,0,2,0,0,0,6,0,0,0,12,0,0,1,198,0,
2,0,0,0,8,0,0,0,3,0,0,2,102,0,0,0,
0,0,1,0,0,0,0,0,0,2,58,0,2,0,0,0,
1,0,0,0,11,0,0,2,172,0,0,0,0,0,1,0,
0,0,0,0,0,2,136,0,0,0,0,0,1,0,0,0,
0,0,0,2,194,0,0,0,0,0,1,0,0,0,0,0,
0,1,210,0,0,0,0,0,1,0,0,0,0,0,0,2,
18,0,0,0,0,0,1,0,0,0,0,0,0,1,242,0,
0,0,0,0,1,0,0,0,0,0,0,2,76,0,0,0,
0,0,1,0,0,0,0,0,0,0,140,0,2,0,0,0,
1,0,0,0,28,0,0,0,172,0,2,0,0,0,6,0,
0,0,22,0,0,0,20,0,2,0,0,0,1,0,0,0,
21,0,0,0,60,0,2,0,0,0,1,0,0,0,20,0,
0,0,100,0,2,0,0,0,1,0,0,0,19,0,0,1,
150,0,2,0,0,0,1,0,0,0,18,0,0,1,170,0,
0,0,0,0,1,0,0,0,0,0,0,0,116,0,0,0,
0,0,1,0,0,0,0,0,0,0,76,0,0,0,0,0,
1,0,0,0,0,0,0,0,36,0,0,0,0,0,1,0,
0,0,0,0,0,0,250,0,0,0,0,0,1,0,0,0,
0,0,0,1,34,0,0,0,0,0,1,0,0,0,0,0,
0,0,188,0,0,0,0,0,1,0,0,0,0,0,0,1,
104,0,0,0,0,0,1,0,0,0,0,0,0,1,66,0,
0,0,0,0,1,0,0,0,0,0,0,0,212,0,0,0,
0,0,1,0,0,0,0,0,0,0,152,0,0,0,0,0,
1,0,0,0,0};
static const unsigned char qt_resource_names[] = {
0,
1,0,0,0,47,0,47,0,3,0,0,72,112,0,65,0,
112,0,112,0,5,0,86,246,69,0,80,0,104,0,111,0,
110,0,101,0,9,6,72,253,220,0,80,0,104,0,111,0,
110,0,101,0,46,0,113,0,109,0,108,0,5,0,88,122,
255,0,82,0,97,0,100,0,105,0,111,0,9,11,2,232,
220,0,82,0,97,0,100,0,105,0,111,0,46,0,113,0,
109,0,108,0,5,0,92,250,191,0,86,0,105,0,100,0,
101,0,111,0,9,10,194,241,220,0,86,0,105,0,100,0,
101,0,111,0,46,0,113,0,109,0,108,0,3,0,0,83,
128,0,77,0,97,0,112,0,7,3,131,88,156,0,77,0,
97,0,112,0,46,0,113,0,109,0,108,0,5,0,83,186,
241,0,77,0,101,0,100,0,105,0,97,0,9,10,244,243,
92,0,77,0,101,0,100,0,105,0,97,0,46,0,113,0,
109,0,108,0,16,15,190,209,252,0,80,0,108,0,97,0,
121,0,108,0,105,0,115,0,116,0,86,0,105,0,101,0,
119,0,46,0,113,0,109,0,108,0,17,4,36,181,156,0,
66,0,117,0,116,0,116,0,111,0,110,0,67,0,111,0,
110,0,116,0,114,0,111,0,108,0,46,0,113,0,109,0,
108,0,13,10,44,131,252,0,65,0,112,0,112,0,72,0,
101,0,97,0,100,0,101,0,114,0,46,0,113,0,109,0,
108,0,16,14,142,217,124,0,83,0,119,0,105,0,116,0,
99,0,104,0,66,0,117,0,116,0,116,0,111,0,110,0,
46,0,113,0,109,0,108,0,20,13,141,71,188,0,77,0,
101,0,100,0,105,0,97,0,73,0,110,0,102,0,111,0,
67,0,111,0,110,0,116,0,114,0,111,0,108,0,46,0,
113,0,109,0,108,0,7,9,203,176,231,0,83,0,101,0,
116,0,116,0,105,0,110,0,103,0,11,0,253,195,92,0,
83,0,101,0,116,0,116,0,105,0,110,0,103,0,46,0,
113,0,109,0,108,0,3,0,0,88,60,0,81,0,109,0,
108,0,13,11,200,112,124,0,65,0,112,0,112,0,66,0,
117,0,116,0,116,0,111,0,110,0,46,0,113,0,109,0,
108,0,13,13,212,49,188,0,83,0,116,0,97,0,116,0,
117,0,115,0,66,0,97,0,114,0,46,0,113,0,109,0,
108,0,17,13,186,43,156,0,67,0,108,0,105,0,109,0,
97,0,116,0,101,0,87,0,105,0,100,0,103,0,101,0,
116,0,46,0,113,0,109,0,108,0,6,4,166,68,94,0,
67,0,111,0,109,0,109,0,111,0,110,0,10,11,104,113,
92,0,66,0,117,0,116,0,116,0,111,0,110,0,46,0,
113,0,109,0,108,0,14,1,178,252,188,0,72,0,111,0,
109,0,101,0,87,0,105,0,100,0,103,0,101,0,116,0,
46,0,113,0,109,0,108,0,15,8,43,169,156,0,77,0,
101,0,100,0,105,0,97,0,87,0,105,0,100,0,103,0,
101,0,116,0,46,0,113,0,109,0,108,0,8,8,1,90,
92,0,109,0,97,0,105,0,110,0,46,0,113,0,109,0,
108,0,13,10,204,234,60,0,77,0,97,0,112,0,87,0,
105,0,100,0,103,0,101,0,116,0,46,0,113,0,109,0,
108};
static const unsigned char qt_resource_empty_payout[] = { 0, 0, 0, 0, 0 };
QT_BEGIN_NAMESPACE
extern Q_CORE_EXPORT bool qRegisterResourceData(int, const unsigned char *, const unsigned char *, const unsigned char *);
QT_END_NAMESPACE
namespace QmlCacheGeneratedCode {
namespace _0x5f_Qml_MapWidget_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f_App_Setting_Setting_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f_App_Media_MediaInfoControl_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f_Qml_main_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f_App_Media_SwitchButton_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f_Qml_MediaWidget_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f_Qml_HomeWidget_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f_App_Map_Map_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f_App_Video_Video_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f_App_Media_AppHeader_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f_App_Radio_Radio_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f_Qml_Common_Button_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f_App_Media_ButtonControl_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f_App_Media_PlaylistView_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f_Qml_ClimateWidget_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f_App_Phone_Phone_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f_App_Media_Media_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f_Qml_StatusBar_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}
namespace _0x5f_Qml_AppButton_qml { 
    extern const unsigned char qmlData[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), nullptr, nullptr
    };
}

}
namespace {
struct Registry {
    Registry();
    QHash<QString, const QQmlPrivate::CachedQmlUnit*> resourcePathToCachedUnit;
    static const QQmlPrivate::CachedQmlUnit *lookupCachedUnit(const QUrl &url);
};

Q_GLOBAL_STATIC(Registry, unitRegistry)


Registry::Registry() {
        resourcePathToCachedUnit.insert(QStringLiteral("/Qml/MapWidget.qml"), &QmlCacheGeneratedCode::_0x5f_Qml_MapWidget_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/App/Setting/Setting.qml"), &QmlCacheGeneratedCode::_0x5f_App_Setting_Setting_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/App/Media/MediaInfoControl.qml"), &QmlCacheGeneratedCode::_0x5f_App_Media_MediaInfoControl_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/Qml/main.qml"), &QmlCacheGeneratedCode::_0x5f_Qml_main_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/App/Media/SwitchButton.qml"), &QmlCacheGeneratedCode::_0x5f_App_Media_SwitchButton_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/Qml/MediaWidget.qml"), &QmlCacheGeneratedCode::_0x5f_Qml_MediaWidget_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/Qml/HomeWidget.qml"), &QmlCacheGeneratedCode::_0x5f_Qml_HomeWidget_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/App/Map/Map.qml"), &QmlCacheGeneratedCode::_0x5f_App_Map_Map_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/App/Video/Video.qml"), &QmlCacheGeneratedCode::_0x5f_App_Video_Video_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/App/Media/AppHeader.qml"), &QmlCacheGeneratedCode::_0x5f_App_Media_AppHeader_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/App/Radio/Radio.qml"), &QmlCacheGeneratedCode::_0x5f_App_Radio_Radio_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/Qml/Common/Button.qml"), &QmlCacheGeneratedCode::_0x5f_Qml_Common_Button_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/App/Media/ButtonControl.qml"), &QmlCacheGeneratedCode::_0x5f_App_Media_ButtonControl_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/App/Media/PlaylistView.qml"), &QmlCacheGeneratedCode::_0x5f_App_Media_PlaylistView_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/Qml/ClimateWidget.qml"), &QmlCacheGeneratedCode::_0x5f_Qml_ClimateWidget_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/App/Phone/Phone.qml"), &QmlCacheGeneratedCode::_0x5f_App_Phone_Phone_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/App/Media/Media.qml"), &QmlCacheGeneratedCode::_0x5f_App_Media_Media_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/Qml/StatusBar.qml"), &QmlCacheGeneratedCode::_0x5f_Qml_StatusBar_qml::unit);
        resourcePathToCachedUnit.insert(QStringLiteral("/Qml/AppButton.qml"), &QmlCacheGeneratedCode::_0x5f_Qml_AppButton_qml::unit);
    QQmlPrivate::RegisterQmlUnitCacheHook registration;
    registration.version = 0;
    registration.lookupCachedQmlUnit = &lookupCachedUnit;
    QQmlPrivate::qmlregister(QQmlPrivate::QmlUnitCacheHookRegistration, &registration);
QT_PREPEND_NAMESPACE(qRegisterResourceData)(/*version*/0x01, qt_resource_tree, qt_resource_names, qt_resource_empty_payout);
}
const QQmlPrivate::CachedQmlUnit *Registry::lookupCachedUnit(const QUrl &url) {
    if (url.scheme() != QLatin1String("qrc"))
        return nullptr;
    QString resourcePath = QDir::cleanPath(url.path());
    if (resourcePath.isEmpty())
        return nullptr;
    if (!resourcePath.startsWith(QLatin1Char('/')))
        resourcePath.prepend(QLatin1Char('/'));
    return unitRegistry()->resourcePathToCachedUnit.value(resourcePath, nullptr);
}
}
int QT_MANGLE_NAMESPACE(qInitResources_qml)() {
    ::unitRegistry();
    Q_INIT_RESOURCE(qml_qmlcache);
    return 1;
}
Q_CONSTRUCTOR_FUNCTION(QT_MANGLE_NAMESPACE(qInitResources_qml))
int QT_MANGLE_NAMESPACE(qCleanupResources_qml)() {
    Q_CLEANUP_RESOURCE(qml_qmlcache);
    return 1;
}
