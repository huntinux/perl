#!/usr/bin/perl

use lib "./"; # 将当前路径增加到module搜索路径 @INC 
use English;
use Test::Base;

sub plural { English::plural(shift) }

run_is 'input' => 'expected';

__END__

=== plural test 1
--- input chomp plural
leaf
--- expected chomp
leaves

=== plural test 2
--- input chomp plural
goose
--- expected chomp
geese
