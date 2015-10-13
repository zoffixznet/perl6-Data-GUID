#!/usr/bin/env perl6

use lib 'lib';
use Data::GUID;
say Data::GUID.new.hex;
