#!/bin/bash

# Functions example

function foo1
{
    echo "Foo1 - A Basic Function"
}

# Below is also a function but using a different way of input

foo2 ()
{
    echo "Foo2 Function" $1 $2
    echo "All input variables in Foo2" $*
}

foo1 
foo2 Hi There Everyone 2