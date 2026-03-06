function build
    if test (count $argv) -lt 1
        echo "Usage:"
        echo "  build <file.cpp>"
        echo "  build <file.cpp> <input.txt>"
        echo "  build <file.cpp> <input.txt> <output.txt>"
        echo "  build <file.cpp> --only"
        return 1
    end
    
    set src $argv[1]
    set base (string replace -r '\.cpp$' '' $src)
    set exe "./$base"
    
    if not test -f $src
        echo "Error: $src not found"
        return 1
    end
    
    set start (date +%s)
    
    echo "▶ Compiling $src ..."
    
    clang++ \
                -Wall \
                -g \
                -march=native \
                -std=c++20 \
                -pipe \
                -fuse-ld=lld \
                $src -o $base
    
    set ret $status
    set elapsed (math (date +%s) - $start)
    
    if test $ret -ne 0
        echo "✖ Compilation failed ({$elapsed}s)"
        return 1
    end
    
    echo "✔ Compilation finished in {$elapsed}s → $exe"
    printf '\a'   # terminal bell
    
    # compile only
    if test (count $argv) -ge 2; and test $argv[2] = "--only"
        return 0
    end
    
    # run
    switch (count $argv)
        case 1
            $exe
        case 2
            $exe < $argv[2]
        case '*'
            $exe < $argv[2] > $argv[3]
    end
end
