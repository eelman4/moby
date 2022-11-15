#!/usr/bin/env bash

set -e

SCRIPTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOTDIR="$(git -C "$SCRIPTDIR" rev-parse --show-toplevel)"

# ensure that the sort order is not locale-dependent
export LC_ALL=C.UTF-8 

set -x

# see also ".mailmap" for how email addresses and names are deduplicated
tee "${ROOTDIR}/AUTHORS" <<-EOF
	# This file is @generated and lists all contributors to the repository.
	# See hack/generate-authors.sh to make modifications.

	$(git -C "$ROOTDIR" log --format='%aN <%aE>' | sort -uf)
EOF
