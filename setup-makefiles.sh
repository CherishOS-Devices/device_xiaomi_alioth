#!/bin/bash
#
# Copyright (C) 2020 The LineageOS Project
# Copyright (C) 2021 Syberia Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=alioth
VENDOR=xiaomi

INITIAL_COPYRIGHT_YEAR=2021

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

SYBERIA_ROOT="${MY_DIR}/../../.."

HELPER="${SYBERIA_ROOT}/vendor/syberia/build/tools/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

# Initialize the helper for common
setup_vendor "${DEVICE}" "${VENDOR}" "${SYBERIA_ROOT}" true

# Copyright headers and guards
write_headers "alioth thyme"

# The standard common blobs
write_makefiles "${MY_DIR}/proprietary-files.txt" true

if [ -s "${MY_DIR}/../${DEVICE}/proprietary-files.txt" ]; then
    # Reinitialize the helper for device
    INITIAL_COPYRIGHT_YEAR="$DEVICE_BRINGUP_YEAR"
    setup_vendor "${DEVICE}" "${VENDOR}" "${SYBERIA_ROOT}" false

    # Copyright headers and guards
    write_headers

    # The standard device blobs
    write_makefiles "${MY_DIR}/../${DEVICE}/proprietary-files.txt" true

    # Finish
    write_footers
fi