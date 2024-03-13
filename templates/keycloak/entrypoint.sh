#! /bin/sh
/opt/keycloak/bin/kc.sh build --transaction-xa-enabled=false --health-enabled=true &&
/opt/keycloak/bin/kc.sh start --optimized --proxy edge --hostname-strict=false
