# Mojolicious-Dual-Robot
Controlling two or more robots using Perl's Mojolicious web framework and the PiGPIO Perl module

## Getting Started

As in previous projects I will break down each layer of the project but first it's important to know how to run the base code. I have provided a `cpanfile` to make it easier to install the packages. Make sure to have `cpanm` installed in your system. Then, you can run `cpanm --installdeps .`. Then the dependencies should install. Next, you can build the application with `mojo generate lite-app app.pl` and then run with `./app.pl`. Go to `0.0.0.0:8080` and then run your robots. Note that Remote GPIO access needs to be enabled by default. You can either run `sudo pigpiod` on your Pis, run `sudo raspi-config` and then enable remote GPIO under interfaces or go to the Raspberry Pi Configuration Menu and enable Remote GPIO.

![App](https://github.com/sentairanger/Mojolicious-Dual-Robot/blob/main/mojo-robot.png)
