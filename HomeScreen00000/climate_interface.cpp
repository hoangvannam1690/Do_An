/*
 * This file was generated by qdbusxml2cpp version 0.8
 * Command line was: qdbusxml2cpp -i climate_interface.h -p :climate_interface.cpp Dbus/climate.xml
 *
 * qdbusxml2cpp is Copyright (C) 2019 The Qt Company Ltd.
 *
 * This is an auto-generated file.
 * This file may have been hand-edited. Look for HAND-EDIT comments
 * before re-generating it.
 */

#include "climate_interface.h"
/*
 * Implementation of interface class LocalClimateInterface
 */

LocalClimateInterface::LocalClimateInterface(const QString &service, const QString &path, const QDBusConnection &connection, QObject *parent)
    : QDBusAbstractInterface(service, path, staticInterfaceName(), connection, parent)
{
}

LocalClimateInterface::~LocalClimateInterface()
{
}

