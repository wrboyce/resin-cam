#!/usr/bin/env bash

# Copyright 2017 Will Boyce
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

main() {
    local fswebcam_args=() w="${TIMELAPSE_DELTA-3}"
    fswebcam_args+=("--quiet")
    test -n "${CAPTURE_DEVICE}" && fswebcam_args+=("--device=${CAPTURE_DEVICE}")
    test -n "${CAPTURE_RESOLUTION}" && fswebcam_args+=("--resolution=${CAPTURE_RESOLUTION}")
    test -n "${BANNER_TITLE}" && fswebcam_args+=("--title=${BANNER_TITLE}")
    test -n "${HIDE_BANNER}" && fswebcam_args+=("--no-banner")
    test -n "${HIDE_INFO}" && fswebcam_args+=("--no-info")

    while true; do
        local ts fn
        ts=$(date +"%Y-%m-%d_%H%M%S"); fn="/data/${ts}.jpg"
        fswebcam "${fswebcam_args[@]}" "${fn}"
        cp "${fn}" "${WORKDIR-/usr/src/app}/html/webcam.jpg"
        echo "Captured ${fn}, sleeping..."
        sleep "${w}"
    done
}

main; unset -f main
