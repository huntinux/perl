package English;

# 返回单词的复数
sub plural {

    my $word = shift;

    # 以s/x/sh/ch结尾的情况
    if ( $word =~ /(s|x|sh|ch)$/ ) {
        $word .= 'es';
    }

    # 以辅音+y结尾的情况
    elsif ( $word =~ /[^aeiou]y$/ ) {
        $word =~ s/y$/ies/;
    }

    # 以f结尾的情况
    elsif ( $word =~ /f$/ ) {
        $word =~ s/f$/ves/;
    }

    # 其他情况
    else {
        $word .= 's';
    }

    return $word;
}

#print plural("cat"), "\n";
1;
