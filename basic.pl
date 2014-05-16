#!/usr/bin/env perl
use strict;
use warnings;
# The two additional lines request from perl to catch various common problems 
# in your code. They check different things so you need both. A potential problem 
# caught by use strict; will cause your code to stop immediately when it is 
# encountered, while use warnings; will merely give a warning (like the 
# command-line switch -w) and let your code run. To read more about them check 
# their respective manual pages at strict and warnings.
#
# 所以类似shell中的 set -e 
# ("Exit immediately if a simple command exits with a non-zero status.")

#
# 原文： http://perldoc.perl.org/perlintro.html
#

# Basic syntax
print "hello world\n"; # ; (python don't use ;)
print("hello world\n");

# Variable
# There is no need to pre-declare your variable types, but you have to declare 
# them using the my keyword the first time you use them. (This is one of the 
# requirements of use strict; .)

# 1. scalar
my $animal = "camel"; # 定义变量也要加上$ , why？
my $answer = 42;

print "$animal\n";
print "The suqare of the answer is: ", $answer * $answer, "\n";

# 2. array
my @animals = ("Camel", "llama", "owl");
my @numbers = (1, 3, 5);
my @mixed = ("Camel", 3, 12.25);

print $animals[0], "\n";
print $animals[1], "\n";

# The special variable $#array tells you the index of the last element of an array
# 类似awk中NF
print $mixed[$#mixed], "\n"; 

# You might be tempted to use $#array + 1 to tell you how many items there are 
# in an array. Don't bother. As it happens, using @array where Perl expects to 
# find a scalar value ("in scalar context") will give you the number of elements 
# in the array:
# perl会根据上下问判断，你是否是要使用数组大小
if (@animals < 5) {
	print "animals size less than 5\n";
}
print "animals:", @animals, "\n";

# array slice
print "animals[0,1]:", @animals[0,1], "\n";
print "animals[0..2]:", @animals[0..2], "\n";
print "animals[1..$#animals]:", @animals[1..$#animals], "\n";

# sort ...
my $sorted = sort @animals;
my $reverse = reverse @numbers;
# There are a couple of special arrays too, such as @ARGV (the command line 
# arguments to your script) and @_ (the arguments passed to a subroutine). 
# These are documented in perlvar.


# 3. hashes
my %fruit_color1 = ("apple", "red", "banana", "yellow");
my %fruit_color = ( 
	apple => "red",
	banana => "yellow",
);

print $fruit_color{"apple"}, "\n";

my @fruit_keys = keys %fruit_color; # get keys
my @fruit_vals = values %fruit_color; # get values
# Just like special scalars and arrays, there are also special hashes. The most 
# well known of these is %ENV which contains environment variables. Read all 
# about it (and other special variables) in perlvar.

my $variables = {
	scalar => {
		description => "single item",
		sigil => '$',
	},
	array => {
		description => "ordered list of items",
		sigil => '@',
	},
	hash => {
		description => "key/value pairs",
		sigil => '%',
	},
};
print "Scalar begins with a $variables->{'scalar'}->{'sigil'}\n";

# Variables Scope
# use my : local
# don't use my : global
my $x = "foo";
my $some_condition = 1;
if ($some_condition) {
	my $y = "bar";
	print $x; # prints "foo"
	print $y; # prints "bar"
}
print $x; # prints "foo"
#print $y; # prints nothing; $y has fallen out of scope
# Using my in combination with a use strict; at the top of your Perl scripts 
# means that the interpreter will pick up certain common programming errors. 
# For instance, in the example above, the final print $y would cause a 
# compile-time error and prevent you from running the program. Using strict is 
# highly recommended.

# Flow Contral
# 1. if
# 
#    if ( condition ) {
#    ...
#    } elsif ( other condition ) {
#    ...
#    } else {
#    ...
#    }

#    unless ( condition ) {
#    ...
#    } 
# same as:
#    if ( !condition ) {
#    ...
#    }

# the traditional way
my $zippy = 1;
my $bananas = 0;
if ($zippy) {
	print "Yow!";
}
# the Perlish post-condition way
print "Yow!" if $zippy;
print "We have no bananas\n" unless $bananas;

# 2. while
#    while ( condition ) {
#    ...
#    }
#
#    There's also a negated version, for the same reason we have unless :
#
#    until ( condition ) {
#    ...
#    }
#
#You can also use while in a post-condition:

#print "LA LA LA\n" while 1; # loops forever

# 3. for
#
#    Exactly like C:
#
#        for ($i = 0; $i <= $max; $i++) {
#        ...
#        }
#
#    The C style for loop is rarely needed in Perl since Perl provides the more friendly list scanning foreach loop.
#    foreach
my @array = (1,2,3);
foreach (@array) {
	print "This element is $_\n";
}
my @list = (1,2,3);
my $max=$#list;
print $list[$_] foreach 0 .. $max;
# you don't have to use the default $_ either...
my %fruitcolor = ( 
	apple => "red",
	banana => "yellow",
);

foreach my $key (keys %fruitcolor) {
	print "The value of $key is $fruitcolor{$key}\n";
}
# The foreach keyword is actually a synonym for the for keyword. See Foreach Loops in perlsyn.
# For more detail on looping constructs (and some that weren't mentioned in this overview) see perlsyn.
