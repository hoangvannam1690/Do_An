/*
 * This file was generated by qdbusxml2cpp version 0.8
 * Command line was: qdbusxml2cpp -p climate_interface.h: Dbus/climate.xml
 *
 * qdbusxml2cpp is Copyright (C) 2019 The Qt Company Ltd.
 *
 * This is an auto-generated file.
 * Do not edit! All changes made to it will be lost.
 */

#ifndef CLIMATE_INTERFACE_H
#define CLIMATE_INTERFACE_H

#include <QtCore/QObject>
#include <QtCore/QByteArray>
#include <QtCore/QList>
#include <QtCore/QMap>
#include <QtCore/QString>
#include <QtCore/QStringList>
#include <QtCore/QVariant>
#include <QtDBus/QtDBus>

/*
 * Proxy class for interface local.Climate
 */
class LocalClimateInterface: public QDBusAbstractInterface
{
    Q_OBJECT
public:
    static inline const char *staticInterfaceName()
    { return "local.Climate"; }

public:
    LocalClimateInterface(const QString &service, const QString &path, const QDBusConnection &connection, QObject *parent = nullptr);

    ~LocalClimateInterface();

public Q_SLOTS: // METHODS
    inline QDBusPendingReply<int> getAuto_mode()
    {
        QList<QVariant> argumentList;
        return asyncCallWithArgumentList(QStringLiteral("getAuto_mode"), argumentList);
    }

    inline QDBusPendingReply<int> getDriverWind_mode()
    {
        QList<QVariant> argumentList;
        return asyncCallWithArgumentList(QStringLiteral("getDriverWind_mode"), argumentList);
    }

    inline QDBusPendingReply<int> getFan_speed()
    {
        QList<QVariant> argumentList;
        return asyncCallWithArgumentList(QStringLiteral("getFan_speed"), argumentList);
    }

    inline QDBusPendingReply<int> getPassengerWind_mode()
    {
        QList<QVariant> argumentList;
        return asyncCallWithArgumentList(QStringLiteral("getPassengerWind_mode"), argumentList);
    }

    inline QDBusPendingReply<int> getSync_mode()
    {
        QList<QVariant> argumentList;
        return asyncCallWithArgumentList(QStringLiteral("getSync_mode"), argumentList);
    }

    inline QDBusPendingReply<double> getTemp_driver()
    {
        QList<QVariant> argumentList;
        return asyncCallWithArgumentList(QStringLiteral("getTemp_driver"), argumentList);
    }

    inline QDBusPendingReply<double> getTemp_passenger()
    {
        QList<QVariant> argumentList;
        return asyncCallWithArgumentList(QStringLiteral("getTemp_passenger"), argumentList);
    }

    inline QDBusPendingReply<> setData(double temp_driver, double temp_passenger, int fan_speed, int driver_wind_mode, int passenger_wind_mode, int auto_mode, int sync_mode)
    {
        QList<QVariant> argumentList;
        argumentList << QVariant::fromValue(temp_driver) << QVariant::fromValue(temp_passenger) << QVariant::fromValue(fan_speed) << QVariant::fromValue(driver_wind_mode) << QVariant::fromValue(passenger_wind_mode) << QVariant::fromValue(auto_mode) << QVariant::fromValue(sync_mode);
        return asyncCallWithArgumentList(QStringLiteral("setData"), argumentList);
    }

Q_SIGNALS: // SIGNALS
    void dataChanged();
};

namespace local {
  typedef ::LocalClimateInterface Climate;
}
#endif
