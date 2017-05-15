#!/usr/bin/env bash

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
