// I never bound to C++ before so I am figuring this out.
#include <iostream>

extern "C"
{
  namespace blah
  {

    void print_hi()
    {
      std::cout << "hi\n";
    }

  }
}