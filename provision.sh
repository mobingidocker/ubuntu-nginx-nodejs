#!/bin/bash
set -e

## Stable
NAVE_NODEVER=4.4.4

git clone --depth 1 https://github.com/isaacs/nave.git ${NAVE_DIR}
/opt/nave/bin/nave install ${NAVE_NODEVER}
/opt/nave/bin/nave usemain ${NAVE_NODEVER}

