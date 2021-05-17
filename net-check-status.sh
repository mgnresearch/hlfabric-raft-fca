#!/bin/bash
# ----------
# SPDX-License-Identifier: Apache-2.0
# ----------
#

echo "TLS Control"
./tlsrcontrol/tlsrcontrol-check-status.sh

echo "Corp Trading"
./corptrading/corptrading-check-status.sh

echo "Corp Brasilia"
./corpbrasilia/corpbrasilia-check-status.sh

# echo "Corp Lisboa"
# ./corplisboa/corplisboa-check-status.sh

# echo "Corp Maputo"
# ./corpmaputo/corpmaputo-check-status.sh

echo " --- END ---"
