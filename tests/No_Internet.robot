# *** Setting ***
# Resource              ../resource.robot
# Suite Setup           Spawn Appium Server
# Suite Teardown        Close Appium Server
# Test Teardown         Close All Applications
# Force Tags            Open
#
# *** Test Case ***
# Disable Connection
#   [Documentation]           I will test some feature without Internet Connection
#   [Setup]                   Open BBM App
#   Wifi                      Disable
#   Airplane                  1
