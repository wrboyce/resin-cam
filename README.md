# resin-cam

Simple "90s style" webcam, using [fswebcam](https://github.com/fsphil/fswebcam) to capture static
images and serve them via simple html/meta-refresh. Historic images are stored for future
timelapse creation.

Tested with a Raspberry Pi 3 and a Logitech C920, but it should work with most combinations.

## Getting Started

* Set up your device and camera
* Sign up for free on [resin.io](https://dashboard.resin.io/signup), create an application for your
  device, and provision it. You should see the new device appear on the dashboard after a couple
  of minutes.
* Push the contents of this repo to your Resin.io application
* Enable the device URL on your dashboard (it's the chain icon in the top right
  on the device's page)
* Open the devices URL (it's in the dropdown under the previous button)
* Optionally configure any application-wide or per-device settings (they're under
  Environment Variables in the left sidebar); the available settings are detailed below.

## Variables

* `TIMELAPSE_DELTA` -- how often an image should be captured, in seconds (default: 3)
* `CAPTURE_DEVICE` -- the device `fswebcam` should use (default: `/dev/video0`)
* `CAPTURE_RESOLUTION` -- specifies the resolution of captured images (default: fswebcam default)
* `BANNER_TITLE` -- Shows a title in the banner of the image (default: none)
* `HIDE_BANNER` -- Hides the banner from the image (default: false)
* `HIDE_INFO` -- Hides the timestamp info from the image (default: false)
