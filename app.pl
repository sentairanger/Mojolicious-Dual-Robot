#!/usr/bin/env perl
use Mojolicious::Lite -signatures;
use strict;
use warnings;
use RPi::PIGPIO ':all';
use RPi::PIGPIO::Device::LED;

plugin 'Prometheus';

# define Pis
my $pi = RPi::PIGPIO->connect('192.168.0.10');
my $pi2 = RPi::PIGPIO->connect('192.168.0.23');

# Define the pins
#Torvalds
$pi->set_mode(7, PI_OUTPUT);
$pi->set_mode(8, PI_OUTPUT);
$pi->set_mode(9, PI_OUTPUT);
$pi->set_mode(10, PI_OUTPUT);
#Linus
$pi2->set_mode(12, PI_OUTPUT);
$pi2->set_mode(26, PI_OUTPUT);
$pi2->set_mode(13, PI_OUTPUT);
$pi2->set_mode(21, PI_OUTPUT);
$pi2->set_mode(17, PI_OUTPUT);
$pi2->set_mode(27, PI_OUTPUT);

my $linus = RPi::PIGPIO::Device::LED->new($pi2,16);
my $torvalds = RPi::PIGPIO::Device::LED->new($pi,25);

# Home route
get '/' => sub ($c) {
  $c->render(template =>'home');
};

# Directions for both robots
get '/forward' => sub ($c) {
  $pi->write(7, LOW);
  $pi->write(8, HI);
  $pi->write(9, HI);
  $pi->write(10, LOW);
  $c->render(template =>'home');
};

get '/backward' => sub ($c) {
  $pi->write(7, HI);
  $pi->write(8, LOW);
  $pi->write(9, LOW);
  $pi->write(10, HI);
  $c->render(template =>'home');
};


get '/left' => sub ($c) {
  $pi->write(7, HI);
  $pi->write(8, LOW);
  $pi->write(9, HI);
  $pi->write(10, LOW);
  $c->render(template =>'home');
};

get '/right' => sub ($c) {
  $pi->write(7, LOW);
  $pi->write(8, HI);
  $pi->write(9, LOW);
  $pi->write(10, HI);
  $c->render(template =>'home');
};

get '/stop' => sub ($c) {
  $pi->write(7, LOW);
  $pi->write(8, LOW);
  $pi->write(9, LOW);
  $pi->write(10, LOW);
  $c->render(template =>'home');
};

get '/north' => sub ($c) {
    $pi2->write(13, HI);
    $pi2->write(21, LOW);
    $pi2->write(17, HI);
    $pi2->write(27, LOW);
    $c->render(template =>'home');
};

get '/south' => sub ($c) {
  $pi2->write(13, LOW);
  $pi2->write(21, HI);
  $pi2->write(17, LOW);
  $pi2->write(27, HI);
  $c->render(template =>'home');
};

get '/west' => sub ($c) {
  $pi2->write(13, LOW);
  $pi2->write(21, HI);
  $pi2->write(17, HI);
  $pi2->write(27, LOW);
  $c->render(template =>'home');
};

get '/east' => sub ($c) {
  $pi2->write(13, HI);
  $pi2->write(21, LOW);
  $pi2->write(17, LOW);
  $pi2->write(27, HI);
  $c->render(template =>'home');
};

get '/stoptwo' => sub ($c) {
  $pi2->write(13, LOW);
  $pi2->write(21, LOW);
  $pi2->write(17, LOW);
  $pi2->write(27, LOW);
  $c->render(template =>'home');
};

## LED control for Linus and Torvalds
get '/linuson' => sub ($c) {
  $linus->on;
  $c->render(template =>'home');
};

get '/linusoff' => sub ($c) {
  $linus->off;
  $c->render(template =>'home');
};


get '/torvaldson' => sub ($c) {
  $torvalds->on;
  $c->render(template =>'home');
};

get '/torvaldsoff' => sub ($c) {
  $torvalds->off;
  $c->render(template =>'home');
};

## PWM Control
get '/thirty' => sub ($c) {
  $pi2->write_pwm(12, 77);
  $pi2->write_pwm(26, 77);
  $c->render(template =>'home');
};

get '/fifty' => sub ($c) {
  $pi2->write_pwm(12, 128);
  $pi2->write_pwm(26, 128);
  $c->render(template =>'home');
};

get '/full' => sub ($c) {
  $pi2->write_pwm(12, 255);
  $pi2->write_pwm(26, 255);
  $c->render(template =>'home');
};

# Run app at port 8080
app->start('daemon', '-l', 'http://0.0.0.0:8080');