#!/bin/bash

INSTALL_DIR=/opt/spc-web-gateway
CERT=$INSTALL_DIR/auth/ssl_certificate.pem

install -m 755 -p -d ${INSTALL_DIR}
install -m 755 -p spc-web-gateway ${INSTALL_DIR}
install -m 644 -p config.xml ${INSTALL_DIR}
install -m 644 -p SPC_WEB_GATEWAY_EULA.txt ${INSTALL_DIR}
install -m 644 -p VERSION ${INSTALL_DIR}

install -m 755 -p -d ${INSTALL_DIR}/auth
install -m 644 -p auth/edp_key ${INSTALL_DIR}/auth
install -m 644 -p auth/passwd_get ${INSTALL_DIR}/auth
install -m 644 -p auth/passwd_put ${INSTALL_DIR}/auth
install -m 644 -p auth/passwd_ws ${INSTALL_DIR}/auth
install -m 644 -p auth/ssl_certificate.pem ${INSTALL_DIR}/auth
install -m 644 -p auth/license ${INSTALL_DIR}/auth

install -m 755 -p -d ${INSTALL_DIR}/www
install -m 644 -p www/index.html ${INSTALL_DIR}/www

# regenerate certificate
openssl req -new -x509 -newkey rsa:2048 -keyout $CERT -out $CERT -days 4000 -subj "/CN=spc-web-gateway" -nodes
chgrp $SPC_GW_USER $CERT
chmod 440 $CERT
