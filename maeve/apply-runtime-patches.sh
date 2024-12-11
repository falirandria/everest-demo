#!/usr/bin/env bash

export CSMS_SP1_URL="ws://172.17.0.1/ws/cp001"
export CSMS_SP2_URL="wss://172.17.0.1/ws/cp001"
export CSMS_SP3_URL="wss://172.17.0.1/ws/cp001"

  if [[ "$DEMO_VERSION" =~ sp2 || "$DEMO_VERSION" =~ sp3 ]]; then
    echo "Patching the CSMS to enable EVerest organization"
    patch -p1 -i maeve-csms-everest-org.patch

    echo "Patching the CSMS to enable local mo root"
    patch -p1 -i maeve-csms-local-mo-root.patch

  else
    echo "Patching the CSMS to disable WSS"
    patch -p1 -i maeve-csms-no-wss.patch
  fi

